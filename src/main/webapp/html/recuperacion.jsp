<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Recuperación</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/estilosLogin.css">
    <link rel="stylesheet" href="../css/estilosModal.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/inicioSesion.svg">
</head>
<body>
<div class="section">
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-front">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <svg width="56" height="94" viewBox="0 0 46 84" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                            <path d="M21.0002 47.0186C11.0002 54.6186 8.16682 61.1852 8.00015 63.5186C8.00015 61.1186 9.33338 56.5186 10 54.5186C7.6 54.9186 6.66667 60.3519 6.5 63.0186C4.15518 50.5128 7.98309 43.989 10.3364 42.1412L8.5 43.5186C3.7 43.9186 1.16667 46.3519 0.5 47.5186C0 47.0186 0 45.5186 0 43.0186C0 41.0186 3.66677 39.1852 5.50015 38.5186C4.30015 36.1186 6.33349 34.8519 7.50015 34.5186C14.7002 34.5186 20.8335 28.8519 23.0002 26.0186C23.5002 27.5186 23.5002 31.0186 23.0002 33.0186C22.5002 35.0186 20.5002 33.5186 20.0002 38.0186C19.6002 41.6186 20.5002 45.5186 21.0002 47.0186Z"
                                                  fill="white"/>
                                            <path d="M27.5 75.5186C21.5 77.5186 21.3333 81.6852 22 83.5186C18.4998 81.8519 11.1995 76.6186 9.99953 69.0186C8.79953 61.4186 12.5 58.5186 15.4995 55.5186C21.4995 50.3186 26.6662 43.3519 28.4995 40.5186C38.0995 26.1186 36.4995 10.8519 34.4995 5.01855C37.9995 7.51855 44.3711 15.9532 42.5 29.5186C40.5 44.0186 28.6662 55.8519 22.4995 60.5186C38.4995 50.9186 43.8329 37.8519 44.4995 32.5186C45.3329 36.0186 45.8995 45.2186 41.4995 54.0186C37.0995 62.8186 24.9995 69.0186 19.4995 71.0186C33.0995 67.8186 41.1662 59.0186 43.4995 55.0186C43.4995 61.0186 41.1662 65.5186 39.9995 67.0186C38.333 69.0186 33.5 73.5186 27.5 75.5186Z"
                                                  fill="white"/>
                                            <path d="M23.5 0.018852C32.3 8.81885 33.8333 20.6855 33.5 25.5189V25.7518C34.1667 21.0075 34.8 10.3189 32 5.51885C29.2 0.718852 25.1667 -0.147815 23.5 0.018852Z"
                                                  fill="white"/>
                                        </svg>
                                        <!-- Formulario de Login Docente -->
                                        <form class="login-form" action="../updateContra" method="post">
                                            <div class="form-group align-items-center">
                                                <div class="input-container">
                                                    <i class="fas fa-lock input-icon"></i>
                                                    <input type="password" id="contra" name="contra" class="form-style" placeholder="Contraseña nueva" required>
                                                    <input type="hidden" name="codigo" value="<%=request.getParameter("codigo")%>">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <input type="submit" class="btn btn-block w-60" value="Cambiar contraseña">
                                            </div>
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
</body>
</html>
