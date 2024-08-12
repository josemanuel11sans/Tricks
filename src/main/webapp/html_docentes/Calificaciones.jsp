<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.tricks.model.Alumno" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.tricks.dao.AlumnoDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.tricks.model.Grupo" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"> <!-- Configura la codificación de caracteres -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Asegura que la página sea responsive -->
    <title>Calificaciones</title>
    <!-- Enlaces a estilos y scripts de Bootstrap, FontAwesome y archivos CSS personalizados -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/faviconGrupo.svg">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/estilosModal.css">
    <link rel="stylesheet" href="../css/estilosTabla.css">
    <link rel="stylesheet" href="../css/estilosAlertas.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
    <!-- Estilos personalizados para el layout -->
    <style>
        .wrapper { display: flex; width: 100%; align-items: stretch; } <!-- Contenedor principal que ocupa el 100% del ancho -->
        .main { width: 100%; padding: 20px; } <!-- Área principal de contenido con padding -->
        .tabla {
            background-color: #fff;
            border-radius: 20px; <!-- Bordes redondeados para la tabla -->
            overflow: hidden; <!-- Oculta el desbordamiento del contenido -->
            margin-top: 20px; <!-- Margen superior para separar la tabla del contenido superior -->
        }
        .table { margin-bottom: 0; } <!-- Elimina el margen inferior de la tabla -->
        .table th { background-color: #f8f9fa; } <!-- Color de fondo para los encabezados de la tabla -->
    </style>
</head>
<body>
<div class="wrapper" style="height: 100vh;"> <!-- Contenedor principal con altura de la pantalla completa -->
    <jsp:include page="../componentes/menuLateralDocente.jsp" /> <!-- Incluye el menú lateral para el docente -->
    <div class="main"> <!-- Área principal de contenido -->
        <div class="container mt-4 text-left">
            <h1 class="mb-4 text-light">Aspirantes del grupo</h1> <!-- Título con ID de grupo dinámico -->

            <!-- Filtros -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <!-- Filtro de calificación con opciones predefinidas -->
                    <select class="custom-select" id="filterCalificacion">
                        <option value="">Calificación...</option>
                        <option value="0-5">0-5</option>
                        <option value="6-7">6-7</option>
                        <option value="8-10">8-10</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <!-- Filtro de búsqueda por folio -->
                    <input type="text" id="filterFolio" class="form-control" placeholder="Buscar por Folio">
                </div>
            </div>

            <!-- Tabla de alumnos -->
            <div class="container-xxl tabla">
                <table id="alumnosTable" class="table table-striped" style="width:100%">
                    <thead class="thead-light">
                    <tr align="center">
                        <th>Folio</th>
                        <th>Nombre</th>
                        <th>Carrera</th>
                        <th>Estado</th>
                        <th>Calificación</th>
                    </tr>
                    </thead>
                    <tbody id="aspirantesTableBody">
                    <%
                        // Obtener la lista de alumnos desde el atributo de la solicitud
                        String grupoIdStr = request.getParameter("grupoId");
                        int grupoId = Integer.parseInt(grupoIdStr);
                        AlumnoDao dao = new AlumnoDao();
                        List<Alumno> alumnos = dao.getAlumnosPorGrupo(grupoId);

                        // Iterar sobre la lista de alumnos y mostrar los datos en la tabla
                        if (alumnos != null) {
                            for (Alumno alumno : alumnos) {
                    %>
                    <tr>
                        <!-- Mostrar datos del alumno en cada celda de la tabla -->
                        <td><%= alumno.getFolio() %></td> <!-- Folio del alumno -->
                        <td><%= alumno.getNombre() %></td> <!-- Nombre completo del alumno -->
                        <td><%= alumno.getCarrera() %></td> <!-- Carrera del alumno -->
                        <td class="text-<%= alumno.getEstado() == 1 ? "success" : "danger" %>">
                            <!-- Estado del alumno con estilo dinámico -->
                            <%= alumno.getEstado() == 1 ? "Activo" : "Inactivo" %>
                        </td>
                        <td>
                            <!-- Campo para editar la calificación del alumno -->
                            <input type="number" class="form-control calificacion-input"
                                   value="<%= alumno.getCalificacion() %>"
                                   min="0" max="10" step="0.1"
                                   data-folio="<%= alumno.getFolio() %>"
                                   onchange="actualizarCalificacion(this)">
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> <!-- jQuery para manipulación del DOM -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script> <!-- Popper.js para posicionamiento de elementos de Bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> <!-- Bootstrap JS -->
<script src="../js/filtroCalificacion.js"></script> <!-- Java scrip de filtros-->
</body>
</html>
