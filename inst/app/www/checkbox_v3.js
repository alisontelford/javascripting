// checkbox_v3.js

// Initialise the selectedRows object
var selectedRows = {};
  // When the table first draws...
  table.on('draw', function() {

  // 1. Look in the table rows and find the checkboxes 
  // 2. Remove any previous bindings to those checkboxes
  // 3. Create new event bindings
  table.rows().nodes().to$().find('.row_checkbox').off('change').on('change', function(){
    // Store the row number of each checkbox under the variable val.
    var val = $(this).val();
    // In selectedRows assign the 'key': val as the value of the checkbox
    selectedRows[val] = this.checked;

    // Filter selectedRows by the keys that are true and assign to the variable selected
    var selected = Object.keys(selectedRows).filter(function(key){
      return selectedRows[key];
    });
    // Send selected values to Shiny
    // We're using <<NS>> as a placeholder for the namespaced input value
    Shiny.setInputValue('<<NS>>', selected);
  })
});