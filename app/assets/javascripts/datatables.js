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
        // For large tables, dom: "<'row'<'col-xl-4 col-lg-12'B><'col-xl-4 col-lg-6'l><'col-xl-4 col-lg-6'f>>"
        dom: "<'row'<'col-lg-12'B><'col-lg-6'l><'col-lg-6'f>>" +
            "<'row'<'col-md-12't>><'row'<'col-md-12'ip>>",
        buttons: [
            {
              className: 'btn-info mR-5',
              extend: 'colvis',
              text: 'Filtrar columnas'
            },
            {
              extend: 'copyHtml5',
              className: 'btn-warning mR-5',
              exportOptions: {
                columns: ':visible'
              }
            },
            {
              extend: 'excelHtml5',
              className: 'btn-success mR-5',
              exportOptions: {
                columns: ':visible'
              }
            },
            {
              extend: 'csvHtml5',
              className: 'btn-secondary mR-5',
              exportOptions: {
                columns: ':visible'
              }
            },
            {
              extend: 'pdfHtml5',
              className: 'btn-danger mR-5',
              exportOptions: {
                columns: ':visible'
              }
            },
            {
              extend: 'print',
              className: 'btn-info mR-5',
              exportOptions: {
                columns: ':visible'
              }
            }
        ]
    });
});
