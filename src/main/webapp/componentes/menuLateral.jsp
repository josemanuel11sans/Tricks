<%--
  Created by IntelliJ IDEA.
  User: orlan
  Date: 12/07/2024
  Time: 12:57 p. m.
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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