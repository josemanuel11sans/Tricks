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
        <li class="sidebar-item" title="Inicio">
            <a href="inicioAdmin.jsp" class="sidebar-link">
                <i class="fas fa-house"></i>
                <span>Inicio</span>
            </a>
        </li>
        <li class="sidebar-item" title="Divisiones académicas">
            <a href="verDivision.jsp" class="sidebar-link">
                <i class="fas fa-school-flag"></i>
                <span>Divisiones academicas</span>
            </a>
        </li>
        <li class="sidebar-item" title="Carreras">
            <a href="verCarrera.jsp" class="sidebar-link">
                <i class="fas fa-graduation-cap"></i>
                <span>Carreras</span>
            </a>
        </li>
        <li class="sidebar-item" title="Aspirantes">
            <a href="verAspirantes.jsp" class="sidebar-link">
                <i class="fas fa-users"></i>
                <span>Aspirantes</span>
            </a>
        </li>
        <li class="sidebar-item" title="Docentes">
            <a href="verDocentes.jsp" class="sidebar-link">
                <i class="fas fa-chalkboard-user"></i>
                <span>Docentes</span>
            </a>
        </li>
        <li class="sidebar-item" title="Grupos">
            <a href="verGrupos.jsp" class="sidebar-link">
                <i class="fas fa-users-rectangle"></i>
                <span>Grupos</span>
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

<button class="hamburger" onclick="toggleMenu()">
    <i class="fas fa-bars"></i>
</button>
<style>
    #sidebar {
        position: fixed;
        top: 0;
        left: 0;
        height: 100%;
    }

    .sidebar-nav {
        list-style-type: none;
        padding: 0;
    }

    .sidebar-item {
        margin: 15px 0;
    }

    .sidebar-link {
        color: white;
        text-decoration: none;
        display: flex;
        align-items: center;
    }

    .sidebar-link i {
        margin-right: 10px;
    }


    /* Estilos para móviles */
    @media (max-width: 768px) {
        #sidebar {
            width: 100%;
            height: auto;
            transform: translateY(-100%);
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            display: block;
        }
        #sidebar:not(.expand) .sidebar-logo,
        #sidebar:not(.expand) a.sidebar-link span {
            display: inline-block;
        }

        .hamburger {
            position: fixed;
            top: 10px;
            right: 10px;
            background-color: transparent;
            color: white;
            border: none;
            font-size: 24px;
            cursor: pointer;
            z-index: 1000;
        }

        .d-flex {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
        }

        .sidebar-nav {
            display: none;
            flex-direction: column;
        }

        .sidebar-footer {
            display: none;
        }

        #sidebar.open {
            transform: translateY(0);
        }

        #sidebar.open .sidebar-nav {
            display: flex;
        }

        #sidebar.open .sidebar-footer {
            display: block;
        }
    }
</style>
<script>
    function toggleMenu() {
        const sidebar = document.getElementById('sidebar');
        sidebar.classList.toggle('open');
    }
    const hamBurger = document.querySelector(".toggle-btn");
    function addHamburgerEventListener() {
        if (window.innerWidth > 768) {
            hamBurger.addEventListener("click", toggleSidebar);
        } else {
            hamBurger.removeEventListener("click", toggleSidebar); // Remueve el event listener si la resolución es menor o igual a 768px
        }
    }
    function toggleSidebar() {
        document.querySelector("#sidebar").classList.toggle("expand");
    }
    addHamburgerEventListener();
    window.addEventListener("resize", addHamburgerEventListener);

</script>
