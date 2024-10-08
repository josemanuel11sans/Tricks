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

<!-- Alertas de validaciones -->
<%
    String tipoAlerta = (String) session.getAttribute("alerta");
    String mensajeAlerta = "";

    if (tipoAlerta != null) {
        switch (tipoAlerta) {
            case "exito":
                mensajeAlerta = "Calificaciones modificadas correctamente.";
                break;
            case "error":
                mensajeAlerta = "Error al modificar calificaciones.";
                break;
            default:
                mensajeAlerta = "";
                break;
        }

        if (!mensajeAlerta.isEmpty()) {
            String iconoAlerta = "";

            switch (tipoAlerta) {
                case "exito":
                    iconoAlerta = "fa-check-circle";
                    break;
                case "error":
                    iconoAlerta = "fa-times-circle";
                    break;
                default:
                    iconoAlerta = "fa-info-circle";
                    break;
            }
%>
<div class="alerta alerta-dismissible mostrar" role="alert">
    <i class="fa <%= iconoAlerta %> icono" aria-hidden="true"></i>
    <span class="texto"><%= mensajeAlerta %></span>
    <button type="button" class="btn-cerrar" data-bs-dismiss="alert" aria-label="Close">
        <i class="fa fa-times" aria-hidden="true"></i>
    </button>
</div>
<%
            session.removeAttribute("alerta");
        }
    }
%>



<div class="wrapper desva" style="height: 100vh;">
    <li class="sidebar-item" title="Inicio" style="position: absolute; top: 3%; left: 20px;">
        <a href="../html_docentes/inicioDocente.jsp" class="sidebar-link">
            <i class="fas fa-house"></i>
        </a>
    </li>
    <div class="main desva">
        <div class="container mt-4 text-left">
            <h1 class="mb-4 text-light">Aspirantes del grupo</h1>

            <!-- Filtros -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <select class="custom-select" id="filterCalificacion">
                        <option value="">Calificación...</option>
                        <option value="0-5">0-6</option>
                        <option value="6-7">6.1-8</option>
                        <option value="8-10">8.1-10</option>
                    </select>


                </div>
                <div class="col-md-3">
                    <input type="text" id="filterFolio" class="form-control" placeholder="Buscar por Folio">
                </div>
                <div class="col-md-3">
                    <select class="custom-select" id="filterEstado">
                        <option value="">Estado...</option>
                        <option value="1">Activo</option>
                        <option value="2">Inactivo</option>
                    </select>
                </div>
                <div class="col-md-3 d-flex align-items-center">
                    <button type="button" id="updateCalificacionesBtn" class="btn btn-primary mr-2">Calificar</button>
                    <td style="padding: 0; margin: 0">
                        <form method="post" action="../pdf">
                            <td style="padding: 0; margin: 0">
                                <button type="submit" class="btn btn-primary d-flex justify-content-center align-items-center" style="width: 38px; height: 38px;">
                                    <i class="fas fa-download"></i>
                                </button>
                            </td>
                        </form>
                    </td>
                </div>
            </div>

            <!-- Tabla de alumnos -->
            <div class="container-xxl tabla">
                <form id="calificacionesForm">
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
                            String estadoStr = request.getParameter("estado");
                            Integer estado = (estadoStr != null && !estadoStr.isEmpty()) ? Integer.parseInt(estadoStr) : null;
                            AlumnoDao dao = new AlumnoDao();
                            List<Alumno> alumnos = dao.getAlumnosPorGrupo(grupoId, estado);

                            if (alumnos != null) {
                                for (Alumno alumno : alumnos) {
                        %>
                        <tr style="height: 10px; font-size: 15px">
                            <td style="padding: 0; margin: 0"><%= alumno.getFolio() %></td>
                            <td style="padding: 0; margin: 0"><%= alumno.getNombre() %></td>
                            <td style="padding: 0; margin: 0"><%= alumno.getCarrera() %></td>
                            <td class="d-flex justify-content-center align-items-center" style="margin: 0;">
                                <div class="<%= alumno.getEstado() == 1 ? "activo" : "inactivo"%>"
                                     data-estado="<%= alumno.getEstado() %>" style="cursor: auto"></div>
                            </td>
                            <td style="padding: 0; margin: 0; text-align: center;">
                                <% if ( alumno.getEstado() == 1 ) {%>
                                <input type="number" name="calificaciones[<%= alumno.getFolio() %>]" class="form-control calificacion-input"
                                       value="<%= alumno.getCalificacion() %>"
                                       min="0" max="10" step="0.1"
                                       style="height: 25px; font-size: 15px; width: 50%; margin: 0 auto;">
                                <% }else{%>
                                <input type="number" name="calificaciones[<%= alumno.getFolio() %>]" class="form-control calificacion-input"
                                       value="<%= alumno.getCalificacion() %>"
                                       min="0" max="10" step="0.1"
                                       style="height: 25px; font-size: 15px; width: 50%; margin: 0 auto;" disabled>
                                <%}%>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                        </tbody>
                    </table>
                </form>
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
    $(document).ready(function() {
        $('#updateCalificacionesBtn').click(function() {
            var formData = $('#calificacionesForm').serialize(); // Serializa todos los datos del formulario

            $.ajax({
                url: '../ActualizarCalificacionesServlet',
                method: 'POST',
                data: formData,
                success: function(response) {
                    if (response.trim() === "exito") {
                        // Recarga la página automáticamente después de una actualización exitosa
                        window.location.reload();
                    } else {
                        // Muestra un mensaje de error si la actualización falló
                        window.location.reload();
                    }
                },
                error: function(xhr, status, error) {
                    alert('Error al actualizar las calificaciones: ' + xhr.responseText);
                }
            });
        });

        $('#filterEstado').change(function() {
            var estado = $(this).val();
            var grupoId = '<%= grupoIdStr %>'; // Obtén el ID del grupo
            window.location.href = "Calificaciones.jsp?grupoId=" + grupoId + "&estado=" + estado;
        });
    });

</script>
<script>document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("filterEstado").addEventListener("change", function() {
        var estado = this.value;
        var grupoId = new URLSearchParams(window.location.search).get('grupoId');
        var url = '/tricks_war_exploded/html_docentes/Calificaciones.jsp?grupoId=' + grupoId + '&estado=' + estado;

        window.location.href = url;
    });
});
</script>

<script>
    // JavaScript para ocultar automáticamente la alerta después de 5 segundos
    document.addEventListener('DOMContentLoaded', function() {
        const alerta = document.querySelector('.alerta');

        if (alerta.classList.contains('mostrar')) {
            setTimeout(function() {
                alerta.classList.add('ocultar');
            }, 5000); // 5000 ms = 5 segundos

            // Remover la alerta del DOM después de la transición (opcional)
            alerta.addEventListener('transitionend', function() {
                if (alerta.classList.contains('ocultar')) {
                    alerta.remove();
                }
            });
        }
    });

</script>

<script src="../js/scriptAlertas.js"></script>
</body>
</html>
