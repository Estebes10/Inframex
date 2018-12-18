$( document ).on('ready turbolinks:load', function() {
    $('#jobs-datatable').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        }
    });

    $('#jobs-datatable tbody').on('click', 'button.delete-job', function (e) {
        e.preventDefault(e);
        var deleteButton = $(this);
        var jobId = $(this).attr("data-job-id");
        var blogId = $(this).attr("data-blog-id");
        deleteJob(jobId, blogId, deleteButton);
        return false;
    });
});

function deleteJob(jobId, blogId, deleteButton) {
    console.log(jobId);
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar el trabajo?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar Trabajo!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        spinner.classList.remove('fadeOut');
        $.ajax({
            url: "/blogs/" + blogId  + "/jobs/" + jobId,
            type: "DELETE"
        }).then(function (isConfirm) {
            spinner.classList.add('fadeOut');
            swal({
                title: "¡Eliminado!",
                text: "El trabajo se ha eliminado correctamente",
                type: "success",
                timer: 1500,
                showConfirmButton: false
            });
            deleteButton.closest('tr').fadeOut();
        }).catch(function(data) {
            spinner.classList.add('fadeOut');
            swal({
                title: "Oops",
                text: "¡No se pudo eliminar el trabajo!",
                timer: 1500,
                showConfirmButton: false
            });
            console.log("no borrado");
        });
    });
}