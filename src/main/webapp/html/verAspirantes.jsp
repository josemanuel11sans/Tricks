<%--
  Created by IntelliJ IDEA.
  User: Josem
  Date: 18/06/2024
  Time: 09:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.tricks.dao.AspiranteDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.tricks.model.Aspirante" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aspirantes</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/faviconGrupo.svg">
    <link rel="stylesheet" href="../css/style.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
    <style>
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
    </style>
</head>
<body>
<div class="wrapper" style="height: 100vh;">
    <aside id="sidebar">
        <div class="d-flex">
            <button class="toggle-btn" type="button">
                <img src="../img_svg/logo.svg" alt="Toggle">
            </button>
            <div class="sidebar-logo">
                <a href="#">TRICKS</a>
            </div>
        </div>
        <ul class="sidebar-nav">
            <li class="sidebar-item">
                <a href="inicioAdmin.jsp" class="sidebar-link">
                    <i class="fas fa-house"></i>
                    <span>Inicio</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="consultarDivision.jsp" class="sidebar-link">
                    <i class="fas fa-school-flag"></i>
                    <span>División académica</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="consultarCarrera.jsp" class="sidebar-link">
                    <i class="fas fa-graduation-cap"></i>
                    <span>Carrera</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="verAspirantes.jsp" class="sidebar-link">
                    <i class="fas fa-users"></i>
                    <span>Aspirantes</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="verDocentes.jsp" class="sidebar-link">
                    <i class="fas fa-chalkboard-user"></i>
                    <span>Docentes</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="verGrupos.jsp" class="sidebar-link">
                    <i class="fas fa-users-rectangle"></i>
                    <span>Grupos</span>
                </a>
            </li>
        </ul>
        <div class="sidebar-footer background-color">
            <a href="../index.jsp" class="sidebar-link">
                <i class="fas fa-right-from-bracket"></i>
                <span>Salir</span>
            </a>
        </div>
    </aside>

    <div class="main">
        <div class="container mt-4 text-left">
            <h1 class="mb-4 text-light">Aspirantes</h1>

            <!-- Filtros y botón de registrar -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <input type="text" id="filterName" class="form-control" placeholder="Nombre o Matricula">
                </div>
                <div class="col-md-2">
                    <select class="custom-select" id="filterDivision" required>
                        <option value="">Grupo</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="31">31</option>
                        <option value="32">32</option>
                        <option value="36">36</option>
                        <option value="37">37</option>
                        <option value="41">41</option>
                        <option value="42">42</option>
                        <option value="46">46</option>
                        <option value="47">47</option>
                        <option value="51">51</option>
                        <option value="52">52</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <select class="custom-select" id="filterCareer" required>
                        <option value="">Estatus</option>
                        <option value="1">Activo</option>
                        <option value="2">Inactivo</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <button type="button" class="btn btnIcono w-100" data-toggle="modal"
                            data-target="#registrarAspirante">
                        Registrar aspirante
                    </button>
                </div>
            </div><br>

            <div class="container-xxl table-responsive" style="background-color: #fff; border-radius: 20px;">
                <table class="table" id="example">
                    <thead class="thead-light">
                    <tr>
                        <th>Folio</th>
                        <th>Nombre</th>
                        <th>CURP</th>
                        <th>Grupo</th>
                        <th>Estado</th>
                        <th>Editar</th>
                    </tr>
                    </thead>
                    <tbody id="aspirantesTableBody">
                    <%
                        AspiranteDAO dao = new AspiranteDAO();
                        List<Aspirante> aspirantes = dao.getAllAspirantes();
                        for (Aspirante aspirante : aspirantes) {
                    %>
                    <tr style="height: 10px; font-size: 15px">
                        <td style="padding: 0; margin: 0"><%= aspirante.getFolioAspirante() %></td>
                        <td style="padding: 0; margin: 0"><%= aspirante.getNombre() %> <%= aspirante.getApellidos() %></td>
                        <td style="padding: 0; margin: 0"><%= aspirante.getCurp() %></td>
                        <td style="padding: 0; margin: 0"><%= aspirante.getGrupo() %></td>
                        <td class="d-flex justify-content-center align-items-center" style="margin: 0;">
                            <% if (aspirante.getEstado().equals("1")){%>
                            <div class="activo" data-estado="1"></div>
                            <%} else{%>
                            <div class="inactivo" data-estado="2"></div>
                            <%}%>
                        </td>
                        <td style="padding: 0; margin: 0">
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#modificarAspirante" data-whatever="Modificar">
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

<!-- Modal registrar aspirante nuevo -->
<div class="modal fade" id="registrarAspirante" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registro de Aspirante</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="../RegistrarAspiranteServlet" method="post">
                    <div class="form-group">
                        <label for="folioAspirante" class="col-form-label">Folio del Aspirante:</label>
                        <input type="text" class="form-control" id="folioAspirante" name="folioAspirante" placeholder="Folio">
                    </div>
                    <div class="form-group">
                        <label for="nombreAspirante" class="col-form-label">Nombre del Aspirante:</label>
                        <input type="text" class="form-control" id="nombreAspirante" name="nombreAspirante" placeholder="Nombre">
                    </div>
                    <div class="form-group">
                        <label for="apellidosAspirante" class="col-form-label">Apellidos del Aspirante:</label>
                        <input type="text" class="form-control" id="apellidosAspirante" name="apellidosAspirante" placeholder="Apellidos">
                    </div>
                    <div class="form-group">
                        <label for="curpAspirante" class="col-form-label">CURP del Aspirante:</label>
                        <input type="text" class="form-control" id="curpAspirante" name="curpAspirante" placeholder="CURP">
                    </div>
                    <div class="form-group">
                        <label for="fechaNacimientoAspirante" class="col-form-label">Fecha de Nacimiento del Aspirante:</label>
                        <input type="date" class="form-control" id="fechaNacimientoAspirante" name="fechaNacimientoAspirante">
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn modalBoton2">Registrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Modal modificar aspirante -->
<div class="modal fade" id="modificarAspirante" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Actualizar Aspirante</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="../ActualizarAspiranteServlet" method="post">
                    <div class="form-group">
                        <label for="folioAspirante" class="col-form-label">Folio del Aspirante:</label>
                        <input type="text" class="form-control" id="folioAspirante" name="folioAspirante">
                    </div>
                    <div class="form-group">
                        <label for="nombreAspirante" class="col-form-label">Nombre del Aspirante:</label>
                        <input type="text" class="form-control" id="nombreAspirante" name="nombreAspirante" placeholder="Nuevo nombre">
                    </div>
                    <div class="form-group">
                        <label for="apellidosAspirante" class="col-form-label">Apellidos del Aspirante:</label>
                        <input type="text" class="form-control" id="apellidosAspirante" name="apellidosAspirante" placeholder="Nuevo apellido">
                    </div>
                    <div class="form-group">
                        <label for="curpAspirante" class="col-form-label">CURP del Aspirante:</label>
                        <input type="text" class="form-control" id="curpAspirante" name="curpAspirante" placeholder="Nuevo CURP">
                    </div>
                    <div class="form-group">
                        <label for="fechaNacimientoAspirante" class="col-form-label">Fecha de Nacimiento del Aspirante:</label>
                        <input type="date" class="form-control" id="fechaNacimientoAspirante" name="fechaNacimientoAspirante">
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn modalBoton2">Actualizar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
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
                var career = cells[4].textContent.toLowerCase(); // Columna "Estado"

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
    });
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/aspirantes.js"></script>
<script src="../js/script.js"></script>
<script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
</body>
</html>