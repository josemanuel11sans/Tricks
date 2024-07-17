<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tricks</title>
  <link rel="shortcut icon" type="image/x-icon" href="img_svg/logo.svg">
  <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/estilosIndex.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

  <style>
    .navbar {
      background-color: rgba(0, 51, 102, 0.9);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      transition: background-color 0.5s ease, box-shadow 0.5s ease;
    }

    .navbar:hover {
      background-color: rgba(0, 51, 102, 1);
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
    }

    .nav-link {
      color: #fff;
      font-weight: bold;
      padding: 10px 20px;
      border-bottom: 2px solid transparent;
      transition: color 0.3s ease, border-bottom 0.3s ease;
    }

    .nav-link:hover {
      color: #107863;
      border-bottom: 2px solid #107863;
    }

    .fade-in {
      animation: fadeIn 1.5s ease-in-out;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
      }

      to {
        opacity: 1;
      }
    }

    .button_slide {
      color: #FFF;
      border: 2px solid #107863;
      padding: 18px 36px;
      display: inline-block;
      font-family: "Lucida Console", Monaco, monospace;
      font-size: 14px;
      letter-spacing: 1px;
      cursor: pointer;
      box-shadow: inset 0 0 0 0 #ffffff;
      transition: ease-out 0.4s;
      border-radius: 40px;
    }

    .slide_right:hover {
      box-shadow: inset 400px 0 0 0 #ffffff;
      color: #000000;
    }

    body {
      background-image: url(./img_svg/fondosuperior.svg);
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center;
      height: 100vh;
      background-attachment: fixed;
      animation: backgroundFade 10s ease-in-out infinite alternate;
    }

    @keyframes backgroundFade {
      0% {
        filter: brightness(100%);
      }

      100% {
        filter: brightness(70%);
      }
    }

    .feature-box {
      background: #f8f9fa;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s, box-shadow 0.3s;
    }

    .feature-box:hover {
      transform: translateY(-5px);
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
    }
  </style>
</head>

<body>
<div class="fondoPimario fade-in">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">
      <img src="img_svg/logo.svg" alt="logo" width="30px" class="ml-3">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="html/login.jsp">Ingresar</a>
        </li>
      </ul>
    </div>
  </nav>

  <br><br><br>

  <!-- Main Content -->
  <div class="container d-flex justify-content-around fade-in">
    <div class="row d-flex align-items-center" id="cambiar">
      <div class="col p-5 ml-3 c1 mr-5" id="margen">
        <h1 class="text-white vesper-libre-regular text0" style="font-size: 4rem;">
          Sistema
          Cursos de
          Inducción
        </h1>
        <p class="text-white varela-regular" style="font-size: 3vh;">
          Facilitando la organización y gestión
          de inducción para maestros y administradores.
        </p>
        <br>
        <a href="#info" class="">
          <div class="button_slide slide_right">
            Información
          </div>
        </a>
      </div>
      <div class="col p-5 c1 ml-5" id="margen">
        <img src="./img_svg/libro.svg" alt="" class="img-fluid">
      </div>
    </div>
  </div>
</div>

<a href="" id="info"></a>

<!-- Feature Section -->
<section class="feature-section fade-in">
  <div class="container">
    <h2 style="color: #fff; font-family: varela-regular; font-size: 4rem;">Funcionalidades Clave</h2>
    <br>
    <div class="row justify-content-center">
      <div class="col-md-4 col-sm-6">
        <div class="feature-box">
          <h3>Para Administradores</h3>
          <h3><i class="fa-solid fa-gears" style="font-size: 4rem; color: rgb(0,51,102);"></i></h3>
          <ul>
            <li>Inicio de sesión seguro</li>
            <li>Actualización de datos</li>
            <li>Registro de carreras y aspirantes</li>
            <li>Registro y asignación de docentes</li>
            <li>Gestión de grupos y asignación de aspirantes</li>
          </ul>
        </div>
        <br><br>
      </div>
      <div class="col-md-4 col-sm-6">
        <div class="feature-box">
          <h3>Para Docentes</h3>
          <h3><i class="fa-solid fa-chalkboard-user" style="font-size: 4rem;color: rgb(0,51,102);"></i></h3>
          <ul>
            <li>Asignación de calificaciones</li>
            <li>Inicio de sesión seguro</li>
            <li>Generación de listas de asistencia</li>
            <li>Visualización de información de cursos</li>
          </ul>
        </div>
        <br><br>
      </div>
      <div class="col-md-4 col-sm-6">
        <div class="feature-box">
          <h3>Características Técnicas</h3>
          <h3><i class="fa-solid fa-computer" style="font-size: 4rem;color: rgb(0,51,102); border-radius: 30px;"></i></h3>
          <ul>
            <li>Diseño minimalista e intuitivo</li>
            <li>Verificación de datos para evitar errores</li>
            <li>Conexiones seguras a la base de datos</li>
            <li>Paginación de listas para eficiencia</li>
            <li>Desarrollado con tecnologías modernas mysql, js, html y java</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
