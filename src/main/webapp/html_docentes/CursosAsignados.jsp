<%--
  Created by IntelliJ IDEA.
  User: juani
  Date: 7/5/2024
  Time: 2:31 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <a href="http://localhost:8080/tricks_war_exploded/html_docentes/inicioDocente.jsp" class="sidebar-link">
                    <i class="fas fa-house"></i>
                    <span>Inicio</span>
                </a>
            </li>

            </li>
            <li class="sidebar-item">
                <a href="http://localhost:8080/tricks_war_exploded/html_docentes/CursosAsignados.jsp" class="sidebar-link">
                    <i class="fa-solid fa-circle-info"></i>
                    <span>Cursos</span>
                </a>
            </li>

        </ul>
        <div class="sidebar-footer background-color">
            <a href="#" class="sidebar-link">
                <i class="fas fa-right-from-bracket"></i>
                <span>Salir</span>
            </a>
        </div>
    </aside>

    <div class="main">
        <div class="container mt-4 text-left">
            <h1 class="mb-4 text-light">Cursos asignados</h1>

            <!-- Filtros y botón de registrar -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <input type="text" id="filterName" class="form-control" placeholder="Buscar por carrera">
                </div>
                <div class="col-md-3">
                    <select class="custom-select" required>
                        <option value="">Grupo</option>
                        <option value="1">A</option>
                        <option value="2">B</option>
                        <option value="3">C</option>
                        <option value="4">D</option>
                        <option value="5">F</option>
                        <option value="6">G</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <!-- con esa configuracion se trae el nodal -->

                </div>
            </div><br>

            <div class="container-xxl tabla">
                <table id="groupsTable" class="table table-striped" style="width:100%">
                    <thead class="thead-light">
                    <tr align="center">
                        <th>Grupo</th>
                        <th>Carrera</th>
                        <th>Estado</th>
                        <th>Asistencia</th>
                        <th>Calificacion</th>
                    </tr>
                    </thead>
                    <tbody id="aspirantesTableBody">
                    <tr>
                        <td>A</td>
                        <td>Desarrollo de software</td>
                        <td><i class="fa-solid fa-circle"></i></td>
                        <td>
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>

                        <td>
                            <!-- Este es tu botón -->
                            <button id="btnModificar1" class="btn btnIcono btn-modificar"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>

                    </tr>
                    <tr>
                        <td>B</td>
                        <td>Desarrollo de negocios</td>
                        <td><i class="fa-solid fa-circle"></i></td>

                        <td>
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>

                        <td>
                            <!-- Este es tu botón -->
                            <button id="btnModificar2" class="btn btnIcono btn-modificar"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>C</td>
                        <td>Diseño Grafico</td>
                        <td><i class="fa-solid fa-circle"></i></td>

                        <td>
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>

                        <td>
                            <!-- Este es tu botón -->
                            <button id="btnModificar3" class="btn btnIcono btn-modificar"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>D</td>
                        <td>Contaduria</td>
                        <td><i class="fa-solid fa-circle"></i></td>

                        <td>
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>

                        <td>
                            <!-- Este es tu botón -->
                            <button id="btnModificar4" class="btn btnIcono btn-modificar"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>F</td>
                        <td>Fisioterapia</td>
                        <td><i class="fa-solid fa-circle"></i></td>

                        <td>
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>

                        <td>
                            <!-- Este es tu botón -->
                            <button id="btnModificar5" class="btn btnIcono btn-modificar"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>G</td>
                        <td>Redes computacionales</td>
                        <td><i class="fa-solid fa-circle "> </i></td>

                        <td>
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>

                        <td>
                            <!-- Este es tu botón -->
                            <button id="btnModificar6" class="btn btnIcono btn-modificar"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <!-- Añadir más filas aquí según sea necesario -->
                    </tbody>
                </table>
            </div>
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
                        <input type="text" class="form-control" id="asignarGrupo"
                               placeholder="Introduce el nombre del grupo">
                    </div>

                    <div class="form-group">
                        <label for="asignarGrupo" class="col-form-label">Apellido:</label>
                        <input type="text" class="form-control" id="asignarGrupo"
                               placeholder="Introduce el apellido del grupo">
                    </div>

                    <div class="form-group">
                        <label for="asignarGrupo" class="col-form-label">Correo Electronico:</label>
                        <input type="text" class="form-control" id="asignarGrupo"
                               placeholder="Introduce el correo lectronico del docente">
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
                <h5 class="modal-title" id="exampleModalLabel">Modificar datos del docente</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="asignarGrupo" class="col-form-label">Nombre:</label>
                        <input type="text" class="form-control" id="asignarGrupo" value="Mauro" disabled>
                    </div>
                    <div class="form-group">
                        <label for="asignarGrupo" class="col-form-label">Apellido:</label>
                        <input type="text" class="form-control" id="asignarGrupo" value="castro">
                    </div>
                    <div class="form-group">
                        <label for="asignarGrupo" class="col-form-label">Correo electronico:</label>
                        <input type="text" class="form-control" id="asignarGrupo" value="ejemplo@gmail.com">
                    </div>

                    <div class="form-group">
                        <label for="asignarGrupo" class="col-form-label">Estado</label>
                        <select class="custom-select" required>
                            <option value="">Selecciona estado</option>
                            <option value="1">Activo</option>
                            <option value="2">Inactivo</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn modalBoton2">Modificar</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/script.js"></script>
<script>
    // JavaScript para redireccionar al hacer clic en el botón
    document.getElementById('btnModificar1').addEventListener('click', function() {
        // Redirige a la página deseada (en este ejemplo, a "otra_pagina.html")
        window.location.href = 'http://localhost:8080/tricks_war_exploded/html_docentes/Calificaciones.jsp';
    });
</script>
<script>
    // JavaScript para redireccionar al hacer clic en el botón
    document.getElementById('btnModificar2').addEventListener('click', function() {
        // Redirige a la página deseada (en este ejemplo, a "otra_pagina.html")
        window.location.href = 'http://localhost:8080/tricks_war_exploded/html_docentes/Calificaciones.jsp';
    });
</script>
<script>
    // JavaScript para redireccionar al hacer clic en el botón
    document.getElementById('btnModificar3').addEventListener('click', function() {
        // Redirige a la página deseada (en este ejemplo, a "otra_pagina.html")
        window.location.href = 'http://localhost:8080/tricks_war_exploded/html_docentes/Calificaciones.jsp';
    });
</script>
<script>
    // JavaScript para redireccionar al hacer clic en el botón
    document.getElementById('btnModificar4').addEventListener('click', function() {
        // Redirige a la página deseada (en este ejemplo, a "otra_pagina.html")
        window.location.href = 'http://localhost:8080/tricks_war_exploded/html_docentes/Calificaciones.jsp';
    });
</script>
<script>
    // JavaScript para redireccionar al hacer clic en el botón
    document.getElementById('btnModificar5').addEventListener('click', function() {
        // Redirige a la página deseada (en este ejemplo, a "otra_pagina.html")
        window.location.href = 'http://localhost:8080/tricks_war_exploded/html_docentes/Calificaciones.jsp';
    });
</script>
<script>
    // JavaScript para redireccionar al hacer clic en el botón
    document.getElementById('btnModificar6').addEventListener('click', function() {
        // Redirige a la página deseada (en este ejemplo, a "otra_pagina.html")
        window.location.href = 'http://localhost:8080/tricks_war_exploded/html_docentes/Calificaciones.jsp';
    });
</script>

</body>

</html>
