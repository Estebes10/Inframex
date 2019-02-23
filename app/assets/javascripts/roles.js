$( document ).on('ready turbolinks:load', function() {
    $('#roles-datatable').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        },
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

    $('#roles-datatable tbody').on('click', 'button.delete-role', function (e) {
        console.log("you activate the event");
        e.preventDefault(e);
        var deleteButton = $(this);
        var roleId = $(this).attr("data-role-id");
        deleteRole(roleId, deleteButton);
        return false;
    });
});

function deleteRole(roleId, deleteButton) {
    console.log(roleId);
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar al rol?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar usario!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        spinner.classList.remove('fadeOut');
        $.ajax({
            url: "/roles/" + roleId,
            type: "DELETE"
        }).then(function (isConfirm) {
            spinner.classList.add('fadeOut');
            console.log("borrado");
            swal({
                title: "¡Eliminado!",
                text: "El rol se ha eliminado correctamente",
                type: "success",
                timer: 1500,
                showConfirmButton: false
            });
            deleteButton.closest('tr').fadeOut();
        })
            .catch(function(data) {
                spinner.classList.add('fadeOut');
                swal({
                    title: "Oops",
                    text: "¡No se pudo eliminar el rol!",
                    timer: 1500,
                    showConfirmButton: false
                });
                console.log("no borrado");
            });
    });
}
