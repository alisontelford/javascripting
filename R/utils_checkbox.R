#' Render a DataTable with embedded checkboxes
#'
#' @param data Data frame to display.
#' @param ns Shiny namespace function.
#' @param selected_input Name of Shiny input to send selected rows.
#' @param options List of DT options.
#' @param js_callback JavaScript callback as htmlwidgets::JS().
#' @return DT::datatable object for DT::renderDT
render_checkbox_dt <- function(data, ns, selected_input, options = list(), js_callback = NULL) {
  data$select <- sprintf('<input type="checkbox" class="row_checkbox" value="%s">', seq_len(nrow(data)))
  DT::datatable(
    data |> dplyr::select(select, dplyr::everything()),
    selection = "none",
    escape = FALSE,
    options = options,
    callback = js_callback,
    rownames = FALSE
  )
}
