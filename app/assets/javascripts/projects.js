// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).on('ready turbolinks:load', function() {
    $('#projects-datatable div').on('click', 'button.delete-project', function (e) {
        console.log("you activate the event");
        e.preventDefault(e);
        var deleteButton = $(this);
        var projectId = $(this).attr("data-project-id");
        deleteProject(projectId, deleteButton);
        return false;
    });
});

function deleteProject(projectId, deleteButton) {
    console.log(projectId);
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar el proyecto?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar usario!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        spinner.classList.remove('fadeOut');
        $.ajax({
            url: "/projects/" + projectId,
            type: "DELETE"
        }).then(function (isConfirm) {
            spinner.classList.add('fadeOut');
            console.log("borrado");
            swal({
                title: "¡Eliminado!",
                text: "El proyecto se ha eliminado correctamente",
                type: "success",
                timer: 1500,
                showConfirmButton: false
            });
            deleteButton.closest('div.card').fadeOut();
        })
        .catch(function(data) {
            spinner.classList.add('fadeOut');
            swal({
                title: "Oops",
                text: "¡No se pudo eliminar el proyecto!",
                timer: 1500,
                showConfirmButton: false
            });
            console.log("no borrado");
        });
    });
}
