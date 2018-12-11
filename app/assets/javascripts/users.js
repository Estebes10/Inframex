// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).on('ready turbolinks:load', function() {
    $('button.delete-user').click(function(e) {
        e.preventDefault(e);
        var userId = $(this).attr("data-user-id");
        deleteUser(userId);
        return false;
    });
});

function deleteUser(userId) {
    console.log(userId);
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar al usuario?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: false,
        confirmButtonText: "Sí, ¡Borrar usario!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        $.ajax({
            url: "/users/" + userId,
            type: "DELETE"
        }).then(function (isConfirm) {
            if (isConfirm) {
                location.reload(); // reload page after closing
                swal("¡Eliminado!", "El usario se ha eliminado correctamente!");
            }
        })
        .catch(function(data) {
            swal("Oops", "¡No se pudo borrar el usuario!");
        });
    });
}
