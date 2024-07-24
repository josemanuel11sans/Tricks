<%--
  Created by IntelliJ IDEA.
  User: Josem
  Date: 18/06/2024
  Time: 09:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de Sesión</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/estilosLogin.css">
    <link rel="stylesheet" href="../css/estilosAlertas.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.12.2/dist/sweetalert2.all.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.12.2/dist/sweetalert2.min.css " rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/inicioSesion.svg">
</head>
<body>

<!-- Alertas de validaciones -->
<%
    String tipoAlerta = (String) session.getAttribute("alerta");
    String mensajeAlerta = "";

    if (tipoAlerta != null) {
        switch (tipoAlerta) {
            case "correoMal":
                mensajeAlerta = "El correo no existe en la base de datos.";
                break;
            case "contraMal":
                mensajeAlerta = "La contraseña es incorrecta.";
                break;
            case "rolMal":
                mensajeAlerta = "No tienes permiso para acceder.";
                break;
            default:
                mensajeAlerta = "";
                break;
        }

        if (!mensajeAlerta.isEmpty()) {
            String iconoAlerta = "";

            switch (tipoAlerta) {
                case "correoMal":
                    iconoAlerta = "fa-exclamation-triangle";
                    break;
                case "contraMal":
                    iconoAlerta = "fa-exclamation-triangle";
                    break;
                case "rolMal":
                    iconoAlerta = "fa-exclamation-triangle";
                    break;
                default:
                    iconoAlerta = "fa-info-circle";
                    break;
            }
%>
<div class="alerta alerta-dismissible mostrar" role="alert">
    <i class="fa <%= iconoAlerta %> icono" aria-hidden="true"></i>
    <span class="texto"><%= mensajeAlerta %></span>
    <button type="button" class="btn-cerrar" data-bs-dismiss="alert" aria-label="Close">
        <i class="fa fa-times" aria-hidden="true"></i>
    </button>
</div>
<%
            session.removeAttribute("alerta");
        }
    }
%>


<a class="btnSalir" href="../index.jsp">
    <svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 1024 1024">
        <path fill="#FFFFFF"
              d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z"></path>
    </svg>
    <span>Regresar</span>
</a>

<div class="section">
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                    <h6 class="mb-0 pb-3"><span>Docente</span><span>Admin</span></h6>
                    <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
                    <label for="reg-log"></label>
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-front">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <svg width="46" height="84" viewBox="0 0 46 84" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                            <path d="M21.0002 47.0186C11.0002 54.6186 8.16682 61.1852 8.00015 63.5186C8.00015 61.1186 9.33338 56.5186 10 54.5186C7.6 54.9186 6.66667 60.3519 6.5 63.0186C4.15518 50.5128 7.98309 43.989 10.3364 42.1412L8.5 43.5186C3.7 43.9186 1.16667 46.3519 0.5 47.5186C0 47.0186 0 45.5186 0 43.0186C0 41.0186 3.66677 39.1852 5.50015 38.5186C4.30015 36.1186 6.33349 34.8519 7.50015 34.5186C14.7002 34.5186 20.8335 28.8519 23.0002 26.0186C23.5002 27.5186 23.5002 31.0186 23.0002 33.0186C22.5002 35.0186 20.5002 33.5186 20.0002 38.0186C19.6002 41.6186 20.5002 45.5186 21.0002 47.0186Z"
                                                  fill="white"/>
                                            <path d="M27.5 75.5186C21.5 77.5186 21.3333 81.6852 22 83.5186C18.4998 81.8519 11.1995 76.6186 9.99953 69.0186C8.79953 61.4186 12.5 58.5186 15.4995 55.5186C21.4995 50.3186 26.6662 43.3519 28.4995 40.5186C38.0995 26.1186 36.4995 10.8519 34.4995 5.01855C37.9995 7.51855 44.3711 15.9532 42.5 29.5186C40.5 44.0186 28.6662 55.8519 22.4995 60.5186C38.4995 50.9186 43.8329 37.8519 44.4995 32.5186C45.3329 36.0186 45.8995 45.2186 41.4995 54.0186C37.0995 62.8186 24.9995 69.0186 19.4995 71.0186C33.0995 67.8186 41.1662 59.0186 43.4995 55.0186C43.4995 61.0186 41.1662 65.5186 39.9995 67.0186C38.333 69.0186 33.5 73.5186 27.5 75.5186Z"
                                                  fill="white"/>
                                            <path d="M23.5 0.018852C32.3 8.81885 33.8333 20.6855 33.5 25.5189V25.7518C34.1667 21.0075 34.8 10.3189 32 5.51885C29.2 0.718852 25.1667 -0.147815 23.5 0.018852Z"
                                                  fill="white"/>
                                        </svg>
                                        <!-- Formulario de Login Docente -->
                                        <form class="login-form" action="../DocenteServlet" method="post">
                                            <div class="form-group align-items-center">
                                                <div class="input-container">
                                                    <i class="fas fa-user input-icon"></i>
                                                    <input type="text" id="usernameDocente" name="mailDoc"
                                                           class="form-style" placeholder="Correo electrónico" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="passwordDocente"></label>
                                                <div class="input-group">
                                                    <i class="fas fa-lock input-icon"></i>
                                                    <input type="password" id="passwordDocente" name="contraDoc"
                                                           class="form-style" placeholder="Contraseña" required>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-block w-60">Acceder</button>
                                            <br>
                                            <div class="container d-flex align-items-center justify-content-center">
                                                <a href="" class="link">¿Olvidaste tu contraseña?</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="card-back">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <svg width="46" height="84" viewBox="0 0 46 84" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                            <path d="M21.0002 47.0186C11.0002 54.6186 8.16682 61.1852 8.00015 63.5186C8.00015 61.1186 9.33338 56.5186 10 54.5186C7.6 54.9186 6.66667 60.3519 6.5 63.0186C4.15518 50.5128 7.98309 43.989 10.3364 42.1412L8.5 43.5186C3.7 43.9186 1.16667 46.3519 0.5 47.5186C0 47.0186 0 45.5186 0 43.0186C0 41.0186 3.66677 39.1852 5.50015 38.5186C4.30015 36.1186 6.33349 34.8519 7.50015 34.5186C14.7002 34.5186 20.8335 28.8519 23.0002 26.0186C23.5002 27.5186 23.5002 31.0186 23.0002 33.0186C22.5002 35.0186 20.5002 33.5186 20.0002 38.0186C19.6002 41.6186 20.5002 45.5186 21.0002 47.0186Z"
                                                  fill="white"/>
                                            <path d="M27.5 75.5186C21.5 77.5186 21.3333 81.6852 22 83.5186C18.4998 81.8519 11.1995 76.6186 9.99953 69.0186C8.79953 61.4186 12.5 58.5186 15.4995 55.5186C21.4995 50.3186 26.6662 43.3519 28.4995 40.5186C38.0995 26.1186 36.4995 10.8519 34.4995 5.01855C37.9995 7.51855 44.3711 15.9532 42.5 29.5186C40.5 44.0186 28.6662 55.8519 22.4995 60.5186C38.4995 50.9186 43.8329 37.8519 44.4995 32.5186C45.3329 36.0186 45.8995 45.2186 41.4995 54.0186C37.0995 62.8186 24.9995 69.0186 19.4995 71.0186C33.0995 67.8186 41.1662 59.0186 43.4995 55.0186C43.4995 61.0186 41.1662 65.5186 39.9995 67.0186C38.333 69.0186 33.5 73.5186 27.5 75.5186Z"
                                                  fill="white"/>
                                            <path d="M23.5 0.018852C32.3 8.81885 33.8333 20.6855 33.5 25.5189V25.7518C34.1667 21.0075 34.8 10.3189 32 5.51885C29.2 0.718852 25.1667 -0.147815 23.5 0.018852Z"
                                                  fill="white"/>
                                        </svg>
                                        <!-- Formulario de Login Administrador -->
                                        <form class="login-form" action="../AdministradorServlet" method="post">
                                            <div class="form-group align-items-center">
                                                <div class="input-container">
                                                    <i class="fas fa-user input-icon"></i>
                                                    <input type="text" id="usernameAdmin" name="mailAdm"
                                                           class="form-style" placeholder="Correo electrónico" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="passwordAdmin"></label>
                                                <div class="input-group">
                                                    <i class="fas fa-lock input-icon"></i>
                                                    <input type="password" id="passwordAdmin" name="contraAdm"
                                                           class="form-style" placeholder="Contraseña" required>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-block w-60">Acceder</button>
                                            <br>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="../js/scriptAlertas.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
