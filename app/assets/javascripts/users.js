$( document ).on('ready turbolinks:load', function() {
    $('#users-datatable tbody').on('click', 'button.delete-user', function (e) {
        e.preventDefault(e);
        var deleteButton = $(this);
        var userId = $(this).attr("data-user-id");
        deleteUser(userId, deleteButton);
        return false;
    });
});

function deleteUser(userId, deleteButton) {
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar al usuario?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar usario!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        spinner.classList.remove('fadeOut');
        $.ajax({
            url: "/users/" + userId,
            type: "DELETE"
        }).then(function (isConfirm) {
            spinner.classList.add('fadeOut');
            swal({
                title: "¡Eliminado!",
                text: "El usuario se ha eliminado correctamente",
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
                text: "¡No se pudo eliminar el usuario!",
                timer: 1500,
                showConfirmButton: false
            });
        });
    });
}
