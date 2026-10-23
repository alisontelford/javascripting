// checkbox_v4.js

// Initialise the selectedRows object
var selectedRows = {};
    // When the table first draws...
    table.on('draw', function() {
        
        // Look in the table rows and find the checkboxes
        table.rows().nodes().to$().find('.row_checkbox').each(function(){
            // Store the row number of each checkbox under the variable val.
            var val = $(this).val();
            // Update the 'checked' property of each checkbox to be checked if the value 
            // stored in selectedRows for this row is true.
            $(this).prop('checked', selectedRows[val] === true);
        });

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
            Shiny.setInputValue('<<NS_ROWS>>', selected);
        })
        
        // 1. On clicking the select all checkbox
        // 2. Look in the table rows and find the checkboxes 
        // 3. Remove any previous bindings to those checkboxes
        // 4. Create new event bindings
        $('#<<NS_SELECTALL>>').off('click').on('click', function(){
            // Store the state of the checkbox under the variable checked.
            var checked = this.checked;

            // Look in the table rows and find the checkboxes
            table.rows().nodes().to$().find('.row_checkbox').each(function(){
                // Store the row number of each checkbox under the variable val.
                var val = $(this).val();
                // Update the 'checked' property of each checkbox to be the
                // state of the select all checkbox.
                $(this).prop('checked', checked);
                // In selectedRows, update all values to match the state of 
                // the select all checkbox
                selectedRows[val] = checked;
            });

            // Filter selectedRows by the keys that are true and assign to the variable selected
            var selected = Object.keys(selectedRows).filter(function(key){
                return selectedRows[key];
            });
            // Send selected values to Shiny
            Shiny.setInputValue('<<NS_ROWS>>', selected);
        });
    });
