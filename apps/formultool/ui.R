#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

leftColumnSize = 3
centerColumnSize = 6
rightColumnSize = 3

outputDir <- "responses"

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  # Application title
  # titlePanel("AttrakDiff Test"),
  navbarPage(
    "AttrakDiff",
    tabPanel(
      "Questions",
      h2("Consigne générale du questionnaire"),
      p("Dans le cadre d’un projet sur l’expérience utilisateur, nous souhaiterions évaluer vos impressions sur l'outil en ligne de formulation de produit cosmétique FomrulTool. Ce questionnaire se présente sous forme de paires de mots pour vous assister dans l’évaluation du système. Chaque paire représente des contrastes. Les échelons entre 
les deux extrémités vous permettent de décrire l’intensité de la qualité choisie. Ne pensez qu'aux paires de mots et essayez simplement de donner une réponse spontanée. Vous pourrez avoir l’impression que certains termes ne décrivent pas correctement le système. Dans ce cas, assurez-vous de donner tout de même une réponse. Gardez à l’esprit qu’il n’y a pas de bonne ou mauvaise 
réponse. Seule votre opinion compte !"),
      h1("Questions 1/3"),
      fluidRow(class ="evalItem", column(leftColumnSize, align="Right", "Humain"),
        column(centerColumnSize, radioButtons(
          "QP1",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected = 0, 
        ), align="Center"),
        column(rightColumnSize, align="Left", "Technique")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "M'isole"),
        column(centerColumnSize, radioButtons(
          "QHI1",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Me sociabilise")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Plaisant"),
        column(centerColumnSize, radioButtons(
          "ATT1",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Déplaisant")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Original"),
        column(centerColumnSize, radioButtons(
          "QHS1",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Conventionnel")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Simple"),
        column(centerColumnSize, radioButtons(
          "QP2",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Compliqué")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Professionnel"),
        column(centerColumnSize, radioButtons(
          "QHI2",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Amateur")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Laid"),
        column(centerColumnSize, radioButtons(
          "ATT2",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Beau")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Pratique"),
        column(centerColumnSize, radioButtons(
          "QP3",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Pas Pratique")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Agreable"),
        column(centerColumnSize, radioButtons(
          "ATT3",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Désagréable")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Fastidieux"),
        column(centerColumnSize, radioButtons(
          "QP4",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Efficace")
      ),
      h1("Questions 2/3"),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "De bon goût"),
        column(centerColumnSize, radioButtons(
          "QHI3",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "De mauvais goût")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Prévisible"),
        column(centerColumnSize, radioButtons(
          "QP5",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Imprévisible")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Bas de Gamme"),
        column(centerColumnSize, radioButtons(
          "QHI4",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Haut de gamme")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "M'exclut"),
        column(centerColumnSize, radioButtons(
          "QHI5",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "M'intègre")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Me rapproche des autres"),
        column(centerColumnSize, radioButtons(
          "QHI6",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Me sépare des autres")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Non présentable"),
        column(centerColumnSize, radioButtons(
          "QHI7",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Présentable")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Rebutant"),
        column(centerColumnSize, radioButtons(
          "ATT4",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Attirant")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Sans imagination"),
        column(centerColumnSize, radioButtons(
          "QHS2",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Créatif")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Bon"),
        column(centerColumnSize, radioButtons(
          "ATT5",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Mauvais")
      ),
      # part 3
      h1("Questions 3/3"),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Confus"),
        column(centerColumnSize, radioButtons(
          "QP6",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Clair")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Repoussant"),
        column(centerColumnSize, radioButtons(
          "ATT6",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Attrayant")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Audaciaux"),
        column(centerColumnSize, radioButtons(
          "QHS3",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Prudent")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Novateur"),
        column(centerColumnSize, radioButtons(
          "QHS4",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Conservateur")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Ennuyeux"),
        column(centerColumnSize, radioButtons(
          "QHS5",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Captivant")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Peu exigeant"),
        column(centerColumnSize, radioButtons(
          "QHS6",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Challenging")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Motivant"),
        column(centerColumnSize, radioButtons(
          "ATT7",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Décourageant")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Nouveau"),
        column(centerColumnSize, radioButtons(
          "QHS7",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Commun")
      ),
      fluidRow(
        class ="evalItem", column(leftColumnSize, align="Right", "Incontrôlable"),
        column(centerColumnSize, radioButtons(
          "QP7",
          NULL,
          choices = list(-3, -2,-1, 0, 1, 2, 3),
          inline = TRUE, selected =0
        ), align="Center"),
        column(rightColumnSize, align="Left", "Maîtrisable")
      ),
      verbatimTextOutput("saved"),
      column(12, align="center", actionButton("save", "Enregistrer", style="color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-bottom: 40 px"))      
    ),
    tabPanel("Results", 

             h1("Données Brutes"),
             p("Details des évaluations pour chaque utilisateur."),
             tabsetPanel(
               #tabPanel("Plot", plotOutput("diagDetailMoy")),
               tabPanel("Table", dataTableOutput("rawData")),
               tabPanel("Download", p("Télécharger l'ensemble des données collectées pour chaque individu."), downloadButton("downloadRawData", "Download"))
             ),
             hr(),
             h1("Diagrammes et Données par Paire de Mots"),
             p("Les valeurs moyennes pour chaque paire de mots est calculé à partir des évaluations des utilisateurs. Les données sont représentées sur un diagramme centré en 0 pour distinguer très rapidement quels aspects sont perçus comme négatifs et quels aspects sont perçus comme positifs."),
             p("Les valeurs extrêmes (entre -2 et -3 ou à l’inverse entre +2 et +3) sont particulièrement intéressantes. Elles montrent quelles dimensions sont critiques ou au contraire particulièrement posi5ves, et appellent à des actions d’amélioration sur ces aspects."),
             tabsetPanel(
               tabPanel("Plot", plotOutput("diagDetailMoy2")),
               tabPanel("Table", dataTableOutput("motsMoy")),
               tabPanel("Download", p("Télécharger la moyenne des résultats pour chaque item."), downloadButton("downloadData", "Download"))
             ),
             hr(),
             h1("Diagrammes et Données par Sous-echelles"),
             p("AttrakDiff structure les paires de mots en sous-échelle. La moyenne des paires de mots par sous-échelle permet d'avoir une vision plus succinte des aspects positifs et négatifs de l'éxperience utilisateur étudié."),
             p("Les valeurs proches de 0 (entre 0 et 1) sont dites standard, c'est-à-dire que le système remplit son objectif sans avoir d’impact négatif. Les valeurs en dehors de cette zone neutre sont à considérer comme des 
points positifs (de 1 à 3) ou négatifs (de -1 à -3) de votre système."),
             tabsetPanel(
               tabPanel("Plot", plotOutput("histDiagValMoy")),
               #tabPanel("Bar Plot", plotOutput("barDiagValMoy")),
               tabPanel("Table", dataTableOutput("valMoy")),
               tabPanel("Download", p("Télécharger la moyenne des résultats pour chaque sous-échelle."), downloadButton("downloadDataSousEch", "Download"))
             ),
             hr(),
             h1("Portfolio des Résultats"),
             p("Une oritention / \"personalité\" du système peut être definit en croisant les évaluations des qualités hédoniques et des qualités paragamtiques."),
             tabsetPanel(
               tabPanel("Plot", plotOutput("portfolio"))
             ),
             ),
             hr(),
             p(em("Developed by"),br("Alex Gabriel - Université de Lorraine - ERPI"),style="text-align:center"),
             p(em("Based on work from"),br("Lallemand, C., Koenig, V., Gronier, G., & Martin, R. (2015). Création et validation d’une version française du questionnaire AttrakDiff pour l’évaluation 
de l’expérience utilisateur des systèmes interactifs, Revue Européenne de Psychologie Appliquée. doi:10.1016/j.erap.2015.08.002
"),style="text-align:center")
  ),
  tags$head(tags$style(".evalItem{background-color:lavender;border-radius: 10px; margin:10px; padding-top:15px} "))
))