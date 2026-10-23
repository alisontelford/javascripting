// checkbox_v2.js

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
    // Send the selected values back to Shiny
    // We're using <<NS>> as a placeholder for the namespaced input value
    Shiny.setInputValue('<<NS>>', selected);
  });
});
