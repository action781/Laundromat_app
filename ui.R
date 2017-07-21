#ui.R

# Laundromat app

library(shiny)
library(shinythemes)
library(DT); library(data.table)

fluidPage(
    titlePanel("Laundromat Date/Time Usage Analysis"),
    theme = "spacelab",
    sidebarLayout(
        sidebarPanel(
            fileInput('file1', 'Choose CSV File',
                      accept=c('text/csv', 
                               'text/comma-separated-values,text/plain', 
                               '.csv')),
            tags$hr(),
            checkboxInput('header', 'Header', TRUE),
            radioButtons('sep', 'Separator',
                         c(Comma=',',
                           Semicolon=';',
                           Tab='\t'),
                         ','),
            radioButtons('quote', 'Quote',
                         c(None='',
                           'Double Quote'='"',
                           'Single Quote'="'"),
                         '"')
        ),
        mainPanel(
            dataTableOutput('contents')
        )
    )
)
