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
    tabsetPanel(
      tabPanel(
        "Version 1",
        wellPanel(
          style = "background:rgb(235, 235, 235)",
          fluidRow(
            column(
              width = 5,
              shinydashboard::box(
                title = div("Table", style = "font-weight: bold; text-align: center"),
                width = 12,
                fluidRow(
                  column(
                    width = 12,
                    align = "center",
                    DT::DTOutput(NS(id, "table_v1"))
                  )
                )
              )
            ),
            column(
              width = 7,
              shinydashboard::box(
                title = div("Code", style = "font-weight: bold; text-align: center"),
                width = 12,
                fluidRow(
                  column(
                    width = 12,
                    verbatimTextOutput(NS(id, "code_v1"))
                  )
                )
              )
            )
          )
        )
      ),
      tabPanel(
        "Version 2",
        wellPanel(
          style = "background:rgb(235, 235, 235)",
          fluidRow(
            column(
              width = 5,
              shinydashboard::box(
                title = div("Table", style = "font-weight: bold; text-align: center"),
                width = 12,
                fluidRow(
                  column(
                    width = 12,
                    align = "center",
                    DT::DTOutput(NS(id, "table_v2"))
                  )
                )
              )
            ),
            column(
              width = 7,
              shinydashboard::box(
                title = div("Code", style = "font-weight: bold; text-align: center"),
                width = 12,
                fluidRow(
                  column(
                    width = 12,
                    verbatimTextOutput(NS(id, "code_v2"))
                  )
                )
              )
            )
          ),
          fluidRow(
            column(
              width = 12,
              shinydashboard::box(
                title = div("Rows Selected", style = "font-weight: bold; text-align: center"),
                width = 12,
                htmlOutput(NS(id, "rows_selected_v2"))
              )
            )
          )
        )
      )
    )
  )
}
    
#' embedded_checkbox_in_table Server Functions
#'
#' @noRd 
mod_embedded_checkbox_in_table_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    
    output$table_v1 <- DT::renderDT({
      DT::datatable(
        iris |> 
          dplyr::select(
            Petal.Length,
            Petal.Width,
            Species
          ),
        selection = "none",
        options = list(
          dom = 'Blrtip',
          paging = TRUE,
          scrollX = TRUE,
          pageLength = 5
        ),
        rownames = FALSE
      )
    })
    
    output$code_v1 <- renderText({
      "DT::renderDT({
        DT::datatable(
          iris |> 
            dplyr::select(
              Petal.Length,
              Petal.Width,
              Species
            ),
          selection = 'none',
          options = list(
            dom = 'Blrtip',
            paging = TRUE,
            scrollX = TRUE,
            pageLength = 5
          ),
          rownames = FALSE
        )
      })"
    })
    
    output$table_v2 <- DT::renderDT({
      DT::datatable(
        iris |> 
          dplyr::select(
            Petal.Length,
            Petal.Width,
            Species
          ) |> 
          dplyr::mutate(
            select = sprintf('<input type="checkbox" class="row_checkbox" value="%s">', dplyr::row_number())
          ),
        selection = "none",
        escape = FALSE,
        options = list(
          dom = 'Blrtip',
          paging = TRUE,
          scrollX = TRUE,
          pageLength = 5
        ),
        rownames = FALSE
      )
    })
    
    output$code_v2 <- renderText({
      "DT::renderDT({
        DT::datatable(
          iris |> 
            dplyr::select(
              Petal.Length,
              Petal.Width,
              Species
            ) |> 
            dplyr::mutate(
              select = sprintf('<input type='checkbox' class='row_checkbox' value='%s'>', dplyr::row_number())
            ),
          selection = 'none',
          escape = FALSE,
          options = list(
            dom = 'Blrtip',
            paging = TRUE,
            scrollX = TRUE,
            pageLength = 5
          ),
          rownames = FALSE
        )
      })"
    })
    
  })
}
    
## To be copied in the UI
# mod_embedded_checkbox_in_table_ui("embedded_checkbox_in_table_1")
    
## To be copied in the server
# mod_embedded_checkbox_in_table_server("embedded_checkbox_in_table_1")
