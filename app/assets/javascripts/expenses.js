jQuery(function() {
    return $('#expense_supplier_name').autocomplete({
        source: $('#expense_supplier_name').data('autocomplete-source')
    });
});

// Expenses
$( document ).on('ready turbolinks:load', function() {
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

    $('button.delete-image-expense').click(function(e) {
        var deleteButton = $(this);
        e.preventDefault(e);
        var blogId = $(this).attr("data-blog-id");
        var projectId = $(this).attr("data-project-id");
        var imageId = $(this).attr("data-image-id");
        var expenseId = $(this).attr("data-expense-id");
        deleteFileExpense(blogId, projectId, imageId, expenseId, deleteButton);
        return false;
    });

    $("#expense_files").change(function(){
        var selDiv = $( "#expenseSelectedFiles" );
        var files = $('#expense_files').prop("files");
        var names = $.map(files, function(val) { return val.name; });
        addExpenseNamesPreview(names, selDiv);
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

function deleteFileExpense(blogId, projectId, imageId, expenseId, deleteButton) {
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
            url: "/projects/" + projectId + "/blogs/" + blogId + "/expenses/" + expenseId + "/delete_image_attachment/" + imageId,
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

function addExpenseNamesPreview(names, element){
  for (var i = 0; i < names.length; i++) {
    element.append(
      '<p>' + names[i] + '</p>'
    );
  }
}
