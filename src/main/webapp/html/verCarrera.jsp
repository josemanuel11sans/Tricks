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
                        <option value="">División académica</option>
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
                    <button type="button" class="btn btnIcono w-100" data-toggle="modal" data-target="#registrarCarreraModal">
                        Agregar Carrera
                    </button>
                </div>
            </div><br>

            <!-- Tabla de carreras -->
            <div class="container-xxl table-responsive" style="background-color: #fff; border-radius: 20px;">
                <table class="table">
                    <thead class="thead-light">
                    <tr>
                        <th>Nombre</th>
                        <th>División Académica</th>
                        <th>Estado</th> <!-- Nuevo encabezado de columna -->
                        <th>Modificar</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        CarreraDao carreraDao = new CarreraDao();
                        List<Carrera> listaCarreras = carreraDao.getAllCarreras();
                        for (Carrera carrera : listaCarreras) {
                    %>
                    <tr style="height: 10px; font-size: 15px" data-folio="<%= carrera.getIdCarrera() %>">
                        <td style="padding: 0; margin: 0"><%= carrera.getNombreCarrera() %></td>
                        <td style="padding: 0; margin: 0"><%= carrera.getNombreDivision() %></td>
                        <td class="d-flex justify-content-center align-items-center" style="margin: 0;">
                            <% if (carrera.getIdEstado() == 1) { %>
                            <div class="activo" data-id="<%= carrera.getIdCarrera() %>" data-toggle="modal" data-target="#modificarEstadoModal"></div>
                            <% } else { %>
                            <div class="inactivo" data-id="<%= carrera.getIdCarrera() %>" data-toggle="modal" data-target="#modificarEstadoModal"></div>
                            <% } %>
                        </td>
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
<div class="modal fade" id="registrarCarreraModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Agregar Carrera</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../RegistrarCarreraServlet" method="post">
                <div class="modal-body">
                    <input type="hidden" name="action" value="agregar">
                    <input type="hidden" id="idEstado" name="idEstado" value="1"> <!-- Puedes cambiar el valor según sea necesario -->
                    <div class="form-group">
                        <label for="nombreCarrera" class="col-form-label">Nombre de la Carrera:</label>
                        <input type="text" class="form-control" placeholder="" id="nombreCarrera" name="nombreCarrera" required>
                    </div>
                    <div class="form-group">
                        <label for="idDivisionAcademica" class="col-form-label">División Académica:</label>
                        <select class="custom-select" id="idDivisionAcademica" name="idDivisionAcademica"  required>
                            <option value=""></option>
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
<div class="modal fade" id="modificarCarreraModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modificar Carrera</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../ActualizarCarreraServlet" method="post">
                <div class="modal-body">
                    <input type="hidden" name="action" value="actualizar">
                    <input type="hidden" id="idCarrera" name="idCarrera">
                    <div class="form-group">
                        <label for="nombreCarreraModificar" class="col-form-label"></label>
                        <input type="text" class="form-control" id="nombreCarreraModificar" name="nombreCarrera" required>
                    </div>
                    <div class="form-group">
                        <label for="idDivisionAcademicaModificar" class="col-form-label">División Académica:</label>
                        <select class="custom-select" id="idDivisionAcademicaModificar" name="idDivisionAcademica" required>
                            <option value="">Seleccione División Académica</option>
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
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary">Modificar</button>
                </div>
            </form>
        </div>
    </div>
</div>



<!-- Modal modificar estado -->
<div class="modal fade" id="modificarEstadoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="max-height: 100vh !important; margin: 40vh auto;">
        <div class="modal-content">
            <div class="modal-body">
                <h6 class="text-center" id="exampleModalLabel" style="margin-top: 20px; margin-bottom: 0;">
                    ¿Estás seguro de cambiar el estado de la carrera?
                </h6>
                <form action="ActualizarEstadoServlet" method="post">
                    <div class="form-group" style="display: none">
                        <label for="idCarreraEstado" class="col-form-label">ID de la Carrera:</label>
                        <input type="text" class="form-control" id="idCarreraEstado" name="idCarrera">
                    </div>
                    <div class="form-group" style="display: none">
                        <label for="estadoCarrera" class="col-form-label">Estado de la Carrera:</label>
                        <input type="text" class="form-control" id="estadoCarrera" name="estadoCarrera">
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
    $(document).ready(function() {
        $('#modificarEstadoModal').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget); // Botón que abrió el modal
            var idCarrera = button.data('id'); // Extraer la información de atributos data-*

            // Actualiza los campos del modal.
            var modal = $(this);
            modal.find('.modal-body #idCarreraEstado').val(idCarrera);
        });

        // Este código abre el modal de modificar carrera con los datos correspondientes
        $('#modificarCarreraModal').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget); // Botón que abrió el modal
            var idCarrera = button.data('id');
            var nombreCarrera = button.data('nombre');
            var idDivisionAcademica = button.data('iddivision');

            var modal = $(this);
            modal.find('.modal-body #idCarrera').val(idCarrera);
            modal.find('.modal-body #nombreCarreraModificar').val(nombreCarrera);
            modal.find('.modal-body #idDivisionAcademicaModificar').val(idDivisionAcademica);
        });
    });
</script>


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

        // Añadir eventos a los botones para capturar el valor del id y el estado de la carrera
        document.querySelectorAll('.activo, .inactivo').forEach(function(button) {
            button.addEventListener('click', function() {
                var idCarrera = this.closest('tr').getAttribute('data-folio');
                document.getElementById('idCarrera2').value = idCarrera;

                var estadoActual = this.getAttribute('data-estado');
                var estadoContrario = estadoActual === '1' ? '2' : '1';
                document.getElementById('estadoCarrera').value = estadoContrario;
            });
        });

        // Evento para modal de modificar carrera
        document.querySelectorAll('.btn-modificar').forEach(function(button) {
            button.addEventListener('click', function() {
                var idCarrera = button.getAttribute('data-id');
                var nombreCarrera = button.getAttribute('data-nombre');
                var idDivisionAcademica = button.getAttribute('data-idDivision');

                document.getElementById('idCarrera').value = idCarrera;
                document.getElementById('nombreCarreraModificar').value = nombreCarrera;
                document.getElementById('idDivisionAcademicaModificar').value = idDivisionAcademica;

                // Llenar el estado en el modal de modificar
                var estado = this.closest('tr').querySelector('.activo, .inactivo').getAttribute('data-estado');
                var estadoTexto = estado === '1' ? 'Activo' : 'Inactivo';
                document.getElementById('estadoModificar').value = estadoTexto;
            });
        });
    });
</script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/script.js"></script>
</body>
</html>
