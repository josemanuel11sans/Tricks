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
    <title>Docentes</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/docente.svg">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/estilosModal.css">
    <link rel="stylesheet" href="../css/estilosTabla.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
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
                        <th>Siglas</th>
                        <th>Estado</th>
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
                        <td style="padding: 0; margin: 0"><%= division.getSiglas() %></td>
                        <td style="padding: 0; margin: 0"><%= division.getEstado() %></td>
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


<!-- Modal para actualizar division -->
<form action="ActualizarDivisionServlet" method="post">
    <input type="hidden" name="idDivision" value="${division.idDivision}">

    <div class="form-group">
        <label for="nombreDivision">Nombre de la división:</label>
        <input type="text" class="form-control" id="nombreDivision" name="nombreDivision" value="${division.nombreDivision}">
    </div>

    <div class="form-group">
        <label for="siglas">Siglas:</label>
        <input type="text" class="form-control" id="siglas" name="siglas" value="${division.siglas}">
    </div>

    <div class="form-group">
        <label for="coordinadorDivision">Coordinador:</label>
        <input type="text" class="form-control" id="coordinadorDivision" name="coordinadorDivision" value="${division.coordinadorDivision}">
    </div>

    <button type="submit" class="btn btn-primary">Actualizar</button>
</form>



<!-- Modal modificar Division -->
<div class="modal fade" id="modificarGrupo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modificar division</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="ActualizarDivisionServlet" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="nombreDivision" id="nombreDivision" placeholder=" " required>
                        <label for="nombreDivision" class="col-form-label">Nuevo nombre de la division:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="siglas" id="siglas" placeholder=" " required>
                        <label for="siglas" class="col-form-label">Ingrese las nuevas siglas de la division:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="coordinadorDivision" id="coordinadorDivision" placeholder=" " required>
                        <label for="coordinadorDivision" class="col-form-label">Nombre del coordinador:</label>
                    </div>
                    <input type="hidden" name="idDivision" id="idDivision">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary">Modificar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/script.js"></script>
<script src="../js/scriptDocentes.js"></script>
</body>

</html>
