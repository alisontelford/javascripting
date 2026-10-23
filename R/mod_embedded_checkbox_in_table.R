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
              width = 12,
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
            )
          ),
          fluidRow(
            column(
              width = 12,
              shinydashboard::box(
                title = div("DT::renderDT Code", style = "font-weight: bold; text-align: center"),
                width = 12,
                fluidRow(
                  column(
                    width = 12,
                    uiOutput(NS(id, "code_v1"))
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
              width = 12,
              shinydashboard::box(
                title = div("Notes", style = "font-weight: bold; text-align: center"),
                width = 12,
                HTML(
                  "
                  <strong>Features</strong><br>
                  <ul>
                  <li> 'select' column added containing checkboxes </li>
                  <li> State of checkboxes returned to shiny for use on the server side </li>
                  </ul> <br>
                  <strong>Why this doesn't work well</strong><br>
                  <ul>
                  <li> Doesn't handle 'redraws'. E.g. if you move to a new page or use filtering/ordering, the previous selections are forgotten. </li>
                  <li> Currently the entire DOM (Document Obect Model - i.e. UI page) is searched for any checkboxes and their states checked for. This means that it can bind to hidden or irrelevant elements. </li>
                  <li> Because we do 'redraw' the table with pagination and filtering/ordering. It may duplicate event bindings every time this happens.</li>
                  </ul>
                  "
                )
              )
            )
          ),
          fluidRow(
            column(
              width = 12,
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
            )
          ),
          fluidRow(
            column(
              width = 12,
              shinydashboard::box(
                title = div("Rows Selected", style = "font-weight: bold; text-align: center"),
                width = 12,
                verbatimTextOutput(NS(id, "rows_selected_v2"))
              )
            )
          ),
          fluidRow(
            column(
              width = 6,
              shinydashboard::box(
                title = div("DT::renderDT Code", style = "font-weight: bold; text-align: center"),
                width = 12,
                fluidRow(
                  column(
                    width = 12,
                    uiOutput(NS(id, "code_v2"))
                  )
                )
              )
            ),
            column(
              width = 6,
              shinydashboard::box(
                title = div("JS Code", style = "font-weight: bold; text-align: center"),
                width = 12,
                fluidRow(
                  column(
                    width = 12,
                    verbatimTextOutput(NS(id, "js_code_v2"))
                  )
                )
              )
            )
          )
        )
      ),
      tabPanel(
        "Version 3",
        wellPanel(
          style = "background:rgb(235, 235, 235)",
          fluidRow(
            column(
              width = 12,
              shinydashboard::box(
                title = div("Notes", style = "font-weight: bold; text-align: center"),
                width = 12,
                HTML(
                  "
                  <strong>Features</strong><br>
                  <ul>
                  <li> Stores the selection even if the table is filtered/sorted or if you select another page. </li>
                  <li> Now only checks within the table itself for checkboxes. </li>
                  <li> No risk of duplicate event bindings. </li>
                  </ul> <br>
                  <strong>Why this doesn't work well</strong><br>
                  <ul>
                  <li> Whilst the checkbox states are remembered, the checkboxes are 'redrawn' as unchecked when new page selected, or filtering/sorting is performed </li>
                  <li> No select all option. </li>
                  </ul>
                  "
                )
              )
            )
          ),
          fluidRow(
            column(
              width = 12,
              shinydashboard::box(
                title = div("Table", style = "font-weight: bold; text-align: center"),
                width = 12,
                fluidRow(
                  column(
                    width = 12,
                    align = "center",
                    DT::DTOutput(NS(id, "table_v3"))
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
                verbatimTextOutput(NS(id, "rows_selected_v3"))
              )
            )
          ),
          fluidRow(
            column(
              width = 6,
              shinydashboard::box(
                title = div("DT::renderDT Code", style = "font-weight: bold; text-align: center"),
                width = 12,
                fluidRow(
                  column(
                    width = 12,
                    uiOutput(NS(id, "code_v3"))
                  )
                )
              )
            ),
            column(
              width = 6,
              shinydashboard::box(
                title = div("JS Code", style = "font-weight: bold; text-align: center"),
                width = 12,
                fluidRow(
                  column(
                    width = 12,
                    verbatimTextOutput(NS(id, "js_code_v3"))
                  )
                )
              )
            )
          )
        )
      ),
      tabPanel(
        "Version 4",
        wellPanel(
          style = "background:rgb(235, 235, 235)",
          fluidRow(
            column(
              width = 12,
              shinydashboard::box(
                title = div("Notes", style = "font-weight: bold; text-align: center"),
                width = 12,
                HTML(
                  "
                  <strong>Features</strong><br>
                  <ul>
                  <li> Checkboxes 'redrawn' with their saved selected state </li>
                  <li> Added a new checkbox in the column title with select all functionality </li>
                  </ul> <br>
                  <strong>Why this doesn't work well</strong><br>
                  <ul>
                  <li> Only the checkboxes on the current page are all selected when select all is checked. </li>
                  </ul>
                  "
                )
              )
            )
          ),
          fluidRow(
            column(
              width = 12,
              shinydashboard::box(
                title = div("Table", style = "font-weight: bold; text-align: center"),
                width = 12,
                fluidRow(
                  column(
                    width = 12,
                    align = "center",
                    DT::DTOutput(NS(id, "table_v4"))
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
                verbatimTextOutput(NS(id, "rows_selected_v4"))
              )
            )
          ),
          fluidRow(
            column(
              width = 6,
              shinydashboard::box(
                title = div("DT::renderDT Code", style = "font-weight: bold; text-align: center"),
                width = 12,
                fluidRow(
                  column(
                    width = 12,
                    uiOutput(NS(id, "code_v4"))
                  )
                )
              )
            ),
            column(
              width = 6,
              shinydashboard::box(
                title = div("JS Code", style = "font-weight: bold; text-align: center"),
                width = 12,
                fluidRow(
                  column(
                    width = 12,
                    verbatimTextOutput(NS(id, "js_code_v4"))
                  )
                )
              )
            )
          )
        )
      ),
      tabPanel(
        "Version 5",
        wellPanel(
          style = "background:rgb(235, 235, 235)",
          fluidRow(
            column(
              width = 12,
              shinydashboard::box(
                title = div("Notes", style = "font-weight: bold; text-align: center"),
                width = 12,
                HTML(
                  "
                  <strong>Features</strong><br>
                  <ul>
                  <li> All checkboxes selected when select all checkbox checked. </li>
                  </ul> 
                  "
                )
              )
            )
          ),
          fluidRow(
            column(
              width = 12,
              shinydashboard::box(
                title = div("Table", style = "font-weight: bold; text-align: center"),
                width = 12,
                fluidRow(
                  column(
                    width = 12,
                    align = "center",
                    DT::DTOutput(NS(id, "table_v5"))
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
                verbatimTextOutput(NS(id, "rows_selected_v5"))
              )
            )
          ),
          fluidRow(
            column(
              width = 6,
              shinydashboard::box(
                title = div("DT::renderDT Code", style = "font-weight: bold; text-align: center"),
                width = 12,
                fluidRow(
                  column(
                    width = 12,
                    uiOutput(NS(id, "code_v5"))
                  )
                )
              )
            ),
            column(
              width = 6,
              shinydashboard::box(
                title = div("JS Code", style = "font-weight: bold; text-align: center"),
                width = 12,
                fluidRow(
                  column(
                    width = 12,
                    verbatimTextOutput(NS(id, "js_code_v5"))
                  )
                )
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
  shiny::moduleServer(id, function(input, output, session){
    ns <- session$ns

    data <- iris |> 
      dplyr::select(Petal.Length, Petal.Width, Species)

    table_v1_code <- '
output$table_v1 <- DT::renderDT({
  DT::datatable(
    data,
    selection = "none",
    options = list(
      dom = "Blrtip",
      paging = TRUE,
      scrollX = TRUE,
      pageLength = 5
    ),
    rownames = FALSE
  )
})
'

    eval(parse(text = table_v1_code))
    
    output$code_v1 <- renderUI({
      tags$pre(table_v1_code)
    })
    
    table_v2_code <- "
output$table_v2 <- DT::renderDT({
  # Read the JS file, replace placeholder with the actual namespace
  js_string <- readLines(\"inst/app/www/checkbox_v2.js\") |> paste(collapse = \"\\n\")
  js_ns <- gsub('<<NS>>', ns(\"v2_selected_rows\"), js_string)
  data$select <- sprintf('<input type=\"checkbox\" class=\"row_checkbox\" value=\"%s\">', seq_len(nrow(data)))
  
  DT::datatable(
    data |> dplyr::select(select, everything()),
    selection = \"none\",
    escape = FALSE,
    options = list(
      dom = 'Blrtip',
      paging = TRUE,
      scrollX = TRUE,
      pageLength = 5
    ),
    callback = htmlwidgets::JS(js_ns),
    rownames = FALSE
  )
})
"

    eval(parse(text = table_v2_code))

    output$code_v2 <- renderUI({
      tags$pre(table_v2_code)
    })
    
    output$js_code_v2 <- renderText({
      readLines("inst/app/www/checkbox_v2.js") |> paste(collapse = "\n")
    })

    output$rows_selected_v2 = renderText({
      paste0(input$v2_selected_rows)
    })
    
    table_v3_code <- "
  output$table_v3 <- DT::renderDT({
    # Read the JS file, replace placeholder with the actual namespace
    js_string <- readLines(\"inst/app/www/checkbox_v3.js\") |> paste(collapse = \"\\n\")
    js_ns <- gsub('<<NS>>', ns(\"v3_selected_rows\"), js_string)
    data$select <- sprintf('<input type=\"checkbox\" class=\"row_checkbox\" value=\"%s\">', seq_len(nrow(data)))
    
    DT::datatable(
      data |> dplyr::select(select, everything()),
      selection = \"none\",
      escape = FALSE,
      options = list(
        dom = 'Blrtip',
        paging = TRUE,
        scrollX = TRUE,
        pageLength = 5
      ),
      callback = htmlwidgets::JS(js_ns),
      rownames = FALSE
    )
  })
"
    
    eval(parse(text = table_v3_code))

    output$code_v3 <- renderUI({
      tags$pre(table_v3_code)
    })
    
    output$js_code_v3 <- renderText({
      readLines("inst/app/www/checkbox_v3.js") |> paste(collapse = "\n")
    })
    
    output$rows_selected_v3 = renderText({
      paste0(input$v3_selected_rows)
    })
    
    table_v4_code <- "
output$table_v4 <- DT::renderDT({
  # Read the JS file, replace placeholder with the actual namespace
  js_string <- readLines(\"inst/app/www/checkbox_v4.js\") |> paste(collapse = \"\\n\")
  js_ns <- js_ns <- stringr::str_replace_all(js_string, c(
    '<<NS_ROWS>>' = ns(\"v4_selected_rows\"),
    '<<NS_SELECTALL>>' = ns(\"v4_select_all\")
  ))
  data$select <- sprintf('<input type=\"checkbox\" class=\"row_checkbox\" value=\"%s\">', seq_len(nrow(data)))
  
  DT::datatable(
    data |> dplyr::select(select, everything()),
    selection = \"none\",
    escape = FALSE,
    options = list(
      dom = 'Blrtip',
      paging = TRUE,
      scrollX = TRUE,
      pageLength = 5,
      columnDefs = list(
        list(
          targets = 0, 
          orderable = FALSE,
          searchable = FALSE,
          title = sprintf(
            '<label for=\"%s\">Select All: </label> <input type=\"checkbox\" id=\"%s\">', 
            ns(\"v4_select_all\"), 
            ns(\"v4_select_all\")
          )
        )
      )
    ),
    callback = htmlwidgets::JS(js_ns),
    rownames = FALSE
  )
})
"

    eval(parse(text = table_v4_code))

    output$code_v4 <- renderUI({
      tags$pre(table_v4_code)
    })
    
    output$js_code_v4 <- renderText({
      readLines("inst/app/www/checkbox_v4.js") |> paste(collapse = "\n")
    })
    
    output$rows_selected_v4 = renderText({
      paste0(input$v4_selected_rows)
    })
    
    table_v5_code = "
output$table_v5 <- DT::renderDT({
  # Read the JS file, replace placeholder with the actual namespace
  js_string <- readLines(\"inst/app/www/checkbox_v5.js\") |> paste(collapse = \"\\n\")
  js_ns <- stringr::str_replace_all(js_string, c(
    '<<NS_ROWS>>' = ns(\"v5_selected_rows\"),
    '<<NS_SELECTALL>>' = ns(\"v5_select_all\")
  ))
  data$select <- sprintf('<input type=\"checkbox\" class=\"row_checkbox\" value=\"%s\">', seq_len(nrow(data)))
  
  DT::datatable(
    data |> dplyr::select(select, everything()),
    selection = \"none\",
    escape = FALSE,
    options = list(
      dom = 'Blrtip',
      paging = TRUE,
      scrollX = TRUE,
      pageLength = 5,
      columnDefs = list(
        list(
          targets = 0, 
          orderable = FALSE,
          searchable = FALSE,
          title = sprintf(
            '<label for=\"%s\">Select All: </label> <input type=\"checkbox\" id=\"%s\">', 
            ns(\"v5_select_all\"), 
            ns(\"v5_select_all\")
          )
        )
      )
    ),
    callback = htmlwidgets::JS(js_ns),
    rownames = FALSE
  )
}, server = FALSE)
"

    eval(parse(text = table_v5_code))

    output$code_v5 <- renderUI({
      tags$pre(table_v5_code)
    })
    
    output$js_code_v5 <- renderText({
      readLines("inst/app/www/checkbox_v5.js") |> paste(collapse = "\n")
    })
    
    output$rows_selected_v5 = renderText({
      paste0(input$v5_selected_rows)
    })
    
  })
}
