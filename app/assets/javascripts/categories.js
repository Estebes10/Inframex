// Categories
$( document ).on('ready turbolinks:load', function() {
    $('#categories-datatable').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        },
        dom: "<'row'<'col-lg-12'B><'col-lg-6'l><'col-lg-6'f>>" +
            "<'row'<'col-md-12't>><'row'<'col-md-12'ip>>",
        buttons: [
            {
              className: 'btn-info mR-5',
              extend: 'colvis',
              text: 'Filtrar columnas'
            },
            {
              extend: 'copyHtml5',
              className: 'btn-warning mR-5',
              exportOptions: {
                columns: ':visible'
              }
            },
            {
              extend: 'excelHtml5',
              className: 'btn-success mR-5',
              exportOptions: {
                columns: ':visible'
              }
            },
            {
              extend: 'csvHtml5',
              className: 'btn-secondary mR-5',
              exportOptions: {
                columns: ':visible'
              }
            },
            {
              extend: 'pdfHtml5',
              className: 'btn-danger mR-5',
              exportOptions: {
                columns: ':visible'
              }
            },
            {
              extend: 'print',
              className: 'btn-info mR-5',
              exportOptions: {
                columns: ':visible'
              }
            }
        ]
    });

    $('#categories-datatable tbody').on('click', 'button.delete-category-ajax', function (e) {
        e.preventDefault(e);
        var deleteButton = $(this);
        var categoryId = $(this).attr("data-category-id");
        deleteCategoryAjax(categoryId, deleteButton);
        return false;
    });
});

function deleteCategoryAjax(categoryId, deleteButton) {
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar la categoría? Se borrarán todos los conceptos asignados.",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar categoría!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        spinner.classList.remove('fadeOut');
        $.ajax({
            url: "/categories/" + categoryId+ "/ajax",
            type: "DELETE"
        }).then(function (isConfirm) {
            spinner.classList.add('fadeOut');
            swal({
                title: "¡Eliminada!",
                text: "La categoría se ha eliminado correctamente",
                type: "success",
                timer: 1500,
                showConfirmButton: false
            });
            deleteButton.closest('tr').fadeOut();
        }).catch(function(data) {
            spinner.classList.add('fadeOut');
            swal({
                title: "Oops",
                text: "¡No se pudo eliminar la categoría!",
                timer: 1500,
                showConfirmButton: false
            });
        });
    });
}

// Subcategories
$( document ).on('ready turbolinks:load', function() {
    $('#subcategories-datatable').DataTable({
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

    $('#subcategories-datatable tbody').on('click', 'button.delete-subcategory-ajax', function (e) {
        e.preventDefault(e);
        var deleteButton = $(this);
        var subcategoryId = $(this).attr("data-subcategory-id");
        deleteSubcategoryAjax(subcategoryId, deleteButton);
        return false;
    });
});

function deleteSubcategoryAjax(subcategoryId, deleteButton) {
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar la subcategoría? Se borrarán todos los gastos relacionados.",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar subcategoría!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        spinner.classList.remove('fadeOut');
        $.ajax({
            url: "/subcategories/" + subcategoryId+ "/ajax",
            type: "DELETE"
        }).then(function (isConfirm) {
            spinner.classList.add('fadeOut');
            swal({
                title: "¡Eliminada!",
                text: "La subcategoría se ha eliminado correctamente",
                type: "success",
                timer: 1500,
                showConfirmButton: false
            });
            deleteButton.closest('tr').fadeOut();
        }).catch(function(data) {
            spinner.classList.add('fadeOut');
            swal({
                title: "Oops",
                text: "¡No se pudo eliminar la subcategoría!",
                timer: 1500,
                showConfirmButton: false
            });
        });
    });
}
