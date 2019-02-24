$( document ).on('ready turbolinks:load', function() {
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
