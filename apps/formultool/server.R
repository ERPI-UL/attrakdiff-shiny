#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyverse)
library(uuid)


toInvert <- c("QP1", "QP2", "QP3", "QP5", "ATT1", "ATT3", "ATT5", "ATT7", "QHS1", "QHS3", "QHS4", "QHS7", "QHI2", "QHI3", "QHI6")

dataFileName <- "rawData.csv"
fileData <- reactiveFileReader(2000, NULL, dataFileName, read.csv)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  ntext <- eventReactive(input$save, {
    if(! file.exists(dataFileName)){
      h <- data.frame("date","Participant","QP1","QP2","QP3","QP4","QP5","QP6","QP7","QHS1","QHS2","QHS3","QHS4","QHS5","QHS6","QHS7","QHI1","QHI2","QHI3","QHI4","QHI5","QHI6","QHI7", "ATT1","ATT2","ATT3","ATT4","ATT5","ATT6","ATT7")
      write.table(h, file = dataFileName, sep = ",", append = TRUE, quote = FALSE, col.names = FALSE, row.names = FALSE)
    }
    x <- data.frame(date(),UUIDgenerate(),input$QP1,input$QP2,input$QP3,input$QP4,input$QP5,input$QP6,input$QP7,input$QHS1,input$QHS2,input$QHS3,input$QHS4,input$QHS5,input$QHS6,input$QHS7,input$QHI1,input$QHI2,input$QHI3,input$QHI4,input$QHI5,input$QHI6,input$QHI7,input$ATT1,input$ATT2,input$ATT3,input$ATT4,input$ATT5,input$ATT6,input$ATT7)
    write.table(x, file = dataFileName, sep = ",", append = TRUE, quote = FALSE, col.names = FALSE, row.names = FALSE)
    "The data has been saved."
  })
  
  output$saved<- renderText({
    ntext()
  })
  
  
  ##########
  # file processing
  ##########
  if(file.exists(dataFileName)){

    output$rawData <-renderDataTable(fileData())

    # download data of the scales mean
    output$downloadRawData <- downloadHandler(
      filename = "AttrakDiff-raw.csv",
      content = function(file) {
        write.csv(fileData(), file, row.names = FALSE)
      }
    )
    
    dataWoDate <- reactive({subset(fileData(), select = -c(date))})
    
    # format the data from the file
    pivotedData <- reactive({ dataWoDate() %>%
      pivot_longer(
        cols = -Participant,
        names_to = "Variables",
        values_to = "Answers"
      ) })
      
    # invert scale for specific question
    data.2  <- reactive({ pivotedData() %>%
      mutate(
        final_answer =
          case_when(
            is.element(Variables, toInvert) ~ Answers*(-1L),
            TRUE ~ Answers
          )
      ) })
      
  }
  
  
  
  ###########
  # details des ??chelles
  ###########
  if(exists("data.2")){
    # Tableau resume
    Table_I <- reactive({ data.2() %>%
      group_by( Variables ) %>%
      summarise( Moyenne = mean(final_answer)
      ) })
      
    output$motsMoy<- renderDataTable(Table_I())

    output$diagDetailMoy2<- renderPlot({
      Table_I() %>% ggplot() + 
        aes(x = Variables, y=Moyenne, group =1) + 
        geom_line( color="grey" ) +
        geom_point() +
        scale_y_continuous(name="Moyenne", breaks=seq(-3,3,1), limits=c(-3, 3))+
        scale_x_discrete(name="Items", labels=c("ATT1" = "Plaisant - D??plaisant", "ATT2" = "Laid - Beau", "ATT3" = "Agr??able - D??sagr??able", "ATT4" = "Rebutant - Attirant", "ATT5" = "Bon - Mauvais", "ATT6" = "Repoussant - Attrayant", "ATT7" = "Motivant - D??courageant", "QHI1" = "M'isole - Me socialise", "QHI2" = "Professionel - Amateur", "QHI3" = "De bon go??t - De mauvais go??t", "QHI4" = "Bas de gamme - Haut de gamme", "QHI5" = "M'exclut - M'int??gre", "QHI6" = "Me rapproche des autres - Me s??pare des autres", "QHI7" = "Non pr??senatble - Pr??sentable", "QHS1" = "Original - Conventionnel", "QHS2" = "Sans imagination - Cr??atif" , "QHS3" = "Audacieux - Prudent", "QHS4" ="Novateur - Conservateur", "QHS5" = "Ennuyeux - Captivant", "QHS6" = "Peu exigeant - Challeging", "QHS7" = "Nouveau - Commun" ,"QP1" = "Humain - Technique", "QP2"= "Simple - Compliqu??", "QP3" = "Pratique - Pas pratique", "QP4" = "Fastidieux - Efficace", "QP5" = "Pr??visible - Impr??visible", "QP6" = "Confus - Clair", "QP7" = "Incontr??lable - Ma??trisable"))+
        coord_flip() 
    })
    
    # download data of the scales mean
    output$downloadData <- downloadHandler(
      filename = "AttrakDiff-moyEchelles.csv",
      content = function(file) {
        write.csv(Table_I(), file, row.names = FALSE)
      }
    )
  }
  
  
  
  ######################
  #  sous-echelles
  ##################
  if(exists("data.2")){
  Table_II <- reactive({ data.2() %>%
    mutate(
      Factors  =
        case_when(
          str_detect( Variables, "QP") ~ "QP",
          str_detect( Variables, "QHS") ~ "QHS",
          str_detect(Variables, "QHI") ~ "QHI" ,
          str_detect(Variables, "ATT") ~ "ATT" ,
          TRUE ~ "Attentions !!!"
        )
    ) })
    
  
  Table_III <- reactive({ Table_II() %>%
    group_by(Factors) %>%
    summarise(
      Moyenne = mean(final_answer),
      Std = sd(final_answer),
    ) })
    
  
  output$valMoy<- renderDataTable(Table_III())
  
  output$barDiagValMoy <- renderPlot({
    Table_III() %>%
      ggplot( ) +
      aes(x = Factors, y=Moyenne,  fill = Factors ) +
      geom_bar( stat = 'identity') +
      scale_y_discrete(labels=c("ATT" = "Attractivit?? Globale", "QHI" = "Qualit?? H??donique - Identit??", "QHS" = "Qualit?? H??donique - Stimulation", "QP" = "Qualit?? Pragmatique"))+
      ylim(c(-3, 3))+ 
      coord_flip() 
  })
  
  output$histDiagValMoy <- renderPlot({
    Table_III() %>%
      ggplot( ) +
      aes(x = Factors, y=Moyenne, group =1 ) +
      geom_line( color="grey" ) +
      geom_point()+
      scale_y_continuous(name="Moyenne", breaks=seq(-3,3,1), limits=c(-3, 3))+
      scale_x_discrete(name="Sous-??chelles", labels=c("ATT" = "Attractivit?? Globale", "QHI" = "Qualit?? H??donique - Identit??", "QHS" = "Qualit?? H??donique - Stimulation", "QP" = "Qualit?? Pragmatique")) + 
      coord_flip()
  })
  
  # download data of the scales mean
  output$downloadDataSousEch <- downloadHandler(
    filename = "AttrakDiff-moySousEchelles.csv",
    content = function(file) {
      write.csv(Table_III(), file, row.names = FALSE)
    }
  )

  Table_IV <- reactive({
    data.frame(hedonique = c(mean(Table_III()$Moyenne[which(Table_III()$Factors == "QHI")], Table_III()$Moyenne[which(Table_III()$Factors == "QHS")])), pragmatique = c(Table_III()$Moyenne[which(Table_III()$Factors == "ATT")]))
  })

  output$portfolio <- renderPlot({
      Table_IV() %>% ggplot( ) +
      aes(x = pragmatique, y=hedonique) +
      geom_point()+
      scale_y_continuous(name="Qualit?? h??donique", breaks=seq(-3,3,1), limits=c(-3, 3))+
      scale_x_continuous(name="Qualit?? pragmatique", breaks=seq(-3,3,1), limits=c(-3, 3))+
      coord_equal()+ 
      geom_rect(aes(xmin = -3, xmax = -1, ymin = -3, ymax = -1), fill= NA, colour="#000000") +
      geom_text(x=-2, y=-2, label="Superflu")+
      geom_rect(aes(xmin = 1, xmax = 3, ymin = -3, ymax = -1), fill= NA, colour="#000000") +
      geom_text(x=2, y=-2, label="Trop orient?? t??che")+
      geom_rect(aes(xmin = -1, xmax = 1, ymin = -1, ymax = 1), fill= NA, colour="#000000") +
      geom_text(x=0, y=0, label="Neutre")+
      geom_rect(aes(xmin = 1, xmax = 3, ymin = -1, ymax = 1), fill= NA, colour="#000000") +
      geom_text(x=2, y=0, label="Orient?? t??che")+
      geom_rect(aes(xmin = -3, xmax = -1, ymin = 1, ymax = 3), fill= NA, colour="#000000") +
      geom_text(x=-2, y=2, label="Trop orient?? vers le soi")+
      geom_rect(aes(xmin = -1, xmax = 1, ymin = 1, ymax = 3), fill= NA, colour="#000000") +
      geom_text(x=0, y=2, label="Orient?? vers le soi")+
      geom_rect(aes(xmin = 1, xmax = 3, ymin = 1, ymax = 3), fill= NA, colour="#000000") +
      geom_text(x=2, y=2, label="D??sir??")
  })
   
  }
})