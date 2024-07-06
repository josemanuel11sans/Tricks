<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tricks</title>
  <link rel="shortcut icon" type="image/x-icon" href="img_svg/logo.svg">
  <!-- iconos de ivan -->
  <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/estilosIndex.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<!-- menú superior -->
<div class="fondoPimario">
  <nav class="navbar navbar-light">
    <a class="navbar-brand" href="#">
      <img src="img_svg/logo.svg" alt="logo" width="30px" class="ml-3">
    </a>
    <div class="d-flex">
      <ul class="navbar-nav flex-row">
        <li class="nav-item m-3">
          <a class="nav-link text-white" href="html/login.jsp">
            <strong>Login</strong>
          </a>
        </li>
      </ul>
    </div>
  </nav>

  <br><br><br>
  <!-- main primario -->
  <div class="container d-flex justify-content-around">
    <div class="row d-flex align-items-center" id="cambiar">
      <div class="col p-5 ml-3 c1 mr-5" id="margen">
        <h1 class="text-white  vesper-libre-regular text0" style="font-size: 4rem;">
          Sistema
          Cursos de
          Inducción
        </h1>
        <p class="text-white varela-regular " style="font-size: 3vh;">
          Facilitando la organización y gestión
          de inducción para maestros y administradores.
        </p>
        <br>
        <!-- boton con animacion -->
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
<section class="feature-section">
  <div class="container">
    <h2 style="color: #fff; font-family:varela-regular ; font-size: 4rem;">Funcionalidades Clave</h2><br>
    <div class="row justify-content-center">
      <div class="col-md-4 col-sm-6">
        <div class="feature-box   ">
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
          <h3>
            <i class="fa-solid fa-chalkboard-user" style="font-size: 4rem;color: rgb(0,51,102);"></i>
          </h3>

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
          <div class="">

            <h3>Características Técnicas</h3>
            <h3>
              <i class="fa-solid fa-computer" style="font-size: 4rem;color: rgb(0,51,102); border-radius: 30px;"></i>
            </h3>
          </div>

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



<!-- aquí ponemos todo lo que no se ve en la primera pantalla -->
<!-- <div class="container-fluid">
    <div class="row">
        <div class="col-12 col-md-6 text-white full-width text-center">






    </div>
    <div class="col-12 col-md-6  text-white full-width">

    </div>
</div>


</div> -->

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>