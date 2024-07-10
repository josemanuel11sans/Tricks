<%--
  Created by IntelliJ IDEA.
  User: Josem
  Date: 25/06/2024
  Time: 09:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.tricks.dao.UsuarioDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.tricks.model.Usuario" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Docentes</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/docente.svg">
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
            <h1 class="mb-4 text-light">Docentes</h1>

            <!-- Filtros y botón de registrar -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <input type="text" id="filterName" class="form-control" placeholder="Buscar por nombre">
                </div>
                <div class="col-md-3">
                    <select id="filterState" class="custom-select" required>
                        <option value="">Estado</option>
                        <option value="Activo">Activo</option>
                        <option value="NoActivo">No Activo</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <button type="button" class="btn btnIcono w-100" data-toggle="modal" data-target="#registrarGrupo">
                        Registrar Maestro
                    </button>
                </div>
            </div><br>

            <div class="container-xxl table-responsive" style="background-color: #fff; border-radius: 20px;">
                <table id="example" class="table table-striped" style="width:100%">
                    <thead class="thead-light">
                    <tr align="center">
                        <th>Matricula</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Estado</th>
                        <th>Modificar</th>
                    </tr>
                    </thead>
                    <tbody id="aspirantesTableBody">
                    <%
                        UsuarioDao dao = new UsuarioDao();
                        ArrayList<Usuario> lista = dao.getAll();
                        for (Usuario u : lista) {
                            String estadoClase = u.getEstado().equals("1") ? "activo" : "inactivo";
                    %>
                    <tr style="height: 20px; font-size: 15px">
                        <td style="padding: 0; margin: 0"><%= u.getId_usuario() %></td>
                        <td style="padding: 0; margin: 0"><%= u.getNombre() %></td>
                        <td style="padding: 0; margin: 0"><%= u.getMail() %></td>
                        <td class="d-flex justify-content-center align-items-center" style="margin: 0;">
                            <% if (u.getEstado().equals("1")) { %>
                            <button class="activo" data-id="<%= u.getId_usuario() %>" data-estado="2" data-toggle="modal" data-target="#modificarEstado"></button>
                            <% } else { %>
                            <button class="inactivo" data-id="<%= u.getId_usuario() %>" data-estado="1" data-toggle="modal" data-target="#modificarEstado"></button>
                            <% } %>
                        </td>
                        <td style="padding: 0; margin: 0">
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#modificarDocente" data-whatever="Modificar"
                                    onclick="cargarDatosDocente('<%= u.getId_usuario() %>', '<%= u.getNombre() %>', '<%= u.getApellido() %>', '<%= u.getMail() %>', '<%= u.getContra() %>')">
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

<!-- Modal registrar maestro nuevo  -->
<div class="modal fade" id="registrarGrupo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registrar Maestro</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="../RegistrarDocenteServlet" method="post">
                    <div class="form-group">
                        <label for="idDocente" class="col-form-label">Matrícula:</label>
                        <input type="text" class="form-control" id="idDocente" name="idDocente" placeholder="Introduce la matrícula del docente" required>
                    </div>
                    <div class="form-group">
                        <label for="nombre" class="col-form-label">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Introduce el nombre del docente" required>
                    </div>
                    <div class="form-group">
                        <label for="apellido" class="col-form-label">Apellido:</label>
                        <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Introduce el apellido del docente" required>
                    </div>
                    <div class="form-group">
                        <label for="mail" class="col-form-label">Correo Electrónico:</label>
                        <input type="email" class="form-control" id="mail" name="mail" placeholder="Introduce el correo electrónico del docente" required>
                    </div>
                    <div class="form-group">
                        <label for="contra" class="col-form-label">Contraseña:</label>
                        <input type="password" class="form-control" id="contra" name="contra" placeholder="Introduce la contraseña del docente" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary">Registrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal modificar datos del docente -->
<div class="modal fade" id="modificarDocente" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modificar datos del docente</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="../ModificarDocenteServlet" method="post">
                    <div class="form-group">
                        <label for="idDocenteMod" class="col-form-label">Matrícula:</label>
                        <input type="text" class="form-control" id="idDocenteMod" name="idDocente" placeholder="Matrícula" readonly>
                    </div>
                    <div class="form-group">
                        <label for="nombreMod" class="col-form-label">Nombre:</label>
                        <input type="text" class="form-control" id="nombreMod" name="nombre" placeholder="Nombre" required>
                    </div>
                    <div class="form-group">
                        <label for="apellidoMod" class="col-form-label">Apellido:</label>
                        <input type="text" class="form-control" id="apellidoMod" name="apellido" placeholder="Apellido" required>
                    </div>
                    <div class="form-group">
                        <label for="mailMod" class="col-form-label">Correo Electrónico:</label>
                        <input type="email" class="form-control" id="mailMod" name="mail" placeholder="Correo Electrónico" required>
                    </div>
                    <div class="form-group">
                        <label for="contraMod" class="col-form-label">Contraseña:</label>
                        <input type="password" class="form-control" id="contraMod" name="contra" placeholder="Contraseña" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn modalBoton2">Modificar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        $('#modificarEstado').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var idDocente = button.data('id');
            var nuevoEstado = button.data('estado');
            var modal = $(this);
            modal.find('#idDocenteEstado').val(idDocente);
            modal.find('#nuevoEstado').val(nuevoEstado);
        });
    });

    function cargarDatosDocente(idDocente, nombre, apellido, mail, contra) {
        $('#idDocenteMod').val(idDocente);
        $('#nombreMod').val(nombre);  // Asigna el nombre al campo de nombre
        $('#apellidoMod').val(apellido);  // Asigna el apellido al campo de apellido
        $('#mailMod').val(mail);  // Asigna el mail al campo de mail
        $('#contraMod').val(contra);  // Asigna la contraseña al campo de contraseña
    }
</script>
<script src="../js/script.js"></script>
</body>
</html>

