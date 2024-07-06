<%--
  Created by IntelliJ IDEA.
  User: Joseb
  Date: 01/07/2024
  Time: 08:38 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
            <h1 class="mb-4 text-light">Consultar Divison</h1>

            <!-- Filtros y botón de registrar -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <input type="text" id="filterName" class="form-control" placeholder="Buscar por nombre">
                </div>
                <div class="col-md-3">
                    <button type="button" class="btn btnIcono w-100" data-toggle="modal"
                            data-target="#registrarGrupo">
                        Agregar division
                    </button>
                </div>
            </div><br>

            <div class="container-xxl table-responsive" style="background-color: #fff; border-radius: 20px;">
                <table class="table">
                    <thead class="thead-light">
                    <tr align="center">
                        <th>Nombre de la divison academica</th>
                        <th>Coordinador de la division academica</th>
                        <th>Modificar coordinador</th>
                    </tr>
                    </thead>
                    <tbody id="aspirantesTableBody">
                    <tr>
                        <td>División Académica de Tecnologías de la Información y Diseño</td>
                        <td>Dra. Martha Fabiola Wences Díaz</td>
                        <td>
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>División Académica de Mecánica Industrial</td>
                        <td>Jaime Vázquez Colín</td>
                        <td>
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>División Académica Económica-Administrativa</td>
                        <td>Jonathan Espinoza Mendoza</td>
                        <td>
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>División Académica de Terapia Física</td>
                        <td>Dennice Jaqueline García Mendoza</td>
                        <td>
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <!-- Añadir más filas aquí según sea necesario -->
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

<!-- Modal registrar nueva divison nuevo -->
<div class="modal fade" id="registrarGrupo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Asignar division</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="asignarGrupo" class="col-form-label">Nombre de la division academica:</label>
                    <input type="text" class="form-control" id="asignarDivison" value="Agregue nombre de la carrera" disabled>
                </div>
                <div class="form-group">
                    <label for="asignarGrupo" class="col-form-label">Nombre del coordinador:</label>
                    <input type="text" class="form-control" id="asignarCoordinador" value="Agregue nombre del coordinador" disabled>
                </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn modalBoton2">Crear</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal modificar grupo -->
<div class="modal fade" id="modificarGrupo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modificar coordinador</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="asignarCoordinador" class="col-form-label">Nombre del coordinador:</label>
                        <input type="text" class="form-control" id="asignarCoordinador" value="Agregue el nombre del coordinador" disabled>
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
<script src="js/script.js"></script>
</body>

</html>