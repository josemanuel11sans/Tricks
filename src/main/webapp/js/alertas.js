
//esta es la alerta que manda un error cuando el correo no se encuentra en la base de datos
function alertaErrorCorreo(){
    //alerta  erro login
    Swal.fire({
        title: "ERROR",
        text: "Correo no válido ",
        iconHtml: '<i class="fa-solid fa-triangle-exclamation"></i>',
        // icon: null, // No mostrar el icono predeterminado de SweetAlert
        background: '#00796b',
        customClass: {
            popup: 'colored-alert',
            icon: 'custom-swal-icon',
            confirmButton: 'custom-confirm-button-class'
        },
        buttonsStyling: true, // Desactiva los estilos predeterminados de SweetAlert para los botones
        confirmButtonText: 'OK'
    });

}