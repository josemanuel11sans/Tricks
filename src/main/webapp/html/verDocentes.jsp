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
                    %>
                    <tr style="height: 20px; font-size: 15px">
                        <td style="padding: 0; margin: 0" ><%= u.getId_usuario() %></td>
                        <td style="padding: 0; margin: 0"  > <%= u.getNombre() %></td>
                        <td style="padding: 0; margin: 0"  ><%= u.getMail() %></td>
                        <td style="padding: 0; margin: 0"  ><%= u.Estado() %></td>
                        <td  style="padding: 0; margin: 0" >
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#modificarGrupo" data-whatever="Modificar"
                                    onclick="window.location.href='sign_in?id=<%= u.getId_usuario() %>'">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="antes" id="paginaAnterior" data-page="Anterior">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Anterior</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#" id="page-1" data-page="Página 1">1</a></li>
                    <li class="page-item"><a class="page-link" href="#" id="page-2" data-page="Página 2">2</a></li>
                    <li class="page-item"><a class="page-link" href="#" id="page-3" data-page="Página 3">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="despues" id="paginaSiguiente"
                           data-page="Posterior">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Posterior</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<!-- Modal registrar maestro nuevo  -->
<div class="modal fade" id="registrarGrupo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registrar Maestro</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" method="">
                    <div class="form-group">
                        <label for="asignarGrupo" class="col-form-label">Nombre:</label>
                        <input type="text" class="form-control" id="asignarGrupo" placeholder="Introduce el nombre del grupo">
                    </div>
                    <div class="form-group">
                        <label for="asignarGrupo" class="col-form-label">Apellido:</label>
                        <input type="text" class="form-control" id="asignarGrupo" placeholder="Introduce el apellido del grupo">
                    </div>
                    <div class="form-group">
                        <label for="asignarGrupo" class="col-form-label">Correo Electronico:</label>
                        <input type="text" class="form-control" id="asignarGrupo" placeholder="Introduce el correo electronico del docente">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn modalBoton2">Registrar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal modificar datos del docente -->
<div class="modal fade" id="modificarGrupo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modificar datos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" method="">
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Nombre:</label>
                        <input type="text" class="form-control" id="recipient-name">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Apellido:</label>
                        <input type="text" class="form-control" id="recipient-name">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Correo Electronico:</label>
                        <input type="text" class="form-control" id="recipient-name">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Estado:</label>
                        <input type="text" class="form-control" id="recipient-name">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn modalBoton2">Modificar</button>
            </div>
        </div>
    </div>
</div>

<!-- Script de la tabla de docentes -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var filterName = document.getElementById('filterName');
        var filterState = document.getElementById('filterState');

        filterName.addEventListener('input', filterTable);
        filterState.addEventListener('change', filterTable);

        function filterTable() {
            var filterNameValue = filterName.value.trim().toLowerCase();
            var filterStateValue = filterState.value.trim().toLowerCase();
            var table = document.getElementById('example');
            var rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

            for (let i = 0; i < rows.length; i++) {
                let cells = rows[i].getElementsByTagName('td');
                let name = cells[1].textContent.toLowerCase();
                let state = cells[3].textContent.trim().toLowerCase();  // Asegura que no haya espacios en blanco alrededor del texto del estado

                // Mostrar u ocultar la fila basada en los filtros
                if ((name.indexOf(filterNameValue) > -1 || filterNameValue === '') &&
                    (filterStateValue === '' || state === filterStateValue)) {
                    rows[i].style.display = '';
                } else {
                    rows[i].style.display = 'none';
                }
            }
        }
    });
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/script.js"></script>
</body>
</html>
