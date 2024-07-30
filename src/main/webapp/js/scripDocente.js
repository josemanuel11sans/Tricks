document.addEventListener('DOMContentLoaded', function () {
    // Menú
    const hamBurger = document.querySelector(".toggle-btn");

    hamBurger.addEventListener("click", function () {
        document.querySelector("#sidebar").classList.toggle("expand");
    });

    // Modals
    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var recipient = button.data('whatever');
        var modal = $(this);
        modal.find('.modal-title').text('New message to ' + recipient);
        modal.find('.modal-body input').val(recipient);
    });
});

// Alerta de ayuda del HOME del DOCENTE
document.getElementById('help-icon-Docente').onclick = function () {
    Swal.fire({
        title: '¿Cómo usar el sistema?',
        html: `
            Pasos:<br>
            1. Selecciona un grupo.<br>
            2. Registrar una calificacion o asistencia.<br>
            3. Descarga la lista de asistencia.<br>
            4. Descarga la lista de calificaciones.<br>
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