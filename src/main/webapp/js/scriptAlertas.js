document.addEventListener('DOMContentLoaded', function () {
    console.log('Script cargado');

    // Seleccionar todas las alertas
    var alertas = document.querySelectorAll('.alerta');
    console.log('Alertas encontradas:', alertas.length);

    // Mostrar las alertas al cargar la página
    alertas.forEach(function(alerta) {
        alerta.classList.add('mostrar');

        // Ocultar automáticamente la alerta después de 5 segundos
        setTimeout(function() {
            alerta.classList.add('ocultar');
            console.log('Alerta oculta automáticamente');

            // Esperar la animación de desvanecimiento antes de eliminar el elemento
            setTimeout(function() {
                alerta.remove();
                console.log('Alerta eliminada del DOM');
            }, 500); // Coincide con la duración de la animación CSS
        }, 5000); // 5000 ms = 5 segundos
    });

    // Seleccionar todas las alertas con capacidad de cierre manual
    var alertasDismissible = document.querySelectorAll('.alerta-dismissible');
    console.log('Alertas dismissible encontradas:', alertasDismissible.length);

    alertasDismissible.forEach(function(alerta) {
        // Seleccionar el botón de cierre dentro de la alerta
        var botonCerrar = alerta.querySelector('.btn-cerrar');

        // Verificar si el botón de cierre está presente
        if (botonCerrar) {
            // Agregar evento de clic al botón de cierre
            botonCerrar.addEventListener('click', function () {
                // Añadir clase de desvanecimiento
                alerta.classList.add('ocultar');
                console.log('Botón cerrar clicado, alerta oculta');

                // Esperar la animación de desvanecimiento antes de eliminar el elemento
                setTimeout(function() {
                    alerta.remove();
                    console.log('Alerta eliminada del DOM después de cerrar manualmente');
                }, 500); // Coincide con la duración de la animación CSS
            });
        } else {
            console.log('Botón cerrar no encontrado en la alerta');
        }
    });
});
