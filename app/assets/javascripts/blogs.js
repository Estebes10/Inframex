$( document ).on('ready turbolinks:load', function() {
    $('#blogs-datatable').DataTable();

    $('#blogs-datatable tbody').on('click', 'button.delete-blog', function (e) {
        e.preventDefault(e);
        var deleteButton = $(this);
        var blogId = $(this).attr("data-blog-id");
        deleteBlog(blogId, deleteButton);
        return false;
    });
});

function deleteBlog(blogId, deleteButton) {
    console.log(blogId);
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar la bitácora? Se borrarán todos los trabajos y archivos asignados.",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar bitácora!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        spinner.classList.remove('fadeOut');
        $.ajax({
            url: "/blogs/" + blogId,
            type: "DELETE"
        }).then(function (isConfirm) {
            spinner.classList.add('fadeOut');
            console.log("borrado");
            swal({
                title: "¡Eliminada!",
                text: "La bitácora se ha eliminado correctamente",
                type: "success",
                timer: 1500,
                showConfirmButton: false
            });
            deleteButton.closest('tr').fadeOut();
        }).catch(function(data) {
            spinner.classList.add('fadeOut');
            swal({
                title: "Oops",
                text: "¡No se pudo eliminar la bitácora!",
                timer: 1500,
                showConfirmButton: false
            });
            console.log("no borrado");
        });
    });
}