$( document ).on('ready turbolinks:load', function() {
    // Open tab from url:
    $(function() {
        var hash = window.location.hash;
        hash && $('div.nav a[href="' + hash + '"]').tab('show');
    });
});