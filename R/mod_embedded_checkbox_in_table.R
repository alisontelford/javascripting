#' embedded_checkbox_in_table UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_embedded_checkbox_in_table_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' embedded_checkbox_in_table Server Functions
#'
#' @noRd 
mod_embedded_checkbox_in_table_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_embedded_checkbox_in_table_ui("embedded_checkbox_in_table_1")
    
## To be copied in the server
# mod_embedded_checkbox_in_table_server("embedded_checkbox_in_table_1")
