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
                        <th>Modificar</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        DivisionesAcademicasDAO dao = new DivisionesAcademicasDAO();
                        List<DivisionesAcademicas> lista = dao.getAllDivisiones();
                        for (DivisionesAcademicas division : lista) {
                    %>
                    <tr data-id-division="<%= division.getIdDivision() %>" style="height: 10px; font-size: 15px">
                        <td style="padding: 0; margin: 0"><%= division.getNombreDivision() %></td>
                        <td style="padding: 0; margin: 0"><%= division.getCoordinadorDivision() %></td>
                        <td style="padding: 0; margin: 0"><%= division.getSiglas() %></td>
                        <td class="d-flex justify-content-center align-items-center" style="margin: 0;">
                            <% if (division.getEstado() == 1) { %>
                            <div class="activo" data-id="<%= division.getIdDivision() %>" data-estado="1" data-toggle="modal" data-target="#modificarEstado" data-whatever="ModificarEstado"></div>
                            <% } else { %>
                            <div class="inactivo" data-id="<%= division.getIdDivision() %>" data-estado="0" data-toggle="modal" data-target="#modificarEstado" data-whatever="ModificarEstado"></div>
                            <% } %>
                        </td>

                        <td style="padding: 0; margin: 0">
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#modificarGrupo"
                                    data-id="<%= division.getIdDivision() %>"
                                    data-nombre="<%= division.getNombreDivision() %>"
                                    data-siglas="<%= division.getSiglas() %>"
                                    data-coordinador="<%= division.getCoordinadorDivision() %>"
                                    data-estado="<%= division.getEstado() %>">
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

<!-- Modal para actualizar estado -->
<div class="modal fade" id="modificarEstado" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="max-height: 100vh !important; margin: 40vh auto;">
        <div class="modal-content">
            <div class="modal-body">
                <h6 id="exampleModalLabel" style="margin-top: 20px; margin-bottom: 0; text-align: center;">
                    ¿Estás seguro de cambiar el estado de la división?
                </h6>
                <form action="${pageContext.request.contextPath}/ActualizarEstadoDivisionServlet" method="post">
                    <div class="form-group" style="display: none;">
                        <label for="idDivision" class="col-form-label">ID de la División:</label>
                        <input type="text" class="form-control" id="idDivision" name="idDivision">
                    </div>
                    <div class="form-group" style="display: none;">
                        <label for="estadoDivision" class="col-form-label">Estado de la División:</label>
                        <input type="text" class="form-control" id="estadoDivision" name="estadoDivision">
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Modificar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>





<script>
    document.addEventListener('DOMContentLoaded', function () {
        var filterName = document.getElementById('filterName');
        var filterCareer = document.getElementById('filterCareer');
        var filterDivision = document.getElementById('filterDivision');

        filterName.addEventListener('input', filterTable);
        filterCareer.addEventListener('change', filterTable);
        filterDivision.addEventListener('change', filterTable);

        function filterTable() {
            var filterNameValue = filterName.value.toLowerCase();
            var filterCareerValue = filterCareer ? filterCareer.value.toLowerCase() : '';
            var filterDivisionValue = filterDivision ? filterDivision.value.toLowerCase() : '';
            var table = document.getElementById('example');
            var rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

            for (var i = 0; i < rows.length; i++) {
                var cells = rows[i].getElementsByTagName('td');
                var name = cells[0].textContent.toLowerCase();   // Columna "Nombre"
                var coordinator = cells[1].textContent.toLowerCase();   // Columna "Coordinador"
                var siglas = cells[2].textContent.toLowerCase();   // Columna "Siglas"
                var estado = cells[3].querySelector('div') ? cells[3].querySelector('div').getAttribute('data-estado').toLowerCase() : ''; // Columna "Estado"

                var nameMatch = filterNameValue === '' || name.includes(filterNameValue) || coordinator.includes(filterNameValue) || siglas.includes(filterNameValue);
                var careerMatch = filterCareerValue === '' || estado === filterCareerValue;
                var divisionMatch = filterDivisionValue === '' || estado === filterDivisionValue;

                if (nameMatch && careerMatch && divisionMatch) {
                    rows[i].style.display = '';
                } else {
                    rows[i].style.display = 'none';
                }
            }
        }

        // Inicializar DataTables
        $('#example').DataTable({
            "paging": true,
            "searching": false, // Desactivar la búsqueda integrada de DataTables ya que usaremos un filtro personalizado
            "info": false
        });

        // Configurar el modal de modificar estado
        $('#modificarEstado').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget); // Botón que activó el modal
            var idDivision = button.attr('data-id');
            var estado = button.attr('data-estado');
            $('#idDivision').val(idDivision);
            $('#estadoDivision').val(estado === '1' ? '0' : '1');
        });

        // Configurar el modal de modificar grupo
        $('#modificarGrupo').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget); // Botón que activó el modal
            $('#idDivision').val(button.data('id'));
            $('#nombreDivision').val(button.data('nombre'));
            $('#siglas').val(button.data('siglas'));
            $('#coordinadorDivision').val(button.data('coordinador'));
        });
    });
</script>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/script.js"></script>
<script src="../js/scriptDocentes.js"></script>
</body>

</html>
