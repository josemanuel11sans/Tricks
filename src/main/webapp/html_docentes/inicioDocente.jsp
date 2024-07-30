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
    <title>Docentes</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/docente.svg">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/estilosModal.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
<div class="wrapper" style="height: 100vh;">
    <jsp:include page="../componentes/menuLateralDocente.jsp" />

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
                <div class="col-md-6 col-sm-12 mb-3">
                    <div class="card text-white bg-success card-custom">
                        <div class="card-body text-left" style="width: 100%;">
                            <h5 class="card-title">Mauro bahena castro</h5>
                            <p class="card-text">docente@ejemplo.com</p>
                            <p class="card-text"> Información adicional sobre el docente.</p>
                            <!-- este boton muestra el modal de cambiar contraseña   -->
                            <button type="button" class="btn btnIcono w-100" data-toggle="modal"
                                    data-target="#cambairContrasena">
                                Cambiar contraseña
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="position: fixed; bottom: 20px; right: 20px;">
            <img src="../img_svg/ayuda.svg" id="help-icon" style="cursor: pointer;" alt="Ayuda">
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
                                <input type="text" class="form-control" id="contraseñaAnterior" name="ContraseñaAnterior" placeholder="" required>
                                <label for="contraseñaAnterior" class="col-form-label">Contraseña anterior</label>
                        </div>

                        <div class="form-group">
                            <input type="text" class="form-control" id="contraseñaNueva" name="ContraseñaNueva" placeholder="" required>
                            <label for="contraseñaNueva" class="col-form-label">Contraseña nueva</label>
                        </div>

                        <div class="form-group">
                            <input type="text" class="form-control" id="confirmarContraseña" name="confirmarContraseña" placeholder="" required>
                            <label for="confirmarContraseña" class="col-form-label">Confirma la contraseña</label>
                        </div>

                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Crear</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="../js/script.js"></script>
</body>

</html>
