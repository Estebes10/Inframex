$( document ).on('ready turbolinks:load', function() {
  $('#user_password, #user_password_confirmation').on('keyup', function () {
    if ($('#user_password').val() == $('#user_password_confirmation').val()) {
      if ($('#user_password').val().length >= 6) {
        $('#message-reset-password').html('Contraseñas válidas').css('color', 'green');
        $('#save_pass').prop('disabled', false);
      }else{
        $('#save_pass').prop('disabled', true);
        $('#message-reset-password').html('La contraseña debe tener más de 6 caracteres').css('color', 'red');
      }
    } else{
      $('#save_pass').prop('disabled', true);
      $('#message-reset-password').html('Las contraseñas no concuerdan').css('color', 'red');
    }
  });
});
