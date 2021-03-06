// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).on('ready turbolinks:load', function() {
    $('#projects-datatable div').on('click', 'button.delete-project', function (e) {
        e.preventDefault(e);
        var deleteButton = $(this);
        var projectId = $(this).attr("data-project-id");
        deleteProject(projectId, deleteButton);
        return false;
    });

    $("#project_image").change(function(){
        readURL(this);
        var fileName = $(this).val().split('\\').pop();
        $(this).next('.custom-file-label').addClass("selected").html(fileName);
    });
});

function deleteProject(projectId, deleteButton) {
    swal({
        title: "¿Estás Seguro?",
        text: "¿Estás seguro de querer borrar el proyecto?",
        type: "warning",
        showCancelButton: true,
        closeOnConfirm: true,
        confirmButtonText: "Sí, ¡Borrar proyecto!",
        confirmButtonColor: "#ec6c62"
    }, function() {
        spinner.classList.remove('fadeOut');
        $.ajax({
            url: "/projects/" + projectId,
            type: "DELETE"
        }).then(function (isConfirm) {
            spinner.classList.add('fadeOut');
            swal({
                title: "¡Eliminado!",
                text: "El proyecto se ha eliminado correctamente",
                type: "success",
                timer: 1500,
                showConfirmButton: false
            });
            deleteButton.closest('div.card').fadeOut();
        })
        .catch(function(data) {
            spinner.classList.add('fadeOut');
            swal({
                title: "Oops",
                text: "¡No se pudo eliminar el proyecto!",
                timer: 1500,
                showConfirmButton: false
            });
        });
    });
}

function readURL(input) {
  if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
          $('#project-img-tag').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
  }
}
