// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).on('ready turbolinks:load', function() {
    $('#users-datatable').DataTable();

    $('#users-datatable tbody').on('click', 'button.delete-user', function (e) {
        console.log("you activate the event");
        e.preventDefault(e);
        var deleteButton = $(this);
        var userId = $(this).attr("data-user-id");
        deleteUser(userId, deleteButton);
        return false;
    });
});

function deleteUser(userId, deleteButton) {
    console.log(userId);
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
            console.log("borrado");
            swal({
                title: "¡Eliminado!",
                text: "El usario se ha eliminado correctamente",
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
            console.log("no borrado");
        });
    });
}
