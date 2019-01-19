$( document ).on('ready turbolinks:load', function() {
    $('#blogs-datatable').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        }
    });

    $('#blogs-datatable tbody').on('click', 'button.delete-blog-ajax', function (e) {
        e.preventDefault(e);
        var deleteButton = $(this);
        var blogId = $(this).attr("data-blog-id");
        var projectId = $(this).attr("data-project-id");
        deleteBlogAjax(blogId, projectId, deleteButton);
        return false;
    });

    $('button.delete-blog').click(function(e) {
        e.preventDefault(e);
        var blogId = $(this).attr("data-blog-id");
        var projectId = $(this).attr("data-project-id");
        deleteBlog(blogId, projectId);
        return false;
    });

    $('button.delete-image').click(function(e) {
        var deleteButton = $(this);
        e.preventDefault(e);
        var blogId = $(this).attr("data-blog-id");
        var projectId = $(this).attr("data-project-id");
        var imageId = $(this).attr("data-image-id");
        deleteFile(blogId, projectId, imageId, deleteButton);
        return false;
    });

    $('img').on('click', function () {
        var image = $(this).attr('src');
        $('#myModal').on('show.bs.modal', function () {
            $(".img-responsive").attr("src", image);
        });
    });
});

function deleteBlogAjax(blogId, projectId, deleteButton) {
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
            url: "/projects/" + projectId + "/blogs/" + blogId + "/ajax",
            type: "DELETE"
        }).then(function (isConfirm) {
            spinner.classList.add('fadeOut');
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
        });
    });
}

function deleteBlog(blogId, projectId) {
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar la bitácora? Se borrarán todos los trabajos y archivos asignados.",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar bitácora!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        $.ajax({
            url: "/projects/" + projectId + "/blogs/" + blogId,
            type: "DELETE"
        })
    });
}

function deleteFile(blogId, projectId, imageId, deleteButton) {
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar el archivo?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar el archivo!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        spinner.classList.remove('fadeOut');
        $.ajax({
            url: "/projects/" + projectId + "/blogs/" + blogId + "/delete_image_attachment/" + imageId,
            type: "DELETE"
        }).then(function (isConfirm) {
            spinner.classList.add('fadeOut');
            swal({
                title: "¡Eliminada!",
                text: "El archivo se ha eliminado correctamente",
                type: "success",
                timer: 1500,
                showConfirmButton: false
            });
            deleteButton.closest('div.file-card').fadeOut();
        }).catch(function(data) {
            spinner.classList.add('fadeOut');
            swal({
                title: "Oops",
                text: "¡No se pudo eliminar el archivo!",
                timer: 1500,
                showConfirmButton: false
            });
        });
    });
}
