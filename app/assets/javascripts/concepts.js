// Concepts
$( document ).on('ready turbolinks:load', function() {

    $('#concepts-datatable tbody').on('click', 'button.delete-concept-ajax', function (e) {
        e.preventDefault(e);
        var deleteButton = $(this);
        var conceptId = $(this).attr("data-concept-id");
        var projectId = $(this).attr("data-project-id");
        deleteConceptAjax(conceptId, projectId, deleteButton);
        return false;
    });

    $('button.delete-concept').click(function(e) {
        e.preventDefault(e);
        var conceptId = $(this).attr("data-concept-id");
        var projectId = $(this).attr("data-project-id");
        deleteConcept(conceptId, projectId);
        return false;
    });
});

function deleteConceptAjax(conceptId, projectId, deleteButton) {
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar este concepto?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar concepto!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        spinner.classList.remove('fadeOut');
        $.ajax({
            url: "/projects/" + projectId + "/concepts/" + conceptId+ "/ajax",
            type: "DELETE"
        }).then(function (isConfirm) {
            spinner.classList.add('fadeOut');
            swal({
                title: "¡Eliminada!",
                text: "El concepto se ha eliminado correctamente",
                type: "success",
                timer: 1500,
                showConfirmButton: false
            });
            deleteButton.closest('tr').fadeOut();
        }).catch(function(data) {
            spinner.classList.add('fadeOut');
            swal({
                title: "Oops",
                text: "¡No se pudo eliminar el concepto!",
                timer: 1500,
                showConfirmButton: false
            });
        });
    });
}

function deleteConcept(conceptId, projectId) {
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar este concepto?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar concepto!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        $.ajax({
            url: "/projects/" + projectId + "/concepts/" + conceptId,
            type: "DELETE"
        })
    });
}
