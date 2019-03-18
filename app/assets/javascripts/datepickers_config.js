$( document ).on('ready turbolinks:load', function() {
    $('.datepicker').datepicker({
        dateFormat: 'dd/mm/yyyy'
    });
});