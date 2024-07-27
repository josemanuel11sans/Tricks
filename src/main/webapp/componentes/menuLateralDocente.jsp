<%--
  Created by IntelliJ IDEA.
  User: orlan
  Date: 26/07/2024
  Time: 12:57 p.m.
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
        <li class="sidebar-item" title="Inicio">
            <a href="../html_docentes/inicioDocente.jsp" class="sidebar-link">
                <i class="fas fa-house"></i>
                <span>Inicio</span>
            </a>
        </li>
        <li class="sidebar-item" title="Cursos asignados">
            <a href="../html_docentes/CursosAsignados.jsp" class="sidebar-link">
                <i class="fa-solid fa-circle-info"></i>
                <span>Cursos</span>
            </a>
        </li>
    </ul>
    <div class="sidebar-footer background-color" title="Salir">
        <a href="../index.jsp" class="sidebar-link">
            <i class="fas fa-right-from-bracket"></i>
            <span>Salir</span>
        </a>
    </div>
</aside>