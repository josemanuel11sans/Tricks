$(document).ready(function() {
    // Filtrar la tabla según el folio y la calificación
    $("#filterFolio, #filterCalificacion").on("keyup change", function() {
        var folioFilter = $("#filterFolio").val().toLowerCase(); // Valor del filtro de folio convertido a minúsculas
        var calificacionFilter = $("#filterCalificacion").val(); // Valor del filtro de calificación

        $("#alumnosTable tbody tr").filter(function() {
            var folio = $(this).find("td:eq(0)").text().toLowerCase(); // Texto del folio en la fila actual
            var calificacion = parseFloat($(this).find(".calificacion-input").val()); // Calificación en la fila actual

            // Verificar si la fila cumple con los filtros
            var folioMatch = folio.indexOf(folioFilter) > -1;
            var calificacionMatch = true;

            if (calificacionFilter === "0-5") {
                calificacionMatch = calificacion >= 0 && calificacion <= 6;
            } else if (calificacionFilter === "6-7") {
                calificacionMatch = calificacion > 6 && calificacion <= 8;
            } else if (calificacionFilter === "8-10") {
                calificacionMatch = calificacion > 8 && calificacion <= 10;
            }

            $(this).toggle(folioMatch && calificacionMatch); // Mostrar u ocultar la fila según el filtro
        });
    });
});