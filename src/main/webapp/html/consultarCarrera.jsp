<%--
  Created by IntelliJ IDEA.
  User: Joseb
  Date: 02/07/2024
  Time: 12:27 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.tricks.dao.CarreraDao" %>
<%@ page import="mx.edu.utez.tricks.dao.DivisionesAcademicasDAO" %>
<%@ page import="mx.edu.utez.tricks.model.Carrera" %>
<%@ page import="mx.edu.utez.tricks.model.DivisionesAcademicas" %>
<%@ page import="java.util.List" %>


<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrera</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/faviconCarrera.svg">
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
        <div class="container mt-5 text-left">
            <h1 class="mb-4 text-light">Carreras</h1>
            <!-- Filtros y botón de registrar -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <input type="text" id="filterName" class="form-control" placeholder="Buscar por nombre">
                </div>
                <div class="col-md-3">
                    <select class="custom-select" required>
                        <option value="">Divison Académica</option>
                        <option value="1">DAMI</option>
                        <option value="2">DATID</option>
                    </select>
                </div>

                <div class="col-md-3">
                    <!-- Botón para abrir modal de agregar carrera -->
                    <button type="button" class="btn btnIcono w-100" data-toggle="modal"
                            data-target="#registrarCarreraModal">
                        Agregar Carrera
                    </button>
                </div>
            </div><br>

            <!-- Tabla de carreras -->
            <div class="container-xxl table-responsive" style="background-color: #fff; border-radius: 20px;">
                <table class="table">
                    <thead class="thead-light">
                    <tr align="center">
                        <th>Nombre de la Carrera</th>
                        <th>División Académica</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        DivisionesAcademicasDAO divisionesAcademicasDAO = new DivisionesAcademicasDAO();
                        List<DivisionesAcademicas> listaDivisiones = divisionesAcademicasDAO.getAllDivisiones();
                    %>

                    <%
                        CarreraDao carreraDao = new CarreraDao();
                        List<Carrera> listaCarreras = carreraDao.getAllCarreras();
                        for (Carrera carrera : listaCarreras) {
                    %>
                    <tr>
                        <td><%= carrera.getNombreCarrera() %></td>
                        <td><%= carrera.getNombreDivision() %></td>
                        <td>
                            <!-- Botón para modificar carrera -->
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    data-target="#modificarCarreraModal"
                                    data-id="<%= carrera.getIdCarrera() %>"
                                    data-nombre="<%= carrera.getNombreCarrera() %>"
                                    data-idDivision="<%= carrera.getIdDivisionAcademica() %>">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Modal registrar nueva carrera -->
<div class="modal fade" id="registrarCarreraModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registrar Nueva Carrera</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="RegistrarCarreraServlet" method="post">
                <div class="modal-body">
                    <input type="hidden" name="action" value="agregar">
                    <div class="form-group">
                        <label for="nombreCarrera" class="col-form-label">Nombre de la Carrera:</label>
                        <input type="text" class="form-control" id="nombreCarrera" name="nombreCarrera" required>
                    </div>
                    <div class="form-group">
                        <label for="idDivisionAcademica" class="col-form-label">División Académica:</label>
                        <select class="custom-select" id="idDivisionAcademica" name="idDivisionAcademica" required>
                            <option value="">Seleccione división académica</option>
                            <%
                                for (DivisionesAcademicas division : listaDivisiones) {
                            %>
                            <option value="<%= division.getIdDivision() %>"><%= division.getNombreDivision() %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn modalBoton2">Registrar</button>
                </div>
            </form>
        </div>
    </div>
</div>



<!-- Modal modificar carrera -->
<div class="modal fade" id="modificarCarreraModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modificar Carrera</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="RegistrarCarreraServlet" method="post">
                <div class="modal-body">
                    <input type="hidden" name="action" value="actualizar">
                    <input type="hidden" id="idCarrera" name="idCarrera">
                    <div class="form-group">
                        <label for="nombreCarreraModificar" class="col-form-label">Nombre de la Carrera:</label>
                        <input type="text" class="form-control" id="nombreCarreraModificar" name="nombreCarrera" required>
                    </div>
                    <div class="form-group">
                        <label for="idDivisionAcademicaModificar" class="col-form-label">División Académica:</label>
                        <select class="custom-select" id="idDivisionAcademicaModificar" name="idDivisionAcademica" required>
                            <option value="">Seleccione división académica</option>
                            <%
                                for (DivisionesAcademicas division : listaDivisiones) {
                            %>
                            <option value="<%= division.getIdDivision() %>"><%= division.getNombreDivision() %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn modalBoton2">Modificar</button>
                </div>
            </form>
        </div>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/script.js"></script>
<script>
    $(document).ready(function () {
        // Llenar datos del modal de modificar carrera al hacer clic en el botón
        $('.btn-modificar').click(function () {
            var idCarrera = $(this).data('id');
            var nombreCarrera = $(this).data('nombre');
            var idDivisionAcademica = $(this).data('iddivision');

            $('#idCarrera').val(idCarrera);
            $('#nombreCarreraModificar').val(nombreCarrera);
            $('#idDivisionAcademicaModificar').val(idDivisionAcademica);

            $('#modificarCarreraModal').modal('show');
        });
    });
</script>
</body>

</html>
