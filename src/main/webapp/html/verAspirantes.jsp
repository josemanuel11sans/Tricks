<%--
  Created by IntelliJ IDEA.
  User: Josem
  Date: 18/06/2024
  Time: 09:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.tricks.dao.AspiranteDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.tricks.model.Aspirante" %>
<%@ page import="mx.edu.utez.tricks.dao.GrupoDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.tricks.model.Grupo" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aspirantes</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/faviconGrupo.svg">
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
            <h1 class="mb-4 text-light">Aspirantes</h1>

            <!-- Filtros y botón de registrar -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <input type="text" id="filterName" class="form-control" placeholder="Nombre o Matricula">
                </div>
                <div class="col-md-2">
                    <select class="custom-select" id="filterDivision" required>
                        <option value="">Grupo</option>
                        <%
                            GrupoDao dao2 = new GrupoDao();
                            ArrayList<Grupo> lista = dao2.getAll();
                            for (Grupo g : lista) {
                        %>
                        <option value="<%= g.getNombreGrupo() %>"><%= g.getNombreGrupo() %></option>
                        <% } %>
                    </select>
                </div>
                <div class="col-md-2">
                    <select class="custom-select" id="filterCareer" required>
                        <option value="">Estatus</option>
                        <option value="1">Activo</option>
                        <option value="2">Inactivo</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <button type="button" class="btn btnIcono w-100" data-toggle="modal"
                            data-target="#registrarAspirante">
                        Registrar aspirante
                    </button>
                </div>
            </div><br>

            <div class="container-xxl tabla">
                <table class="table" id="example">
                    <thead class="thead-light">
                    <tr>
                        <th>Folio</th>
                        <th>Nombre</th>
                        <th>CURP</th>
                        <th>Grupo</th>
                        <th>Estado</th>
                        <th>Editar</th>
                    </tr>
                    </thead>
                    <tbody id="aspirantesTableBody">
                    <%
                        AspiranteDAO dao = new AspiranteDAO();
                        List<Aspirante> aspirantes = dao.getAllAspirantes();
                        for (Aspirante aspirante : aspirantes) {
                    %>
                    <tr style="height: 10px; font-size: 15px" data-folio="<%= aspirante.getFolioAspirante() %>">
                        <td style="padding: 0; margin: 0"><%= aspirante.getFolioAspirante() %></td>
                        <td style="padding: 0; margin: 0"><%= aspirante.getNombre() %> <%= aspirante.getApellidos() %></td>
                        <td style="padding: 0; margin: 0"><%= aspirante.getCurp() %></td>
                        <td style="padding: 0; margin: 0"><%= aspirante.getGrupo() %></td>
                        <td class="d-flex justify-content-center align-items-center" style="margin: 0;">
                            <% if (aspirante.getEstado().equals("1")) { %>
                            <div class="activo" data-estado="1" data-toggle="modal" data-target="#modificarEstado" data-whatever="ModificarEstado"></div>
                            <% } else { %>
                            <div class="inactivo" data-estado="2" data-toggle="modal" data-target="#modificarEstado" data-whatever="ModificarEstado"></div>
                            <% } %>
                        </td>
                        <td style="padding: 0; margin: 0">
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#modificarAspirante"
                                    data-whatever="Modificar"
                                    data-folio="<%= aspirante.getFolioAspirante() %>"
                                    data-nombre="<%= aspirante.getNombre() %>"
                                    data-apellido="<%= aspirante.getApellidos() %>"
                                    data-curp="<%= aspirante.getCurp() %>"
                                    data-fecha="<%= aspirante.getFechaNacimiento() %>">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Modal registrar aspirante nuevo -->
<div class="modal fade" id="registrarAspirante" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registro de Aspirante</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="../RegistrarAspiranteServlet" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" id="folioAspirante" name="folioAspirante" placeholder=" ">
                        <label for="folioAspirante" class="col-form-label">Folio:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nombreAspirante" name="nombreAspirante" placeholder=" ">
                        <label for="nombreAspirante" class="col-form-label">Nombre:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="apellidosAspirante" name="apellidosAspirante" placeholder=" ">
                        <label for="apellidosAspirante" class="col-form-label">Apellidos:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="curpAspirante" name="curpAspirante" placeholder=" ">
                        <label for="curpAspirante" class="col-form-label">Curp:</label>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" id="fechaNacimientoAspirante" name="fechaNacimientoAspirante" placeholder=" ">
                        <label for="fechaNacimientoAspirante" class="col-form-label">Fecha de Nacimiento:</label>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Registrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal modificar aspirante -->
<div class="modal fade" id="modificarAspirante" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modificar Aspirante</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="../ActualizarAspiranteServlet" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" id="folioAspirante3" name="folioAspirante" placeholder=" ">
                        <label for="folioAspirante" class="col-form-label">Folio:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nombreAspirante3" name="nombreAspirante" placeholder=" ">
                        <label for="nombreAspirante" class="col-form-label">Nombre:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="apellidosAspirante3" name="apellidosAspirante" placeholder=" ">
                        <label for="apellidosAspirante" class="col-form-label">Apellidos:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="curpAspirante3" name="curpAspirante" placeholder=" ">
                        <label for="curpAspirante" class="col-form-label">Curp:</label>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" id="fechaNacimientoAspirante3" name="fechaNacimientoAspirante" placeholder=" ">
                        <label for="fechaNacimientoAspirante" class="col-form-label">Fecha de Nacimiento:</label>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Actualizar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modificar estado del aspirante -->
<!-- Modal modificar estado del docente -->
<div class="modal fade" id="modificarEstado" tabindex="-1" role="dialog" aria-labelledby="customModalLabel" aria-hidden="true">
    <div class="modal-dialog custom-modal-dialog" role="document">
        <div class="modal-content custom-modal-content">
            <div class="modal-header custom-modal-header">
                <h5 class="modal-title custom-modal-title">Modificar Estado</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body custom-modal-body">
                <form action="../ActualizarEstadoServlet" method="post">
                    <h6 class="custom-modal-text" id="customModalLabel">¿Estás seguro de cambiar el estado del aspirante?</h6>
                    <div class="form-group custom-form-group" style="display: none">
                        <label for="folioAspirante2" class="col-form-label custom-col-form-label">Folio del Aspirante:</label>
                        <input type="text" class="form-control custom-form-control" id="folioAspirante2" name="folioAspirante2">
                    </div>
                    <div class="form-group custom-form-group" style="display: none">
                        <label for="estadoAspirante" class="col-form-label custom-col-form-label">Estado del Aspirante:</label>
                        <input type="text" class="form-control custom-form-control" id="estadoAspirante" name="estadoAspirante">
                    </div>
                    <div class="modal-footer custom-modal-footer">
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
            var filterCareerValue = filterCareer.value.toLowerCase();
            var filterDivisionValue = filterDivision.value.toLowerCase();
            var table = document.getElementById('example');
            var rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

            for (var i = 0; i < rows.length; i++) {
                var cells = rows[i].getElementsByTagName('td');
                var folio = cells[0].textContent.toLowerCase();  // Columna "Folio"
                var name = cells[1].textContent.toLowerCase();   // Columna "Nombre"
                var curp = cells[2].textContent.toLowerCase();   // Columna "CURP"
                var division = cells[3].textContent.toLowerCase(); // Columna "Grupo"
                var career = cells[4].querySelector('div').getAttribute('data-estado'); // Columna "Estado"

                var nameMatch = filterNameValue === '' || folio.includes(filterNameValue) || name.includes(filterNameValue) || curp.includes(filterNameValue);
                var careerMatch = filterCareerValue === '' || career === filterCareerValue;
                var divisionMatch = filterDivisionValue === '' || division === filterDivisionValue;

                if (nameMatch && careerMatch && divisionMatch) {
                    rows[i].style.display = '';
                } else {
                    rows[i].style.display = 'none';
                }
            }
        }

        // Añadir evento a los botones para capturar el valor del folio y el estado
        document.querySelectorAll('.btn-modificar, .activo, .inactivo').forEach(function(button) {
            button.addEventListener('click', function() {
                var folio = this.closest('tr').getAttribute('data-folio');
                document.getElementById('folioAspirante2').value = folio;

                var estadoActual = this.getAttribute('data-estado');
                var estadoContrario = estadoActual === '1' ? '2' : '1';
                document.getElementById('estadoAspirante').value = estadoContrario;

            });
        });

        // Evento para modal de actualizar aspirante
        document.querySelectorAll('.btn-modificar').forEach(function(button) {
            button.addEventListener('click', function() {
                var folio = button.getAttribute('data-folio');
                var nombre = button.getAttribute('data-nombre');
                var apellido = button.getAttribute('data-apellido');
                var curp = button.getAttribute('data-curp');
                var fecha = button.getAttribute('data-fecha');

                document.getElementById('folioAspirante3').value = folio;
                document.getElementById('nombreAspirante3').value = nombre;
                document.getElementById('apellidosAspirante3').value = apellido;
                document.getElementById('curpAspirante3').value = curp;
                document.getElementById('fechaNacimientoAspirante3').value = fecha;
                console.log(fecha);
            });
        });
    });

</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/aspirantes.js"></script>
<script src="../js/script.js"></script>
<script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
</body>
</html>