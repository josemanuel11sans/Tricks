<%--
  Created by IntelliJ IDEA.
  User: juani
  Date: 7/5/2024
  Time: 2:33 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="img/faviconInicio.svg">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
</head>

<body>
<div class="wrapper" style="height: 100vh;">
    <!-- menu de inicio -->
    <aside id="sidebar">
        <div class="d-flex">
            <button class="toggle-btn" type="button">
                <img src="img/logo.svg" alt="Toggle">
            </button>
            <div class="sidebar-logo">
                <a href="#">TRICKS</a>
            </div>
        </div>
        <ul class="sidebar-nav">
            <li class="sidebar-item">
                <a href="inicioDocente.html" class="sidebar-link">
                    <i class="fas fa-house"></i>
                    <span>Inicio</span>
                </a>
            </li>

            <li class="sidebar-item">
                <a href="CursosAsignados.html" class="sidebar-link">
                    <i class="fa-solid fa-circle-info"></i>
                    <span>Cursos</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="Calificaciones.html" class="sidebar-link">
                    <i class="fa-regular fa-star"></i>
                    <span>Calificaciones</span>
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
        <div class="container mt-5 text-left">
            <h1 class="mb-4 text-light">Inicio</h1>
            <div class="row">
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card text-white bg-warning card-custom">
                        <div class="card-body text-center">
                            <div class="icon-container mb-2">
                                <i class="fas fa-users icon-custom"></i>
                            </div>
                            <h5 class="card-title card-title-custom">Gupos asignados</h5>
                            <p class="card-text card-text-custom">3</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card text-white bg-primary card-custom">
                        <div class="card-body text-center">
                            <div class="icon-container mb-2">
                                <i class="fas fa-chalkboard-teacher icon-custom"></i>
                            </div>
                            <h5 class="card-title card-title-custom">Grupos por calificar</h5>
                            <p class="card-text card-text-custom">2</p>
                        </div>
                    </div>
                </div>
                <!-- <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card text-white bg-info card-custom">
                        <div class="card-body text-center">
                            <div class="icon-container mb-2">
                                <i class="fas fa-graduation-cap icon-custom"></i>
                            </div>
                            <h5 class="card-title card-title-custom">Carreras registradas</h5>
                            <p class="card-text card-text-custom">71</p>
                        </div>
                    </div>
                </div> -->
                <div class="col-md-6 col-sm-12 mb-3">
                    <div class="card text-white bg-success card-custom">
                        <div class="card-body text-left" style="width: 100%;">
                            <h5 class="card-title">Mauro bahena castro</h5>
                            <p class="card-text">docente@ejemplo.com</p>
                            <p class="card-text"> Información adicional sobre el docente.</p>
                            <!-- este boton muestra el modal de cambiar contraseña   -->
                            <button type="button" class="btn btnIcono w-100" data-toggle="modal" data-target="#cambairContrasena">
                                Cambiar contraseña
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <h3 class="mb-4 text-light text-center">Historial de acciones</h3>
            <div class="container-xxl table-responsive" style="background-color: #fff; border-radius: 20px;">
                <table class="table">
                    <thead class="thead-light">
                    <tr align="center">
                        <th>Usuario</th>
                        <th>Descripción</th>
                        <th>Fecha</th>
                    </tr>
                    </thead>
                    <tbody id="actividadesTableBody">
                    <tr>
                        <td>Admin</td>
                        <td>Se ha registrado Juan Pérez como nuevo aspirante</td>
                        <td>20/08/24</td>
                    </tr>
                    <tr>
                        <td>Admin</td>
                        <td>Se ha modificado una carrera</td>
                        <td>15/08/24</td>
                    </tr>
                    <tr>
                        <!-- <td>Admin</td>
                        <td>Se ha creado un nuevo grupo llamado B</td>
                        <td>11/06/24</td> -->
                    </tr>
                    <!-- Puedes agregar más filas según necesites -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <!-- modal cambiar contraseña -->
    <div class="modal fade" id="cambairContrasena" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Cambiar contraseña</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form>
                        <div class="form-group">
                            <div class="containerme">
                                <label for="nuevaContrasena" class="col-form-label">Nueva contraseña</label>
                                <button class="boton" type="button" id="toggleNuevaContrasena">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                            <div class="input-group ">
                                <input type="password" class="form-control" id="nuevaContrasena" placeholder="Introduce la contraseña" >
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="containerme">
                                <label for="confirmaContrasena" class="col-form-label">Confirma tu contraseña</label>
                                <button class="boton " type="button" id="toggleConfirmaContrasena">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>

                            <div class="input-group">
                                <input type="password" class="form-control" id="confirmaContrasena" placeholder="Introduce la contraseña"  >

                            </div>
                        </div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn modalBoton2">Crear</button>
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
