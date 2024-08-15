<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.tricks.model.Alumno" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.tricks.dao.AlumnoDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.tricks.model.Grupo" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calificaciones</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/faviconGrupo.svg">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/estilosModal.css">
    <link rel="stylesheet" href="../css/estilosTabla.css">
    <link rel="stylesheet" href="../css/estilosAlertas.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
    <style>
        .wrapper { display: flex; width: 100%; align-items: stretch; }
        .main { width: 100%; padding: 20px; }
        .table-responsive {
            max-height: 70vh;
            overflow-y: auto;
        }
        table {
            border-collapse: separate;
            border-spacing: 0;
        }
        thead th {
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            background: white;
            z-index: 1;
        }
        ::-webkit-scrollbar {
            display: none;
        }
        .table {
            margin-bottom: 0;
        }
        .modal-body {
            padding: 0 1.5rem;
            border-radius: .3rem;
        }
        .modal-footer {
            border: none;
        }
        .form-group {
            margin-bottom: .5rem !important;
        }
        .activo, .inactivo {
            width: 15px;
            height: 15px;
            border-radius: 100%;
            cursor: pointer;
        }
        .activo { background-color: green; }
        .inactivo { background-color: red; }
        td {
            vertical-align: middle !important;
        }
        .tabla {
            background-color: #fff;
            border-radius: 20px;
            display: block;
            width: 100%;
            overflow-x: auto;
            max-height: 70vh;
        }
    </style>
</head>
<body>
<div class="wrapper" style="height: 100vh;">
    <li class="sidebar-item" title="Inicio" style="position: absolute; top: 3%; left: 20px;">
        <a href="../html_docentes/inicioDocente.jsp" class="sidebar-link">
            <i class="fas fa-house"></i>
        </a>
    </li>
    <div class="main">
        <div class="container mt-4 text-left">
            <h1 class="mb-4 text-light">Aspirantes del grupo</h1>

            <!-- Filtros -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <select class="custom-select" id="filterCalificacion">
                        <option value="">Calificación...</option>
                        <option value="0-5">0-5</option>
                        <option value="6-7">6-7</option>
                        <option value="8-10">8-10</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <input type="text" id="filterFolio" class="form-control" placeholder="Buscar por Folio">
                </div>
            </div>

            <!-- Tabla de alumnos -->
            <div class="container-xxl tabla">
                <table id="alumnosTable" class="table table-striped" style="width:100%">
                    <thead class="thead-light">
                    <tr>
                        <th>Folio</th>
                        <th>Nombre</th>
                        <th>Carrera</th>
                        <th>Estado</th>
                        <th>Calificación</th>
                    </tr>
                    </thead>
                    <tbody id="aspirantesTableBody">
                    <%
                        String grupoIdStr = request.getParameter("grupoId");
                        int grupoId = Integer.parseInt(grupoIdStr);
                        AlumnoDao dao = new AlumnoDao();
                        List<Alumno> alumnos = dao.getAlumnosPorGrupo(grupoId);

                        if (alumnos != null) {
                            for (Alumno alumno : alumnos) {
                    %>
                    <tr style="height: 10px; font-size: 15px">
                        <td style="padding: 0; margin: 0"><%= alumno.getFolio() %></td>
                        <td style="padding: 0; margin: 0"><%= alumno.getNombre() %></td>
                        <td style="padding: 0; margin: 0"><%= alumno.getCarrera() %></td>
                        <td class="d-flex justify-content-center align-items-center" style="margin: 0;">
                            <div class="<%= alumno.getEstado() == 1 ? "activo" : "inactivo" %>"
                                 data-estado="<%= alumno.getEstado() %>"></div>
                        </td>
                        <td style="padding: 0; margin: 0">
                            <input type="number" class="form-control calificacion-input"
                                   value="<%= alumno.getCalificacion() %>"
                                   min="0" max="10" step="0.1"
                                   data-folio="<%= alumno.getFolio() %>"
                                   onchange="actualizarCalificacion(this)"
                                   style="height: 25px; font-size: 15px; width: 100%;">
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/filtroCalificacion.js"></script>
<script>
    function actualizarCalificacion(input) {
        var folio = $(input).data('folio');
        var calificacion = $(input).val();

        $.ajax({
            url: 'ActualizarCalificacionServlet',
            method: 'POST',
            data: { folio: folio, calificacion: calificacion },
            success: function(response) {
                console.log('Calificación actualizada con éxito');
            },
            error: function(xhr, status, error) {
                console.error('Error al actualizar la calificación:', error);
            }
        });
    }

    $(document).ready(function() {
        $("#filterFolio, #filterCalificacion").on("keyup change", function() {
            var folioFilter = $("#filterFolio").val().toLowerCase();
            var calificacionFilter = $("#filterCalificacion").val();

            $("#aspirantesTableBody tr").filter(function() {
                var folio = $(this).find("td:eq(0)").text().toLowerCase();
                var calificacion = parseFloat($(this).find(".calificacion-input").val()) || 0;

                var folioMatch = folio.indexOf(folioFilter) > -1;
                var calificacionMatch = true;

                if (calificacionFilter === "0-5") {
                    calificacionMatch = calificacion >= 0 && calificacion <= 5;
                } else if (calificacionFilter === "6-7") {
                    calificacionMatch = calificacion >= 6 && calificacion <= 7;
                } else if (calificacionFilter === "8-10") {
                    calificacionMatch = calificacion >= 8 && calificacion <= 10;
                }

                $(this).toggle(folioMatch && calificacionMatch);
            });
        });
    });
</script>
</body>
</html>