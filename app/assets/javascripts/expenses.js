jQuery(function() {
    return $('#expense_supplier_name').autocomplete({
        source: $('#expense_supplier_name').data('autocomplete-source')
    });
});

// Expenses
$( document ).on('ready turbolinks:load', function() {
    $('#expenses-datatable').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        }
    });

    $('#expenses-datatable tbody').on('click', 'button.delete-expense-ajax', function (e) {
        e.preventDefault(e);
        var deleteButton = $(this);
        var expenseId = $(this).attr("data-expense-id");
        deleteExpenseAjax(expenseId, deleteButton);
        return false;
    });

    $('button.delete-expense').click(function(e) {
        e.preventDefault(e);
        var expenseId = $(this).attr("data-expense-id");
        var blogId = $(this).attr("data-blog-id");
        var projectId = $(this).attr("data-project-id");
        deleteExpense(expenseId, blogId, projectId);
        return false;
    });
});

function deleteExpenseAjax(expenseId, deleteButton) {
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
            url: "/expenses/" + expenseId+ "/ajax",
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

function deleteExpense(expenseId, blogId, projectId) {
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
            url: "/projects/" + projectId + "/blogs/" + blogId  + "/expenses/" + expenseId,
            type: "DELETE"
        })
    });
}
