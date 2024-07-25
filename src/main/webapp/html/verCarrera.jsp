<%--
  Created by IntelliJ IDEA.
  User: Joseb
  Date: 02/07/2024
  Time: 12:27 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.tricks.dao.CarreraDao" %>
<%@ page import="mx.edu.utez.tricks.dao.DivisionesAcademicasDAO" %>
<%@ page import="mx.edu.utez.tricks.model.Carrera" %>
<%@ page import="mx.edu.utez.tricks.model.DivisionesAcademicas" %>
<%@ page import="java.util.List" %>


<html lang="en">

<head>
    <meta charset="UTF-8">



    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carreras</title>
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
            <h1 class="mb-4 text-light">Carreras</h1>
            <!-- Filtros y botón de registrar -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <input type="text" id="filterName" class="form-control" placeholder="Buscar por nombre">
                </div>
                <div class="col-md-3">
                    <select class="custom-select" required>
                        <option value=""> división académica</option>
                        <%
                            DivisionesAcademicasDAO divisionesAcademicasDAO = new DivisionesAcademicasDAO();
                            List<DivisionesAcademicas> listaDivisiones = divisionesAcademicasDAO.getAllDivisiones();
                            for (DivisionesAcademicas division : listaDivisiones) {
                        %>
                        <option value="<%= division.getSiglas() %>"><%= division.getSiglas() %></option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <div class="col-md-3">
                    <!-- Botón para abrir modal de agregar carrera -->
                    <button type="button" class="btn btnIcono w-100" data-toggle="modal"
                            data-target="#registrarCarreraModal">
                        Agregar Carrera
                    </button>
                </div>
            </div><br>

            <!-- Tabla de carreras -->
            <div class="container-xxl table-responsive" style="background-color: #fff; border-radius: 20px;">
                <table class="table">
                    <thead class="thead-light">
                    <tr>
                        <th>Nombre de la Carrera</th>
                        <th>División Académica</th>
                        <th>Modificar</th>
                    </tr>
                    </thead>
                    <tbody>

                    <%
                        CarreraDao carreraDao = new CarreraDao();
                        List<Carrera> listaCarreras = carreraDao.getAllCarreras();
                        for (Carrera carrera : listaCarreras) {
                    %>
                    <tr style="height: 10px; font-size: 15px">
                        <td style="padding: 0; margin: 0"><%= carrera.getNombreCarrera() %></td>
                        <td style="padding: 0; margin: 0"><%= carrera.getNombreDivision() %></td>
                        <td style="padding: 0; margin: 0">
                            <!-- Botón para modificar carrera -->
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#modificarCarreraModal"
                                    data-id="<%= carrera.getIdCarrera() %>"
                                    data-nombre="<%= carrera.getNombreCarrera() %>"
                                    data-idDivision="<%= carrera.getIdDivisionAcademica() %>">
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

<!-- Modal registrar nueva carrera -->
<div class="modal fade" id="registrarCarreraModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registrar Nueva Carrera</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="RegistrarCarreraServlet" method="post">
                <div class="modal-body">
                    <input type="hidden" name="action" value="agregar">
                    <div class="form-group">
                        <input type="text" class="form-control" id="nombreCarrera" name="nombreCarrera" placeholder=" " required>
                        <label for="nombreCarrera" class="col-form-label">Nombre de la Carrera:</label>
                    </div>
                    <div class="form-group">
                        <label for="idDivisionAcademica" class="col-form-label"></label>
                        <select class="custom-select" id="idDivisionAcademica" name="idDivisionAcademica" required>
                            <option value="">División Académica:</option>
                            <%
                                for (DivisionesAcademicas division : listaDivisiones) {
                            %>
                            <option value="<%= division.getIdDivision() %>"><%= division.getNombreDivision() %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Registrar</button>
                </div>
            </form>
        </div>
    </div>
</div>



<!-- Modal modificar carrera -->
<div class="modal fade" id="modificarCarreraModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modificar Carrera</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../ActualizarDivisionServlet" method="post">
                <div class="modal-body">
                    <input type="hidden" name="action" value="actualizar">
                    <input type="hidden" id="idCarrera" name="idCarrera">
                    <div class="form-group">
                        <input type="text" class="form-control" id="nombreCarreraModificar" name="nombreCarrera" placeholder=" " required>
                        <label for="nombreCarreraModificar" class="col-form-label">Nombre de la Carrera:</label>
                    </div>
                    <div class="form-group">
                        <label for="idDivisionAcademicaModificar" class="col-form-label"></label>
                        <select class="custom-select" id="idDivisionAcademicaModificar" name="idDivisionAcademica" required>
                            <option value="">División Académica:</option>
                            <%
                                for (DivisionesAcademicas division : listaDivisiones) {
                            %>
                            <option value="<%= division.getIdDivision() %>"><%= division.getNombreDivision() %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Modificar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var filterName = document.getElementById('filterName');
        var filterDivision = document.querySelector('select.custom-select');

        // Agregar eventos para aplicar los filtros
        filterName.addEventListener('input', filterTable);
        filterDivision.addEventListener('change', filterTable);

        function filterTable() {
            var filterNameValue = filterName.value.toLowerCase();
            var filterDivisionValue = filterDivision.value.toLowerCase();
            var table = document.querySelector('table');
            var rows = table.querySelector('tbody').getElementsByTagName('tr');

            for (var i = 0; i < rows.length; i++) {
                var cells = rows[i].getElementsByTagName('td');
                var nombreCarrera = cells[0].textContent.toLowerCase();  // Columna "Nombre de la Carrera"
                var divisionAcademica = cells[1].textContent.toLowerCase(); // Columna "División Académica"

                var nameMatch = filterNameValue === '' || nombreCarrera.includes(filterNameValue);
                var divisionMatch = filterDivisionValue === '' || divisionAcademica.includes(filterDivisionValue);

                if (nameMatch && divisionMatch) {
                    rows[i].style.display = '';
                } else {
                    rows[i].style.display = 'none';
                }
            }
        }
    });
</script>


<script>
        // Llenar datos del modal de modificar carrera al hacer clic en el botón
        $('.btn-modificar').click(function () {
            var idCarrera = $(this).data('id');
            var nombreCarrera = $(this).data('nombre');
            var idDivisionAcademica = $(this).data('iddivision');

            $('#idCarrera').val(idCarrera);
            $('#nombreCarreraModificar').val(nombreCarrera);
            $('#idDivisionAcademicaModificar').val(idDivisionAcademica);

            $('#modificarCarreraModal').modal('show');
        });
    });
</script>

<script>
    $(document).ready(function () {
        // Llenar datos del modal de modificar carrera al hacer clic en el botón
        $('.btn-modificar').click(function () {
            var idCarrera = $(this).data('id');
            var nombreCarrera = $(this).data('nombre');
            var idDivisionAcademica = $(this).data('iddivision');

            $('#idCarrera').val(idCarrera);
            $('#nombreCarreraModificar').val(nombreCarrera);
            $('#idDivisionAcademicaModificar').val(idDivisionAcademica);

            $('#modificarCarreraModal').modal('show');
        });
    });
</script>




<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/script.js"></script>
</body>

</html>
