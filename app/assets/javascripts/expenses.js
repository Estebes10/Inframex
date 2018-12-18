jQuery(function() {
    return $('#expense_supplier_name').autocomplete({
        source: $('#expense_supplier_name').data('autocomplete-source')
    });
});
