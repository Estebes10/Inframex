$( document ).on('ready turbolinks:load', function() {
    $('.activate-switch').click(function() {
        var data_id = $(this).attr('data-id');
        var controller = $(this).attr('name');
        var switch_value = $(this).prop('checked');
        swal({
            title: "¿Estás Seguro?",
            text: "¿Estás seguro de querer cambiar el estatus?",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: true,
            confirmButtonText: "Sí, ¡Cambiar!",
            confirmButtonColor: "#ec6c62"
        }, function (isConfirm) {
            if (isConfirm) {
                spinner.classList.remove('fadeOut');
                $.ajax({
                    method: "POST",
                    url: '/' + controller + '/activate',
                    data: {data: switch_value, id: data_id}
                }).then(() => {
                    spinner.classList.add('fadeOut');
                    swal({
                        title: "¡Confirmado!",
                        text: "El estatus se ha cambiado con exito",
                        type: "success",
                        timer: 1500,
                        showConfirmButton: false
                    });
                }).catch(function (data) {
                    spinner.classList.add('fadeOut');
                    swal({
                        title: "Oops",
                        text: "¡No se pudo cambiar el estatus!",
                        timer: 1500,
                        showConfirmButton: false
                    });
                    window.setTimeout(function () {
                        location.reload();
                    }, 1700);
                });
            } else {
                location.reload();
            }
        });
    });
});