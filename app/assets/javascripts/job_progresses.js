$( document ).on('ready turbolinks:load', function() {
    $('.job_progress-datatable').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        },
        dom: "<'row'<'col-lg-12'B><'col-lg-6'l><'col-lg-6'f>>" +
            "<'row'<'col-md-12't>><'row'<'col-md-12'ip>>",
        buttons: [
            { extend: 'copyHtml5', className: 'btn-warning mR-5' },
            { extend: 'excelHtml5', className: 'btn-success mR-5' },
            { extend: 'csvHtml5', className: 'btn-secondary mR-5' },
            { extend: 'pdfHtml5', className: 'btn-danger mR-5' },
            { extend: 'print', className: 'btn-info mR-5' }
        ]
    });
    
    $('#concepts_jobs-datatable').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        },
        dom: "<'row'<'col-lg-12'B><'col-lg-6'l><'col-lg-6'f>>" +
            "<'row'<'col-md-12't>><'row'<'col-md-12'ip>>",
        buttons: [
            { extend: 'copyHtml5', className: 'btn-warning mR-5' },
            { extend: 'excelHtml5', className: 'btn-success mR-5' },
            { extend: 'csvHtml5', className: 'btn-secondary mR-5' },
            { extend: 'pdfHtml5', className: 'btn-danger mR-5' },
            { extend: 'print', className: 'btn-info mR-5' }
        ]
    });

    $('.job_progress-datatable tbody').on('click', 'button.delete-job_progress', function (e) {
        e.preventDefault(e);
        var deleteButton = $(this);
        var jobProgressId = $(this).attr("data-job_progress-id");
        var blogId = $(this).attr("data-blog-id");
        var projectId = $(this).attr("data-project-id");
        deleteJobProgress(jobProgressId, blogId, projectId, deleteButton);
        return false;
    });
});

function deleteJobProgress(jobProgressId, blogId, projectId, deleteButton) {
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar el progreso de trabajo?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar progreso de trabajo!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        spinner.classList.remove('fadeOut');
        $.ajax({
            url: "/projects/" + projectId + "/blogs/" + blogId  + "/job_progresses/" + jobProgressId,
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
        });
    });
}
