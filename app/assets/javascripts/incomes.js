// Incomes
$( document ).on('ready turbolinks:load', function() {
    $('#incomes-datatable tbody').on('click', 'button.delete-income-ajax', function (e) {
        e.preventDefault(e);
        var deleteButton = $(this);
        var incomeId = $(this).attr("data-income-id");
        var projectId = $(this).attr("data-project-id");
        deleteIncomeAjax(incomeId, projectId, deleteButton);
        return false;
    });

    $('button.delete-income').click(function(e) {
        e.preventDefault(e);
        var incomeId = $(this).attr("data-income-id");
        var projectId = $(this).attr("data-project-id");
        deleteIncome(incomeId, projectId);
        return false;
    });
});

function deleteIncomeAjax(incomeId, projectId, deleteButton) {
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar este ingreso?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar ingreso!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        spinner.classList.remove('fadeOut');
        $.ajax({
            url: "/projects/" + projectId + "/incomes/" + incomeId+ "/ajax",
            type: "DELETE"
        }).then(function (isConfirm) {
            spinner.classList.add('fadeOut');
            swal({
                title: "¡Eliminado!",
                text: "El ingreso se ha eliminado correctamente",
                type: "success",
                timer: 1500,
                showConfirmButton: false
            });
            deleteButton.closest('tr').fadeOut();
            window.location = "/projects/" + projectId + "/incomes/";
        }).catch(function(data) {
            spinner.classList.add('fadeOut');
            swal({
                title: "Oops",
                text: "¡No se pudo eliminar el ingreso!",
                timer: 1500,
                showConfirmButton: false
            });
        });
    });
}

function deleteIncome(incomeId, projectId) {
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar este ingreso?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar ingreso!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        $.ajax({
            url: "/projects/" + projectId + "/incomes/" + incomeId,
            type: "DELETE"
        })
    });
}