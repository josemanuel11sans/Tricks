<%--
  Created by IntelliJ IDEA.
  User: Joseb
  Date: 01/07/2024
  Time: 08:38 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.tricks.dao.DivisionesAcademicasDAO" %>
<%@ page import="mx.edu.utez.tricks.model.DivisionesAcademicas" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Division</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/faviconDivision.svg">
    <link rel="stylesheet" href="../css/style.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
    <style>
        .table-responsive {
            max-height: 70vh;
            overflow-y: auto;
        }
        table {
            border-collapse: separate;
            border-spacing: 0;
        }
        thead th {
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            background: white;
            z-index: 1;
        }
        ::-webkit-scrollbar {
            display: none;
        }
        .table{
            margin-bottom: 0;
        }
        .modal-body{
            padding: 0 1.5rem;
            border-radius: .3rem;
        }
        .modal-footer{
            border: none;
        }
        .form-group{
            margin-bottom: .5rem !important;
        }
        td{
            vertical-align: middle !important;
        }
        .tabla{
            background-color: #fff;
            border-radius: 20px;
            display: block;
            width: 100%;
            overflow-x: auto;
            max-height: 70vh;
        }
    </style>
</head>

<body>
<div class="wrapper" style="height: 100vh;">
    <jsp:include page="../componentes/menuLateral.jsp" />

    <div class="main">
        <div class="container mt-4 text-left">
            <h1 class="mb-4 text-light">Divisiones Acádemicas</h1>

            <!-- Filtros y botón de registrar -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <input type="text" id="filterName" class="form-control" placeholder="Buscar por nombre">
                </div>
                <div class="col-md-3">
                    <button type="button" class="btn btnIcono w-100" data-toggle="modal"
                            data-target="#registrarGrupo">
                        Agregar division
                    </button>
                </div>
            </div><br>

            <div class="container-xxl tabla">
                <table class="table" id="example">
                    <thead class="thead-light">
                    <tr>
                        <th>Nombre de la división académica</th>
                        <th>Coordinador de la división académica</th>
                        <th>Modificar coordinador</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        DivisionesAcademicasDAO dao = new DivisionesAcademicasDAO();
                        List<DivisionesAcademicas> lista = dao.getAllDivisiones();
                        for (DivisionesAcademicas division : lista) {
                    %>
                    <tr style="height: 10px; font-size: 15px">
                    <td style="padding: 0; margin: 0"><%= division.getNombreDivision() %></td>
                        <td style="padding: 0; margin: 0"><%= division.getCoordinadorDivision() %></td>
                        <td style="padding: 0; margin: 0">
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#modificarGrupo" data-whatever="Modificar">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Modal registrar nueva divison nuevo -->
<div class="modal fade" id="registrarGrupo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Asignar division</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="asignarGrupo" class="col-form-label">Nombre de la division academica:</label>
                    <input type="text" class="form-control" id="asignarDivison" value="Agregue nombre de la carrera" disabled>
                </div>
                <div class="form-group">
                    <label for="asignarGrupo" class="col-form-label">Nombre del coordinador:</label>
                    <input type="text" class="form-control" id="asignarCoordinador" value="Agregue nombre del coordinador" disabled>
                </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn modalBoton2">Crear</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal modificar grupo -->
<div class="modal fade" id="modificarGrupo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modificar coordinador</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="asignarCoordinador" class="col-form-label">Nombre del coordinador:</label>
                        <input type="text" class="form-control" id="asignarCoordinador" value="Agregue el nombre del coordinador" disabled>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn modalBoton2">Modificar</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="../js/script.js"></script>
<script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
</body>

</html>