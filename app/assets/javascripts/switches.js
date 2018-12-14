$( document ).on('ready turbolinks:load', function() {
    $('.activate-switch').click(function() {
        console.log("activate-switch");
        var html_id = $(this).attr('id');
        var data_id = $(this).attr('data-id');
        var data_field = $(this).attr('data-field');
        var controller = $(this).attr('name');
        var switch_value = $('#' + html_id).prop('checked');
        swal({
            title: "¿Estás Seguro?",
            text: "¿Estás seguro de querer cambiar el estatus?",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "Sí, ¡Cambiar!",
            confirmButtonColor: "#ec6c62"
        }, function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    method: "POST",
                    url: '/' + controller + '/activate',
                    data: {data: switch_value, id: data_id}
                }).then(() => {
                    swal({
                        title: "¡Confirmado!",
                        text: "El estatus se ha cambiado con exito",
                        type: "success",
                        timer: 1500,
                        showConfirmButton: false
                    });
                    // window.setTimeout(function () {
                    //     location.reload();
                    // }, 2000);
                }).catch(function (data) {
                    swal("Oops", "¡No se pudo cambiar el estatus!");
                });
            }
        });
    });
});