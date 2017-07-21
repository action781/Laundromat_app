# server.R

# Laundromat app

library(shiny); library(tidyverse)
source("helpers.R")

function(input, output) {
    output$contents <- renderDataTable({
        
        # input$file1 will be NULL initially. After the user selects
        # and uploads a file, it will be a data frame with 'name',
        # 'size', 'type', and 'datapath' columns. The 'datapath'
        # column will contain the local filenames where the data can
        # be found.
        
        inFile <- input$file1
        
        if (is.null(inFile))
            return(NULL)
        
        table1 <- read.csv(inFile$datapath, header=input$header, sep=input$sep, 
                 quote=input$quote)
        clean_table  <- clean_laundromat_data(table1)  
        clean_table
    })
    
}
