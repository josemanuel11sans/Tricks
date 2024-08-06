document.addEventListener('DOMContentLoaded', function() {
    console.log('Script del reloj cargado');
    function actualizarReloj() {
        const ahora = new Date();
        let hora = ahora.getHours().toString().padStart(2, '0');
        let minuto = ahora.getMinutes().toString().padStart(2, '0');
        let segundo = ahora.getSeconds().toString().padStart(2, '0');
        const horaActual = hora+":"+minuto+":"+segundo;
        console.log('Hora actual:', horaActual);
        document.getElementById('hora-actual').textContent = horaActual;
    }

    setInterval(actualizarReloj, 1000);
    actualizarReloj(); // Llamada inicial para evitar el delay de un segundo
});