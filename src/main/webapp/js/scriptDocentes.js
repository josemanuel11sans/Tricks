document.querySelectorAll('.btn-modificar').forEach(function(button) {
    button.addEventListener('click', function() {
        var id = button.getAttribute('data-id');
        var nombre = button.getAttribute('data-nombre');
        var apellido = button.getAttribute('data-apellido');
        var mail = button.getAttribute('data-mail');
        var contra = button.getAttribute('data-contra');

        document.getElementById('idDocenteMod').value = id;
        document.getElementById('nombreMod').value = nombre;
        document.getElementById('apellidoMod').value = apellido;
        document.getElementById('mailMod').value = mail;
        document.getElementById('contraMod').value = contra;
    });
});

document.querySelectorAll('.btn-modificar, .activo, .inactivo').forEach(function(button) {
    button.addEventListener('click', function() {
        var folio = this.closest('tr').getAttribute('data-id');
        document.getElementById('idDocente2').value = folio;

        var estadoActual = this.getAttribute('data-estado');
        var estadoContrario = estadoActual === '1' ? '2' : '1';
        document.getElementById('estadoDocente').value = estadoContrario;
    });
});

$(document).ready(function () {
    $('#modificarEstado').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var idDocente = button.data('id');
        var nuevoEstado = button.data('estado');
        var modal = $(this);
        modal.find('#idDocenteEstado').val(idDocente);
        modal.find('#nuevoEstado').val(nuevoEstado);
    });

    $('#filterName').on('input', filterTable);
    $('#filterState').on('change', filterTable);

    function filterTable() {
        var filterNameValue = $('#filterName').val().toLowerCase();
        var filterStateValue = $('#filterState').val().toLowerCase();
        var table = $('#example');
        var rows = table.find('tbody tr');

        rows.each(function() {
            var cells = $(this).find('td');
            var matricula = cells.eq(0).text().toLowerCase(); // Columna "Matricula"
            var nombre = cells.eq(1).text().toLowerCase();    // Columna "Nombre"
            var estado = cells.eq(3).find('div').data('estado'); // Columna "Estado"

            var nameMatch = filterNameValue === '' || matricula.includes(filterNameValue) || nombre.includes(filterNameValue);

            var stateMatch;
            if (filterStateValue === 'activo') {
                stateMatch = estado == "1";
            } else if (filterStateValue === 'noactivo') {
                stateMatch = estado == "2";
            } else {
                stateMatch = true;
            }

            if (nameMatch && stateMatch) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    }
});
