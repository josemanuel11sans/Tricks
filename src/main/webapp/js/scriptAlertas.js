document.addEventListener('DOMContentLoaded', function () {
    // Mostrar las alertas al cargar la página
    var alertas = document.querySelectorAll('.alerta');
    alertas.forEach(function(alerta) {
        alerta.classList.add('mostrar');
    });

    // Seleccionar todas las alertas
    var alertas = document.querySelectorAll('.alerta-dismissible');

    alertas.forEach(function(alerta) {
        // Seleccionar el botón de cierre dentro de la alerta
        var botonCerrar = alerta.querySelector('.btn-cerrar');

        // Agregar evento de clic al botón de cierre
        botonCerrar.addEventListener('click', function () {
            // Añadir clase de desvanecimiento
            alerta.classList.add('ocultar');

            // Esperar la animación de desvanecimiento antes de eliminar el elemento
            setTimeout(function() {
                alerta.remove();
            }, 150); // Tiempo para la animación de desvanecimiento
        });
    });
});