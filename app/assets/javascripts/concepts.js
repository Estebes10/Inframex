// Concepts
$( document ).on('ready turbolinks:load', function() {
    $('#concepts-datatable').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        }
    });

    $('#concepts-datatable tbody').on('click', 'button.delete-concept-ajax', function (e) {
        e.preventDefault(e);
        var deleteButton = $(this);
        var conceptId = $(this).attr("data-concept-id");
        deleteConceptAjax(conceptId, deleteButton);
        return false;
    });

    $('button.delete-concept').click(function(e) {
        e.preventDefault(e);
        var conceptId = $(this).attr("data-concept-id");
        deleteConcept(conceptId);
        return false;
    });
});

function deleteConceptAjax(conceptId, deleteButton) {
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar este gasto?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar gasto!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        spinner.classList.remove('fadeOut');
        $.ajax({
            url: "/concepts/" + conceptId+ "/ajax",
            type: "DELETE"
        }).then(function (isConfirm) {
            spinner.classList.add('fadeOut');
            swal({
                title: "¡Eliminada!",
                text: "El gasto se ha eliminado correctamente",
                type: "success",
                timer: 1500,
                showConfirmButton: false
            });
            deleteButton.closest('tr').fadeOut();
        }).catch(function(data) {
            spinner.classList.add('fadeOut');
            swal({
                title: "Oops",
                text: "¡No se pudo eliminar el gasto!",
                timer: 1500,
                showConfirmButton: false
            });
        });
    });
}

function deleteConcept(conceptId) {
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar este gasto?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar gasto!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        $.ajax({
            url: "/concepts/" + conceptId,
            type: "DELETE"
        })
    });
}
