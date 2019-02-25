//Core component
//= require datatables/jquery.dataTables
//Bootstrap4 theme
//= require datatables/dataTables.bootstrap4

//Optional Datatables extensions
//= require datatables/extensions/Responsive/dataTables.responsive
//= require datatables/extensions/Responsive/responsive.bootstrap4
//= require datatables/extensions/Buttons/dataTables.buttons
//= require datatables/extensions/Buttons/buttons.html5
//= require datatables/extensions/Buttons/buttons.print
//= require datatables/extensions/Buttons/buttons.flash
//= require datatables/extensions/Buttons/buttons.bootstrap4
//= require datatables/extensions/Buttons/buttons.colVis

$( document ).on('ready turbolinks:load', function() {
    $('.datatable').DataTable({
      "language": {
        "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
      },
      dom: "<'row'<'col-lg-12 mB-10'B><'col-lg-6'l><'col-lg-6'f>>" +
        "<'row'<'col-md-12't>><'row'<'col-md-12'ip>>",
      buttons: [
        {
          className: 'btn-info btn-sm mR-5',
          extend: 'colvis',
          text: 'Filtrar columnas'
        },
        {
          extend: 'copyHtml5',
          className: 'btn-warning btn-sm mR-5',
          exportOptions: {
            columns: ':visible',
            format: {
              body: function ( data, row, column, node ) {
                // convert booleans to string if switch is activated or disabled
                let is_check = 0;
                try {
                  is_check = $(data).has('input[type="checkbox"]').length;
                } catch (e) {}
                return is_check ?
                  ($(data).find('input[type="checkbox"]').prop('checked') ? 1 : 0) : data;
              }
            }
          }
        },
        {
          extend: 'excelHtml5',
          className: 'btn-success btn-sm mR-5',
          exportOptions: {
            columns: ':visible',
            format: {
              body: function ( data, row, column, node ) {
                // convert booleans to string if switch is activated or disabled
                let is_check = 0;
                try {
                  is_check = $(data).has('input[type="checkbox"]').length;
                } catch (e) {}
                return is_check ?
                  ($(data).find('input[type="checkbox"]').prop('checked') ? 1 : 0) : data;
              }
            }
          }
        },
        {
          extend: 'csvHtml5',
          className: 'btn-secondary btn-sm mR-5',
          exportOptions: {
            columns: ':visible',
            format: {
              body: function ( data, row, column, node ) {
                // convert booleans to string if switch is activated or disabled
                let is_check = 0;
                try {
                  is_check = $(data).has('input[type="checkbox"]').length;
                } catch (e) {}
                return is_check ?
                  ($(data).find('input[type="checkbox"]').prop('checked') ? 1 : 0) : data;
              }
            }
          }
        },
        {
          extend: 'pdfHtml5',
          className: 'btn-danger btn-sm mR-5',
          exportOptions: {
            columns: ':visible',
            format: {
              body: function ( data, row, column, node ) {
                // convert booleans to string if switch is activated or disabled
                let is_check = 0;
                try {
                  is_check = $(data).has('input[type="checkbox"]').length;
                } catch (e) {}
                return is_check ?
                  ($(data).find('input[type="checkbox"]').prop('checked') ? 1 : 0) : data;
              }
            }
          }
        },
        {
          extend: 'print',
          className: 'btn-info btn-sm mR-5',
          exportOptions: {
            columns: ':visible',
            format: {
              body: function ( data, row, column, node ) {
                // convert booleans to string if switch is activated or disabled
                let is_check = 0;
                try {
                  is_check = $(data).has('input[type="checkbox"]').length;
                } catch (e) {}
                return is_check ?
                  ($(data).find('input[type="checkbox"]').prop('checked') ? 1 : 0) : data;
              }
            }
          }
        }
      ]
    });
});
