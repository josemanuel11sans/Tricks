document.addEventListener('DOMContentLoaded', function () {
    // Menú
    const hamBurger = document.querySelector(".toggle-btn");

    hamBurger.addEventListener("click", function () {
        document.querySelector("#sidebar").classList.toggle("expand");
    });

    // Paginación
    const registrosPorPagina = 5;
    let paginaActual = 1;
    const rows = document.querySelectorAll('#aspirantesTableBody tr');
    const totalPaginas = Math.ceil(rows.length / registrosPorPagina);

    function showPage(page) {
        paginaActual = page;
        rows.forEach((row, index) => {
            row.style.display = (index >= (paginaActual - 1) * registrosPorPagina && index < paginaActual * registrosPorPagina) ? '' : 'none';
        });

        document.querySelector('#paginaAnterior').parentElement.classList.toggle('disabled', paginaActual === 1);
        document.querySelector('#paginaSiguiente').parentElement.classList.toggle('disabled', paginaActual === totalPaginas);
    }

    document.querySelector('#paginaAnterior').addEventListener('click', (e) => {
        e.preventDefault();
        if (paginaActual > 1) {
            showPage(paginaActual - 1);
        }
    });

    document.querySelector('#paginaSiguiente').addEventListener('click', (e) => {
        e.preventDefault();
        if (paginaActual < totalPaginas) {
            showPage(paginaActual + 1);
        }
    });

    document.querySelectorAll('.pagination .page-item .page-link').forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const page = parseInt(link.textContent);
            if (!isNaN(page)) {
                showPage(page);
            }
        });
    });

    showPage(paginaActual);

    // Modals
    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var recipient = button.data('whatever');
        var modal = $(this);
        modal.find('.modal-title').text('New message to ' + recipient);
        modal.find('.modal-body input').val(recipient);
    });
});