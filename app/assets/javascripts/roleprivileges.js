$( document ).on('ready turbolinks:load', function() {
    $('#roleprivileges-datatable').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        },
        dom: "<'row'<'col-lg-12'B><'col-lg-6'l><'col-lg-6'f>>" +
            "<'row'<'col-md-12't>><'row'<'col-md-12'ip>>",
        buttons: [
            { extend: 'copyHtml5', className: 'btn-warning mR-5' },
            { extend: 'excelHtml5', className: 'btn-success mR-5' },
            { extend: 'csvHtml5', className: 'btn-secondary mR-5' },
            { extend: 'pdfHtml5', className: 'btn-danger mR-5' },
            { extend: 'print', className: 'btn-info mR-5' }
        ]
    });

    $('#roleprivileges-datatable tbody').on('click', 'button.delete-roleprivilege', function (e) {
        e.preventDefault(e);
        var deleteButton = $(this);
        var roleprivilegeId = $(this).attr("data-roleprivilege-id");
        var roleId = $(this).attr("data-role-id");
        deleteRoleprivilege(roleprivilegeId, roleId, deleteButton);
        return false;
    });
});

function deleteRoleprivilege(roleprivilegeId, roleId, deleteButton) {
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer quitar el privilegio?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Quitar privilegio!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        spinner.classList.remove('fadeOut');
        $.ajax({
            url: "/role/" + roleId  + "/privilege/" + roleprivilegeId,
            type: "DELETE"
        }).then(function (isConfirm) {
            spinner.classList.add('fadeOut');
            swal({
                title: "¡Eliminado!",
                text: "El privilegio se ha quitado correctamente",
                type: "success",
                timer: 1500,
                showConfirmButton: false
            });
            deleteButton.closest('tr').fadeOut();
        }).catch(function(data) {
            spinner.classList.add('fadeOut');
            swal({
                title: "Oops",
                text: "¡No se pudo quitar el privilegio!",
                timer: 1500,
                showConfirmButton: false
            });
        });
    });
}