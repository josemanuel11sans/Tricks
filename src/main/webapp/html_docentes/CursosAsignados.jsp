<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.tricks.dao.GruposAsignadosDao" %>
<%@ page import="mx.edu.utez.tricks.model.GrupoAsignado" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.tricks.dao.GrupoDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.tricks.model.Grupo" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cursos Asignados</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/faviconGrupo.svg">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/estilosTabla.css">
    <link rel="stylesheet" href="../css/estilosAspirantes.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
    <style>
        /* Mantener los estilos existentes */
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
        .table{
            margin-bottom: 0;
        }
        .modal-body{
            padding: 0 1.5rem;
            border-radius: .3rem;
        }
        .modal-footer{
            border: none;
        }
        .form-group{
            margin-bottom: .5rem !important;
        }
        .activo{
            width: 15px;
            height: 15px;
            border-radius: 100%;
            background-color: green;
            cursor: pointer;
        }
        .inactivo{
            width: 15px;
            height: 15px;
            border-radius: 100%;
            background-color: red;
            cursor: pointer;
        }
        td{
            vertical-align: middle !important;
        }
        .tabla{
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
    <jsp:include page="../componentes/menuLateralDocente.jsp" />

    <div class="main">
        <div class="container mt-4 text-left">
            <h1 class="mb-4 text-light">Cursos Asignados</h1>

            <!-- Filtros y botón de registrar -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <input type="text" id="filterName" class="form-control" placeholder="Carrera">
                </div>
                <div class="col-md-2">
                    <select class="custom-select" id="filterDivision" required>
                        <option value="">Grupo</option>
                        <%
                            GrupoDao dao2 = new GrupoDao();
                            ArrayList<Grupo> lista = dao2.getAll();
                            for (Grupo g : lista) {
                        %>
                        <option value="<%= g.getNombreGrupo() %>"><%= g.getNombreGrupo() %></option>
                        <% } %>
                    </select>
                </div>
            </div><br>

            <div class="container-xxl tabla">
                <table class="table" id="example">
                    <thead class="thead-light">
                    <tr>
                        <th>Grupo</th>
                        <th>Carrera</th>
                        <th>Estado</th>
                        <th>Asistencia</th>
                        <th>Calificacion</th>
                    </tr>
                    </thead>
                    <tbody id="aspirantesTableBody">
                    <%
                        GruposAsignadosDao dao = new GruposAsignadosDao();
                        List<GrupoAsignado> gruposAsignados = dao.getGruposAsignadosPorDocente((String) session.getAttribute("userEmail"));
                        for (GrupoAsignado grupo : gruposAsignados) {
                    %>
                    <tr style="height: 10px; font-size: 15px">
                        <td style="padding: 0; margin: 0"><%= grupo.getNombreGrupo() %></td>
                        <td style="padding: 0; margin: 0"><%= grupo.getCarrera() %></td>
                        <td class="d-flex justify-content-center align-items-center" style="margin: 0;">
                            <% if (grupo.getEstado() == 1) { %>
                            <div class="activo" data-estado="1" data-toggle="modal" data-target="#modificarEstado" data-whatever="ModificarEstado"></div>
                            <% } else { %>
                            <div class="inactivo" data-estado="2" data-toggle="modal" data-target="#modificarEstado" data-whatever="ModificarEstado"></div>
                            <% } %>
                        </td>
                        <td style="padding: 0; margin: 0"  >
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#modificarGrupo" data-whatever="Modificar"
                                    onclick="window.location.href='Asistencias.jsp?id=<%= grupo.getIdUsuario() %>'">
                                <i class="fas fa-download"></i>
                            </button>
                        </td>
                        <td style="padding: 0; margin: 0"  >
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#modificarGrupo" data-whatever="Modificar"
                                    onclick="window.location.href='Calificaciones.jsp?id=<%= grupo.getIdUsuario() %>'">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Mantener los modales existentes -->

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var filterName = document.getElementById('filterName');
        var filterDivision = document.getElementById('filterDivision');

        filterName.addEventListener('input', filterTable);
        filterDivision.addEventListener('change', filterTable);

        function filterTable() {
            var filterNameValue = filterName.value.toLowerCase();
            var filterDivisionValue = filterDivision.value.toLowerCase();
            var table = document.getElementById('example');
            var rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

            for (var i = 0; i < rows.length; i++) {
                var cells = rows[i].getElementsByTagName('td');
                var grupo = cells[0].textContent.toLowerCase();
                var carrera = cells[1].textContent.toLowerCase();

                var nameMatch = carrera.includes(filterNameValue);
                var divisionMatch = filterDivisionValue === '' || grupo === filterDivisionValue;

                if (nameMatch && divisionMatch) {
                    rows[i].style.display = '';
                } else {
                    rows[i].style.display = 'none';
                }
            }
        }

        // Mantener los eventos existentes para los botones
    });
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/script.js"></script>
<script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
</body>
</html>