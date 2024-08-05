<%--
 Created by IntelliJ IDEA.
 User: Joseb
 Date: 01/07/2024
 Time: 08:38 p. m.
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
    <title>Divsiones Academicas</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/docente.svg">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/estilosModal.css">
    <link rel="stylesheet" href="../css/estilosTabla.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>


    <style>
        .activo{
            width: 15px;
            height: 15px;
            border-radius: 100%;
            background-color: green;
            cursor: pointer;
        }


        .inactivo{
            width: 15px;
            height: 15px;
            border-radius: 100%;
            background-color: red;
            cursor: pointer;
        }
        td{
            vertical-align: middle !important;
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
                <div class="col-md-2">
                    <select class="custom-select" id="filterCareer" required>
                        <option value="">Estatus</option>
                        <option value="1">Activo</option>
                        <option value="2">Inactivo</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <button type="button" class="btn btnIcono w-100" data-toggle="modal"
                            data-target="#registrarDivisionModal">
                        Agregar division
                    </button>
                </div>


            </div><br>


            <div class="container-xxl tabla">
                <table class="table" id="example">
                    <thead class="thead-light">
                    <tr>
                        <th>Nombre</th>
                        <th>Coordinador</th>
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
                    <tr data-id="<%= division.getIdDivision() %>" style="height: 10px; font-size: 15px">
                        <td style="padding: 0; margin: 0"><%= division.getNombreDivision() %></td>
                        <td style="padding: 0; margin: 0"><%= division.getCoordinadorDivision() %></td>
                        <td style="padding: 0; margin: 0"><%= division.getSiglas() %></td>




                        <td class="d-flex justify-content-center align-items-center" style="margin: 0;">
                            <% if (division.getEstado() == 1) { %>
                            <div class="activo" data-estado="1" data-toggle="modal" data-target="#modificarEstadoDivision" data-whatever="ModificarEstadoDivision"></div>
                            <% } else { %>
                            <div class="inactivo" data-estado="2" data-toggle="modal" data-target="#modificarEstadoDivision" data-whatever="ModificarEstadoDivision"></div>
                            <% } %>
                        </td>


                        <td style="padding: 0; margin: 0">
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#modificarDivisionModal"
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




<!-- Modal para Agregar división -->
<div class="modal fade" id="registrarDivisionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Agregar División</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="../RegistrarDivisionServlet" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" id="nombreDivision" name="nombreDivision" placeholder="">
                        <label for="nombreDivision" class="col-form-label">Nombre de la División:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="siglas" name="siglas" placeholder="">
                        <label for="siglas" class="col-form-label">Siglas:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="coordinadorDivision" name="coordinadorDivision" placeholder="">
                        <label for="coordinadorDivision" class="col-form-label">Coordinador:</label>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Agregar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Modal para Modificar división -->
<div class="modal fade" id="modificarDivisionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modificar División</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="../ActualizarDivisionServlet" method="post">
                    <div class="form-group">
                        <input type="hidden" id="idDivision" name="idDivision">
                        <input type="text" class="form-control" id="nombreDivision" name="nombreDivision" placeholder="">
                        <label for="nombreDivision" class="col-form-label">Nombre de la División:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="siglas" name="siglas" placeholder="">
                        <label for="siglas" class="col-form-label">Siglas:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="coordinadorDivision" name="coordinadorDivision" placeholder="">
                        <label for="coordinadorDivision" class="col-form-label">Coordinador:</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Actualizar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>






<!-- Modal para modifcar  estado -->
<div class="modal fade" id="modificarEstadoDivision" tabindex="-1" role="dialog" aria-labelledby="customModalLabel"
     aria-hidden="true">
    <div class="modal-dialog custom-modal-dialog" role="document">
        <div class="modal-content custom-modal-content">
            <div class="modal-header custom-modal-header">
                <h5 class="modal-title custom-modal-title">Modificar Estado</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body custom-modal-body" >
                <form action="../ActualizarEstadoDivisionServlet" method="post">
                    <h6 class="custom-modal-text" id="customModalLabel">¿Estás seguro de cambiar el estado del
                        Grupo?</h6>
                    <div class="form-group custom-form-group" style="display: none">
                        <label for="idDivison2" class="col-form-label custom-col-form-label" style="display: none">ID:</label>
                        <input type="text" class="form-control custom-form-control" id="idDivison2" name="idDivision2"
                               placeholder="ID" required>
                    </div>
                    <div class="form-group custom-form-group" style="display: none">
                        <label for="estadoIdDivision" class="col-form-label custom-col-form-label">Estado:</label>
                        <input type="text" class="form-control custom-form-control" id="estadoIdDivision"
                               name="estadoIdDivision" placeholder="Estado" required>
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
    document.addEventListener('DOMContentLoaded', function() {
        $('#modificarDivisionModal').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget); // Botón que activó el modal
            var idDivision = button.data('id');
            var nombre = button.data('nombre');
            var siglas = button.data('siglas');
            var coordinador = button.data('coordinador');


            // Actualizar los campos del modal con los datos actuales
            $('#idDivision').val(idDivision);
            $('#nombreDivision').val(nombre);
            $('#siglas').val(siglas);
            $('#coordinadorDivision').val(coordinador);
        });
    });
</script>


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
            $('#estadoDivision').val(estado === '1' ? '2' : '1');
        });


        // Configurar el modal de modificar division
        $('#modificarDivisionModal').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget); // Botón que activó el modal
            $('#idDivision').val(button.data('id'));
            $('#nombreDivision').val(button.data('nombre'));
            $('#siglas').val(button.data('siglas'));
            $('#coordinadorDivision').val(button.data('coordinador'));
        });


    });




    document.querySelectorAll('.btn-modificar, .activo, .inactivo').forEach(function(button) {
        button.addEventListener('click', function() {
            var folio = this.closest('tr').getAttribute('data-id');
            document.getElementById('idDivison2').value = folio;


            var estadoActual = this.getAttribute('data-estado');
            var estadoContrario = estadoActual === '1' ? '2' : '1';
            document.getElementById('estadoIdDivision').value = estadoContrario;
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
