$( document ).on('ready turbolinks:load', function() {
    $('#passwordRecoverButton').click(function() {
        $('#email_reset_email').val($('#session_email').val());
    });
});