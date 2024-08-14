document.addEventListener('DOMContentLoaded', function () {
  // Modals
  $('#exampleModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var recipient = button.data('whatever');
    var modal = $(this);
    modal.find('.modal-title').text('New message to ' + recipient);
    modal.find('.modal-body input').val(recipient);
  });
});

// Alerta de ayuda del HOME del ADMINISTRADOR
document.getElementById('help-icon').onclick = function () {
  Swal.fire({
    title: '¿Cómo usar el sistema?',
    html: `
            Pasos:<br>
            1. Registrar una división.<br>
            2. Registrar una carrera.<br>
            3. Registrar los docentes.<br>
            4. Registrar aspirantes.<br>
            5. Registrar el grupo.<br>
            Siguiendo estos pasos, se hará uso correcto del sistema.
        `,
    imageUrl: '../img_svg/usoSistema.svg',
    imageWidth: 100,
    imageHeight: 100,
    imageAlt: 'Img',
    customClass: {
      popup: 'swal2-popup',
      image: 'swal2-image',
      confirmButton: 'swal2-confirm'
    },
    width: 450,
    confirmButtonText: 'Aceptar',
    confirmButtonColor: '#003366'
  });
}

