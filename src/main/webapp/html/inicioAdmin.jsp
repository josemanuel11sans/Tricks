<%--
  Created by IntelliJ IDEA.
  User: orlan
  Date: 29/06/2024
  Time: 08:00 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.tricks.dao.UsuarioDao" %>
<%@ page import="mx.edu.utez.tricks.dao.HistorialDao" %>
<%@ page import="mx.edu.utez.tricks.model.Historial" %>
<%@ page import="java.util.ArrayList" %>

<%
    UsuarioDao usuarioDao = new UsuarioDao();
    int aspirantesCount = usuarioDao.getAspirantesCount();
    int docentesCount = usuarioDao.getDocentesCount();
    int carrerasCount = usuarioDao.getCarrerasCount();
    int gruposCount = usuarioDao.getGruposCount();
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/faviconInicio.svg">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/estilosTabla.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
    <!--desacivar estos comentario en caso de ser requerido NOTA ES UNA CDN-->
    <!--<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>-->
    <script src="../js/sweetalert2.js"></script>
</head>
<body>
<div class="wrapper" style="height: 100vh;">
    <jsp:include page="../componentes/menuLateral.jsp" />

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
                            <h5 class="card-title card-title-custom">Aspirantes</h5>
                            <p class="card-text card-text-custom"><%= aspirantesCount %></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card text-white bg-primary card-custom">
                        <div class="card-body text-center">
                            <div class="icon-container mb-2">
                                <i class="fas fa-chalkboard-teacher icon-custom"></i>
                            </div>
                            <h5 class="card-title card-title-custom">Docentes</h5>
                            <p class="card-text card-text-custom"><%= docentesCount %></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card text-white bg-info card-custom">
                        <div class="card-body text-center">
                            <div class="icon-container mb-2">
                                <i class="fas fa-graduation-cap icon-custom"></i>
                            </div>
                            <h5 class="card-title card-title-custom">Carreras</h5>
                            <p class="card-text card-text-custom"><%= carrerasCount %></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card text-white bg-success card-custom">
                        <div class="card-body text-center">
                            <div class="icon-container mb-2">
                                <i class="fas fa-users-rectangle icon-custom"></i>
                            </div>
                            <h5 class="card-title card-title-custom">Grupos</h5>
                            <p class="card-text card-text-custom"><%= gruposCount %></p>
                        </div>
                    </div>
                </div>
            </div>

            <h3 class="mb-4 text-light text-center">Historial de acciones</h3>
            <!-- Tabla de datos del historial -->
            <div class="container-xxl table2" style="background-color: #fff; border-radius: 20px;">
                <table class="table">
                    <thead class="thead-light">
                    <tr align="center">
                        <th>Usuario</th>
                        <th>Descripción</th>
                        <th>Fecha</th>
                    </tr>
                    </thead>
                    <tbody id="actividadesTableBody">
                    <%
                        HistorialDao historialDao = new HistorialDao();
                        ArrayList<Historial> historialList = historialDao.getAll();
                        for (Historial h : historialList) {
                    %>
                    <tr>
                        <td><%= h.getUsuarioIdusuario() %></td>
                        <td><%= h.getDescripcion() %></td>
                        <td><%= h.getFecha_creacion() %></td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <br><br>
        <div style="position: fixed; bottom: 20px; right: 20px;">
            <img src="../img_svg/ayuda.svg" id="help-icon" style="cursor: pointer;" alt="Ayuda">
        </div>
    </div>
    </div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/script.js"></script>
</body>
</html>
