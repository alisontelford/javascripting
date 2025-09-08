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
              width = 12,
              shinydashboard::box(
                title = div("Notes", style = "font-weight: bold; text-align: center"),
                width = 12,
                HTML(
                  "
                  <strong>Features</strong><br>
                  <ul>
                  <li> 'Status' column added containing checkboxes </li>
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
                collapsible = TRUE,
                collapsed = TRUE,
                fluidRow(
                  column(
                    width = 12,
                    verbatimTextOutput(NS(id, "code_v2"))
                  )
                )
              ),
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
                  <li> No select all option. </li>
                  </ul>
                  "
                )
              )
            )
          ),
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
                    DT::DTOutput(NS(id, "table_v3"))
                  )
                )
              )
            ),
            column(
              width = 7,
              shinydashboard::box(
                title = div("Code", style = "font-weight: bold; text-align: center"),
                width = 12,
                collapsible = TRUE,
                collapsed = TRUE,
                fluidRow(
                  column(
                    width = 12,
                    verbatimTextOutput(NS(id, "code_v3"))
                  )
                )
              ),
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
                  <li> Now has select all functionality </li>
                  </ul> <br>
                  <strong>Why this doesn't work well</strong><br>
                  <ul>
                  <li>  </li>
                  </ul>
                  "
                )
              )
            )
          ),
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
                    DT::DTOutput(NS(id, "table_v4"))
                  )
                )
              )
            ),
            column(
              width = 7,
              shinydashboard::box(
                title = div("Code", style = "font-weight: bold; text-align: center"),
                width = 12,
                collapsible = TRUE,
                collapsed = TRUE,
                fluidRow(
                  column(
                    width = 12,
                    verbatimTextOutput(NS(id, "code_v4"))
                  )
                )
              ),
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
          dplyr::mutate(
            select = sprintf('<input type="checkbox" class="row_checkbox" value="%s">', dplyr::row_number())
          ) |> 
          dplyr::select(
            select,
            Petal.Length,
            Petal.Width,
            Species
          ),
        selection = "none",
        escape = FALSE,
        options = list(
          dom = 'Blrtip',
          paging = TRUE,
          scrollX = TRUE,
          pageLength = 5
        ),
        callback = htmlwidgets::JS(sprintf("
          // When the table first draws...
          table.on('draw', function(){
            // Attach a change handler to all checkboxes, when a change is detected
            // run the following
            $('.row_checkbox').on('change', function(){
              // Create a new variable to store the selected rows
              var selected = [];
              // When a checkbox is ticked...
              $('.row_checkbox:checked').each(function(){
                // Assign the value of the checkbox to the variable 'selected'
                selected.push($(this).val());
              });
              // Send selected values to Shiny
              Shiny.setInputValue('%s', selected);
            })
          });
        ", ns("v2_selected_rows")
        )),
        rownames = FALSE
      )
    })
    
    output$code_v2 <- renderText({
      "DT::renderDT({
        DT::datatable(
          iris |> 
            dplyr::mutate(
              select = sprintf('<input type='checkbox' class='row_checkbox' value='%s'>', dplyr::row_number())
            ) |> 
            dplyr::select(
              select,
              Petal.Length,
              Petal.Width,
              Species
            ),
          selection = 'none',
          escape = FALSE,
          options = list(
            dom = 'Blrtip',
            paging = TRUE,
            scrollX = TRUE,
            pageLength = 5
          ),
          callback = htmlwidgets::JS(sprintf('
            // When the table first draws...
            table.on('draw', function(){
              // Attach a change handler to all checkboxes, when a change is detected
              // run the following
              $('.row_checkbox').on('change', function(){
                // Create a new variable to store the selected rows
                var selected = [];
                // When a checkbox is ticked...
                $('.row_checkbox:checked').each(function(){
                  // Assign the value of the checkbox to the variable 'selected'
                  selected.push($(this).val());
                });
                // Send selected values to Shiny
                Shiny.setInputValue('%s', selected);
              })
            });
          ', ns('v2_selected_rows')
          )),
          rownames = FALSE
        )
      })"
    })
    
    output$js_code_v2 <- renderText({
      "htmlwidgets::JS(sprintf('
      
        // When the table first draws...
        table.on('draw', function(){
        
          // Attach a change handler to all checkboxes, when a change is detected
          // run the following
          $('.row_checkbox').on('change', function(){
          
            // Create a new variable to store the selected rows
            var selected = [];
            
            // When a checkbox is ticked...
            $('.row_checkbox:checked').each(function(){
            
              // Assign the value of the checkbox to the variable 'selected'
              selected.push($(this).val());
            });
            
            // Send selected values to Shiny
            Shiny.setInputValue('%s', selected);
          })
        });
        ', ns('v2_selected_rows')
        ))"
    })

    output$rows_selected_v2 = renderText({
      paste0(input$v2_selected_rows)
    })
    
    output$table_v3 <- DT::renderDT({
      DT::datatable(
        iris |> 
          dplyr::mutate(
            select = sprintf('<input type="checkbox" class="row_checkbox" value="%s">', dplyr::row_number())
          ) |> 
          dplyr::select(
            select,
            Petal.Length,
            Petal.Width,
            Species
          ),
        selection = "none",
        escape = FALSE,
        options = list(
          dom = 'Blrtip',
          paging = TRUE,
          scrollX = TRUE,
          pageLength = 5
        ),
        callback = htmlwidgets::JS(sprintf("
        var selectedRows = {};
          table.on('draw', function() {

          // Rebind individual checkbox change
          table.rows().nodes().to$().find('.row_checkbox').off('change').on('change', function(){
            var val = $(this).val();
            selectedRows[val] = this.checked;

            var selected = Object.keys(selectedRows).filter(function(key){
              return selectedRows[key];
            });
            Shiny.setInputValue('%s', selected);
          })
        });
        ", ns("v3_selected_rows")
        )),
        rownames = FALSE
      )
    })
    
    output$code_v3 <- renderText({
      "DT::renderDT({
        DT::datatable(
          iris |> 
            dplyr::mutate(
              select = sprintf('<input type='checkbox' class='row_checkbox' value='%s'>', dplyr::row_number())
            ) |> 
            dplyr::select(
              select,
              Petal.Length,
              Petal.Width,
              Species
            ),
          selection = 'none',
          escape = FALSE,
          options = list(
            dom = 'Blrtip',
            paging = TRUE,
            scrollX = TRUE,
            pageLength = 5
          ),
          callback = htmlwidgets::JS(sprintf('
            var selectedRows = {};
            table.on('draw', function() {
              
              // Rebind individual checkbox change
              table.rows().nodes().to$().find('.row_checkbox').off('change').on('change', function(){
                var val = $(this).val();
                selectedRows[val] = this.checked;
                
                var selected = Object.keys(selectedRows).filter(function(key){
                  return selectedRows[key];
                });
                Shiny.setInputValue('%s', selected);
              })
            });
            ', ns('v3_selected_rows')
          )),
          rownames = FALSE
        )
      })"
    })
    
    output$js_code_v3 <- renderText({
      "htmlwidgets::JS(sprintf('
        // Initialise the selectedRows object
        var selectedRows = {};
        
        // When the table first draws...
        table.on('draw', function() {
        
          // 1. Look in the table rows and find the checkboxes 
          // 2. Remove any previous bindings to those checkboxes
          // 3. Create new event bindings
          table.rows().nodes().to$().find('.row_checkbox').off('change').on('change', function(){
          
            // Create a new variable val which is set to the row number of the checkbox that changed.
            var val = $(this).val();
            
            // In selectedRows assign the 'key': val as the value of the checkbox
            selectedRows[val] = this.checked;
            
            // Filter selectedRows by the keys that are true and assign to the variable selected
            var selected = Object.keys(selectedRows).filter(function(key){
              return selectedRows[key];
            });
            
            // Send selected values to Shiny
            Shiny.setInputValue('%s', selected);
          })
        });
        ', ns('v3_selected_rows')
      ))"
    })
    
    output$rows_selected_v3 = renderText({
      paste0(input$v3_selected_rows)
    })
    
    output$table_v4 <- DT::renderDT({
      DT::datatable(
        iris |> 
          dplyr::mutate(
            select = sprintf('<input type="checkbox" class="row_checkbox" value="%s">', dplyr::row_number())
          ) |> 
          dplyr::select(
            select,
            Petal.Length,
            Petal.Width,
            Species
          ),
        selection = "none",
        escape = FALSE,
        options = list(
          dom = 'Blrtip',
          paging = TRUE,
          scrollX = TRUE,
          pageLength = 5
        ),
        callback = htmlwidgets::JS(sprintf("
        var selectedRows = {};
          table.on('draw', function() {

          // Rebind individual checkbox change
          table.rows().nodes().to$().find('.row_checkbox').off('change').on('change', function(){
            var val = $(this).val();
            selectedRows[val] = this.checked;

            var selected = Object.keys(selectedRows).filter(function(key){
              return selectedRows[key];
            });
            Shiny.setInputValue('%s', selected);
          })
        });
        ", ns("v4_selected_rows")
        )),
        rownames = FALSE
      )
    })
    
    output$code_v4 <- renderText({
      "DT::renderDT({
        DT::datatable(
          iris |> 
            dplyr::mutate(
              select = sprintf('<input type='checkbox' class='row_checkbox' value='%s'>', dplyr::row_number())
            ) |> 
            dplyr::select(
              select,
              Petal.Length,
              Petal.Width,
              Species
            ),
          selection = 'none',
          escape = FALSE,
          options = list(
            dom = 'Blrtip',
            paging = TRUE,
            scrollX = TRUE,
            pageLength = 5
          ),
          callback = htmlwidgets::JS(sprintf('
            var selectedRows = {};
            table.on('draw', function() {
              
              // Rebind individual checkbox change
              table.rows().nodes().to$().find('.row_checkbox').off('change').on('change', function(){
                var val = $(this).val();
                selectedRows[val] = this.checked;
                
                var selected = Object.keys(selectedRows).filter(function(key){
                  return selectedRows[key];
                });
                Shiny.setInputValue('%s', selected);
              })
            });
            ', ns('v4_selected_rows')
          )),
          rownames = FALSE
        )
      })"
    })
    
    output$js_code_v3 <- renderText({
      "htmlwidgets::JS(sprintf('
        // Initialise the selectedRows object
        var selectedRows = {};
        
        // When the table first draws...
        table.on('draw', function() {
        
          // 1. Look in the table rows and find the checkboxes 
          // 2. Remove any previous bindings to those checkboxes
          // 3. Create new event bindings
          table.rows().nodes().to$().find('.row_checkbox').off('change').on('change', function(){
          
            // Create a new variable val which is set to the row number of the checkbox that changed.
            var val = $(this).val();
            
            // In selectedRows assign the 'key': val as the value of the checkbox
            selectedRows[val] = this.checked;
            
            // Filter selectedRows by the keys that are true and assign to the variable selected
            var selected = Object.keys(selectedRows).filter(function(key){
              return selectedRows[key];
            });
            
            // Send selected values to Shiny
            Shiny.setInputValue('%s', selected);
          })
        });
        ', ns('v4_selected_rows')
      ))"
    })
    
    output$rows_selected_v3 = renderText({
      paste0(input$v4_selected_rows)
    })
    
  })
}
    
## To be copied in the UI
# mod_embedded_checkbox_in_table_ui("embedded_checkbox_in_table_1")
    
## To be copied in the server
# mod_embedded_checkbox_in_table_server("embedded_checkbox_in_table_1")
