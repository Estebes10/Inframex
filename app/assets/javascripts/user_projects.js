$( document ).on('ready turbolinks:load', function() {
    $('#users-projects-datatable tbody').on('click', 'button.delete-user-project', function (e) {
        e.preventDefault(e);
        var deleteButton = $(this);
        var userId = $(this).attr("data-user-id");
        var projectId = $(this).attr("data-project-id");
        deleteUserProject(userId, projectId, deleteButton);
        return false;
    });
});

function deleteUserProject(userId, projectId, deleteButton) {
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer quitar a este usuario de este proyecto?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Quitar usario!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        spinner.classList.remove('fadeOut');
        $.ajax({
            url: "/projects/" + projectId + "/user_projects/" + userId,
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
