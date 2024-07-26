<!-- Script para abrir la imagen de carga masiva de ejemplo -->
function openImagePopup(url, title) {
    var width = 800;
    var height = 600;
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 2;
    window.open(url, title, 'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left);
}
document.addEventListener('DOMContentLoaded', function () {
    var filterName = document.getElementById('filterName');
    var filterCareer = document.getElementById('filterCareer');
    var filterDivision = document.getElementById('filterDivision');

    filterName.addEventListener('input', filterTable);
    filterCareer.addEventListener('change', filterTable);
    filterDivision.addEventListener('change', filterTable);

    function filterTable() {
        var filterNameValue = filterName.value.toLowerCase();
        var filterCareerValue = filterCareer.value.toLowerCase();
        var filterDivisionValue = filterDivision.value.toLowerCase();
        var table = document.getElementById('example');
        var rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

        for (var i = 0; i < rows.length; i++) {
            var cells = rows[i].getElementsByTagName('td');
            var folio = cells[0].textContent.toLowerCase();  // Columna "Folio"
            var name = cells[1].textContent.toLowerCase();   // Columna "Nombre"
            var curp = cells[2].textContent.toLowerCase();   // Columna "CURP"
            var division = cells[3].textContent.toLowerCase(); // Columna "Grupo"
            var career = cells[4].querySelector('div').getAttribute('data-estado'); // Columna "Estado"

            var nameMatch = filterNameValue === '' || folio.includes(filterNameValue) || name.includes(filterNameValue) || curp.includes(filterNameValue);
            var careerMatch = filterCareerValue === '' || career === filterCareerValue;
            var divisionMatch = filterDivisionValue === '' || division === filterDivisionValue;

            if (nameMatch && careerMatch && divisionMatch) {
                rows[i].style.display = '';
            } else {
                rows[i].style.display = 'none';
            }
        }
    }

    // Añadir evento a los botones para capturar el valor del folio y el estado
    document.querySelectorAll('.btn-modificar, .activo, .inactivo').forEach(function(button) {
        button.addEventListener('click', function() {
            var folio = this.closest('tr').getAttribute('data-folio');
            document.getElementById('folioAspirante2').value = folio;

            var estadoActual = this.getAttribute('data-estado');
            var estadoContrario = estadoActual === '1' ? '2' : '1';
            document.getElementById('estadoAspirante').value = estadoContrario;

        });
    });

    // Evento para modal de actualizar aspirante
    document.querySelectorAll('.btn-modificar').forEach(function(button) {
        button.addEventListener('click', function() {
            var folio = button.getAttribute('data-folio');
            var nombre = button.getAttribute('data-nombre');
            var apellido = button.getAttribute('data-apellido');
            var curp = button.getAttribute('data-curp');
            var fecha = button.getAttribute('data-fecha');

            document.getElementById('folioAspirante3').value = folio;
            document.getElementById('nombreAspirante3').value = nombre;
            document.getElementById('apellidosAspirante3').value = apellido;
            document.getElementById('curpAspirante3').value = curp;
            document.getElementById('fechaNacimientoAspirante3').value = fecha;
            console.log(fecha);
        });
    });
});