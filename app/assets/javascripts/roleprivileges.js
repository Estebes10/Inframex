$( document ).on('ready turbolinks:load', function() {
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
