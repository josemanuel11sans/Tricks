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
    <!-- Componente de menú lateral -->
    <jsp:include page="../componentes/menuLateral.jsp" />

    <!-- Cuerpo de la página -->
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

            <!-- Tabla de datos del docente -->
            <div class="container-xxl tabla">
                <table class="table" id="example">
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
                    %>
                    <tr style="height: 20px; font-size: 15px" data-id="<%= u.getId_usuario() %>">
                        <td style="padding: 0; margin: 0"><%= u.getId_usuario() %></td>
                        <td style="padding: 0; margin: 0"><%= u.getNombre() %> <%= u.getApellido()%></td>
                        <td style="padding: 0; margin: 0"><%= u.getMail() %></td>
                        <td class="d-flex justify-content-center align-items-center" style="margin: 0;">
                            <% if (u.getEstado().equals("1")) { %>
                            <div class="activo" data-estado="1" data-toggle="modal" data-target="#modificarEstadoDocente" data-whatever="ModificarEstadoDocente"></div>
                            <% } else { %>
                            <div class="inactivo" data-estado="2" data-toggle="modal" data-target="#modificarEstadoDocente" data-whatever="ModificarEstadoDocente"></div>
                            <% } %>
                        </td>
                        <td style="padding: 0; margin: 0">
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#modificarDocente"
                                    data-id="<%= u.getId_usuario() %>"
                                    data-nombre="<%= u.getNombre() %>"
                                    data-apellido="<%= u.getApellido() %>"
                                    data-mail="<%= u.getMail() %>"
                                    data-contra="<%= u.getContra() %>">
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

<!-- Modal registrar maestro nuevo -->
<div class="modal fade" id="registrarGrupo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Registrar Maestro</h5>
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
                <h5 class="modal-title">Modificar datos del docente</h5>
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

<!-- Modal modificar datos del docente -->
<div class="modal fade" id="modificarEstadoDocente" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modificar datos del docente</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="../ModificarEstadoDocServlet" method="post">
                    <h6 class="" id="exampleModalLabel" style="margin-top: 20px; margin-bottom: 0; text-align: center;">Estas seguro de cambiar el estado del aspirante?</h6>
                    <div class="form-group" style="display: none">
                        <label for="idDocente2" class="col-form-label">Matrícula:</label>
                        <input type="text" class="form-control" id="idDocente2" name="idDocente2" placeholder="Matrícula" required>
                    </div>
                    <div class="form-group" style="display: none">
                        <label for="estadoDocente" class="col-form-label">Estado:</label>
                        <input type="text" class="form-control" id="estadoDocente" name="estadoDocente" placeholder="Estado" required>
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

<script>
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
</script>

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

</script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/script.js"></script>
</body>
</html>

