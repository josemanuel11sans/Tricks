<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.tricks.dao.*" %>
<%@ page import="mx.edu.utez.tricks.model.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grupos</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/faviconGrupo.svg">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/estilosAlertas.css">
    <link rel="stylesheet" href="../css/estilosTabla.css">
    <link rel="stylesheet" href="../css/estilosModal.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
    <style>
        .modal-content-custom {
            background-color: #2D6655;
            color: white;
            border-radius: 8px;
        }

        .modal-header-custom {
            border-bottom: none;
        }

        .modal-title-custom {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .modal-body-custom {
            padding: 2rem;
        }

        .modal-footer-custom {
            border-top: none;
            justify-content: center;
        }

        .btn-files {
            background-color: gray;
            color: white;
            border-radius: 4px;
            border: none;
            padding: 0.5rem 1.5rem;
            font-weight: bold;
        }

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

    <%
        String tipoAlerta = (String) session.getAttribute("alerta");
        String mensajeAlerta = "";


        if (tipoAlerta != null) {
            switch (tipoAlerta) {
                case "exito":
                    mensajeAlerta = "Registro exitoso.";
                    break;
                case "nombreExistente":
                    mensajeAlerta = "El nombre ya esta registrado.";
                    break;
                case "falloRegistro":
                    mensajeAlerta = "No se pudo registrar el Grupo.";
                    break;
                case "actualizacionExitosa":
                    mensajeAlerta = "Modificación exitosa.";
                    break;
                case "actualizacionExitosaEsta":
                    mensajeAlerta = "Modificación de estado exitosa.";
                    break;
                case "falloActualizacion":
                    mensajeAlerta = "No se pudo modificar el grupo.";
                    break;
                case "error":
                    mensajeAlerta = "Se produjo un error.";
                    break;
                default:
                    mensajeAlerta = "";
                    break;
            }


            if (!mensajeAlerta.isEmpty()) {
                String iconoAlerta = "";


                switch (tipoAlerta) {
                    case "exito":
                        iconoAlerta = "fa-check-circle";
                        break;
                    case "actualizacionExitosa":
                        iconoAlerta = "fa-check-circle";
                        break;
                    case "actualizacionExitosaEsta":
                        iconoAlerta = "fa-check-circle";
                        break;
                    case "falloActualizacion":
                        iconoAlerta = "fa-exclamation-triangle";
                        break;
                    case "falloRegistro":
                        iconoAlerta = "fa-exclamation-triangle";
                        break;
                    case "error":
                        iconoAlerta = "fa-times-circle";
                        break;
                    default:
                        iconoAlerta = "fa-info-circle";
                        break;
                }
    %>


    <div class="alerta alerta-dismissible mostrar" role="alert">
        <i class="fa <%= iconoAlerta %> icono" aria-hidden="true"></i>
        <span class="texto"><%= mensajeAlerta %></span>
        <button type="button" class="btn-cerrar" data-bs-dismiss="alert" aria-label="Close">
            <i class="fa fa-times" aria-hidden="true"></i>
        </button>
    </div>
    <%
                session.removeAttribute("alerta");
            }
    }
    %>


    <div class="main">
        <div class="container mt-4 text-left">
            <h1 class="mb-4 text-light">Grupos</h1>

            <!-- Filtros y botón de registrar -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <input type="text" id="filterName" class="form-control" placeholder="Buscar por nombre">
                </div><br><br>
                <div class="col-md-3">
                    <select class="custom-select" id="filterCareer" required>
                        <option value="">Carrera</option>
                        <%
                            CarreraDao carreraDao = new CarreraDao();
                            List<Carrera> carreraList = carreraDao.getAllCarreras();
                            for (Carrera carrera : carreraList) {if (carrera.getIdEstado() ==1 ){
                        %>
                        <option value="<%= carrera.getNombreCarrera() %>"><%= carrera.getNombreCarrera() %></option>
                        <%
                            }}
                        %>
                    </select>
                </div><br><br>
                <div class="col-md-3">
                    <select class="custom-select" id="filterDivision" required>
                        <option value="">División Académica</option>
                        <%
                            DivisionesAcademicasDAO divisionesAcademicasDAO = new DivisionesAcademicasDAO();
                            List<DivisionesAcademicas> listaDivisiones = divisionesAcademicasDAO.getAllDivisiones();
                            for (DivisionesAcademicas division : listaDivisiones) { if (division.getEstado() == 1 ){
                        %>
                        <option value="<%= division.getSiglas() %>"><%= division.getSiglas() %></option>
                        <%
                            }}
                        %>
                    </select>
                </div><br><br>
                <div class="col-md-3">
                    <button type="button" class="btn btnIcono w-100" data-toggle="modal" data-target="#registrarGrupo" style="display: flex; justify-content: space-evenly; align-items: center">
                        Registrar Grupo
                        <i class="fa-solid fa-users-rectangle"></i>
                    </button>
                </div>
            </div>
            <br>

            <div class="container-xxl tabla">
                <table class="table" id="example">
                    <thead class="thead-light">
                    <tr align="center">
                        <th>Grupo</th>
                        <th>Docente</th>
                        <th>Carrera</th>
                        <th>División</th>
                        <th>Asignar aspirantes</th>
                        <th>Estado</th>
                        <th>Editar</th>
                    </tr>
                    </thead>
                    <tbody id="aspirantesTableBody">
                    <%
                        GrupoDao dao = new GrupoDao();
                        ArrayList<Grupo> lista = dao.getAll();
                        for (Grupo g : lista) {
                    %>
                    <tr style="height: 10px; font-size: 15px" data-id="<%= g.getIdGrupo() %>">
                        <td id="nombre" style="padding: 0; margin: 0"><%= g.getNombreGrupo() %></td>
                        <td style="padding: 0; margin: 0"><%= g.getNombreDocente()%> <%= g.getApellidoDocente()%></td>
                        <td style="padding: 0; margin: 0"><%= g.getCarrera() %></td>
                        <td style="padding: 0; margin: 0"><%= g.getDivisionAcademica() %></td>
                        <td style="padding: 0; margin: 0">
                            <button class="btn btnIcono btn-aspirantes" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"

                                    data-target="#asignarMasivo"
                                    onclick="setGrupoInfoMasivo('<%= g.getIdGrupo() %>', '<%= g.getNombreGrupo() %>')">
                                <i class="fas fa-users"></i>
                            </button>
                            <button class="btn btnIcono btn-aspirantes" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#asignarIndividual" data-whatever="Agregar Aspirante"
                                    onclick="setGrupoInfo('<%= g.getIdGrupo() %>', '<%= g.getNombreGrupo() %>')">
                                <i class="fas fa-user-plus"></i>
                            </button>
                        </td>
                        <td class="d-flex justify-content-center align-items-center" style="margin: 0;">
                            <% if (g.getEstadoIdEstado() == 1) { %>
                            <div class="activo" data-estado="1" data-toggle="modal" data-target="#modificarEstadoGrupo" data-whatever="ModificarEstadoGrupo"></div>
                            <% } else { %>
                            <div class="inactivo" data-estado="2" data-toggle="modal" data-target="#modificarEstadoGrupo" data-whatever="ModificarEstadoGrupo"></div>
                            <% } %>
                        </td>
                        <td style="padding: 0; margin: 0">
                            <button class="btn btnIcono btn-modificar"
                                    data-toggle="modal"
                                    data-target="#actualizarGrupoModal"
                                    data-id="<%= g.getIdGrupo() %>"
                                    data-nombre="<%= g.getNombreGrupo() %>"
                                    data-idcarrera="<%= g.getIdCarrera() %>"
                                    data-iddocente="<%= g.getIdDocente() %>"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>


            <script>
                document.getElementById('filterName').addEventListener('keyup', filterTable);
                document.getElementById('filterCareer').addEventListener('change', filterTable);
                document.getElementById('filterDivision').addEventListener('change', filterTable);

                function filterTable() {
                    var nameFilter = document.getElementById('filterName').value.toLowerCase();
                    var careerFilter = document.getElementById('filterCareer').value.toLowerCase();
                    var divisionFilter = document.getElementById('filterDivision').value.toLowerCase();

                    var rows = document.getElementById('aspirantesTableBody').getElementsByTagName('tr');

                    for (var i = 0; i < rows.length; i++) {
                        var groupName = rows[i].getElementsByTagName('td')[0].textContent.toLowerCase();
                        var career = rows[i].getElementsByTagName('td')[2].textContent.toLowerCase();
                        var division = rows[i].getElementsByTagName('td')[3].textContent.toLowerCase();

                        if ((nameFilter === "" || groupName.includes(nameFilter)) &&
                            (careerFilter === "" || career.includes(careerFilter)) &&
                            (divisionFilter === "" || division.includes(divisionFilter))) {
                            rows[i].style.display = "";
                        } else {
                            rows[i].style.display = "none";
                        }
                    }
                }
            </script>


            <!-- Modal registrar grupo nuevo -->
            <div class="modal fade" id="registrarGrupo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Registrar Grupo</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="../RegistrarGrupoServlet">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="nombreGrupo" name="nombreGrupo" placeholder=" " required>
                                    <label for="nombreGrupo" class="col-form-label">Nombre:</label>
                                </div>
                                <div class="form-group">
                                    <select class="custom-select" id="carrera" name="carrera" required>
                                        <option value="" disabled selected>División acádemica: </option>
                                        <% for (Carrera carrera : carreraList) { if (carrera.getIdEstado() == 1){%>
                                        <option value="<%= carrera.getIdCarrera() %>"><%= carrera.getNombreCarrera() %></option>
                                        <% }} %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="custom-select" required id="docente" name="docente">
                                        <option value="" disabled selected>Docente: </option>
                                        <% UsuarioDao daoUsuario = new UsuarioDao();
                                            ArrayList<Usuario> listaUsuario = daoUsuario.getAll();
                                            for (Usuario u : listaUsuario) { if (u.getEstado() == 1){%>
                                        <option value="<%= u.getId_usuario() %>"><%= u.getNombre() %> <%=u.getApellido()%></option>
                                        <% }} %>
                                    </select>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Registrar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    // Evento para modal de modificar carrera
                    document.querySelectorAll('.btn-modificar').forEach(function (button) {
                        button.addEventListener('click', function () {
                            var nombre = button.getAttribute('nombre');
                            var nombreCarrera = button.getAttribute('data-nombre');
                            var idDivisionAcademica = button.getAttribute('data-idDivision');


                            document.getElementById('nombreGrupo').value = nombre;
                            document.getElementById('nombreCarreraModificar').value = nombreCarrera;
                            document.getElementById('idDivisionAcademicaModificar').value = idDivisionAcademica;

                        });
                    });

                }
            </script>


            <div class="modal fade" id="actualizarGrupoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Editar grupo</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="../ActualizarGrupoServlet">
                                <input type="hidden" id="idGrupo" name="idGrupo">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="nombreGrupo" name="nombreGrupo" placeholder=" " required>
                                    <label for="nombreGrupo" class="col-form-label">Nombre:</label>
                                </div>
                                <div class="form-group">
                                    <label for="idDiviMod" class="col-form-label"></label>
                                    <select class="custom-select" id="idDiviMod" name="idDiviMod" required>
                                        <option value="">División Académica:</option>
                                        <% for (Carrera carrera : carreraList) { if(carrera.getIdEstado() == 1){ %>
                                        <option value="<%= carrera.getIdCarrera() %>"><%= carrera.getNombreCarrera() %></option>
                                        <% }} %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="idDocMod" class="col-form-label"></label>
                                    <select class="custom-select" required id="idDocMod" name="docente">
                                        <option value="">Docente:</option>
                                        <% for (Usuario u : listaUsuario) { if (u.getEstado() == 1){%>
                                        <option value="<%= u.getId_usuario() %>"><%= u.getNombre() %> <%= u.getApellido() %></option>
                                        <% }} %>
                                    </select>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Actualizar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


<!-- Modificar estado del grupo -->
<div class="modal fade" id="modificarEstadoGrupo" tabindex="-1" role="dialog" aria-labelledby="customModalLabel"
     aria-hidden="true">
    <div class="modal-dialog custom-modal-dialog" role="document">
        <div class="modal-content custom-modal-content">
            <div class="modal-header custom-modal-header">
                <h5 class="modal-title custom-modal-title">Estado</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body custom-modal-body" >
                <form action="../ActualizarEstadoGrupoServlet" method="post">
                    <h6 class="custom-modal-text" id="customModalLabel">¿Estás seguro de actualizar el estado del
                        Grupo?</h6>
                    <div class="form-group custom-form-group" style="display: none" >
                        <label for="idGrupo2" class="col-form-label custom-col-form-label" style="display: none">ID:</label>
                        <input type="text" class="form-control custom-form-control" id="idGrupo2" name="idGrupo2"
                               placeholder="ID" required>
                    </div>
                    <div class="form-group custom-form-group" style="display: none">
                        <label for="estadoIdEstado" class="col-form-label custom-col-form-label">Estado:</label>
                        <input type="text" class="form-control custom-form-control" id="estadoIdEstado"
                               name="estadoIdEstado" placeholder="Estado" required>
                    </div>
                    <div class="modal-footer custom-modal-footer">
                        <button type="submit" class="btn btn-primary">Actualizar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>





<!-- Modal asignar aspirante -->
<div class="modal fade" id="asignarIndividual" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Asignar Aspirante al Grupo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="../AsignarAspiranteServlet" method="post">
                    <input type="hidden" id="IdGrupo" name="IdGrupo" value="" >
                    <div class="form-group">
                        <label for="nombreGrupo">Grupo seleccionado:</label>
                        <input type="hidden" class="form-control" id="nombreGrupo" name="nombreGrupo" readonly>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label" for="folioAspirante"></label>
                        <select class="custom-select" id="folioAspirante" name="folioAspirante" required>
                            <option>Folio del aspirante:</option>
                            <% AspiranteDAO dao2 = new AspiranteDAO();
                                List<Aspirante> aspirantes = dao2.getAllAspirantes();
                                for (Aspirante aspirante : aspirantes) { if(aspirante.getEstado() == 1){ %>
                            <option value="<%= aspirante.getFolioAspirante() %>"><%= aspirante.getFolioAspirante() %> </option>
                            <% }} %>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Registrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

            <!-- Modal para carga masiva de datos -->
            <div class="modal fade" id="asignarMasivo" tabindex="-1" role="dialog" aria-labelledby="cargaMasivaLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                    <div class="modal-content modal-content-custom">
                        <div class="modal-header modal-header-custom">
                            <h5 class="modal-title modal-title-custom" id="exampleModalLabel">Asignar aspirantes</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body modal-body-custom">
                            <form action="../asignargrupo" method="post" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <input type="file"  class="form-control form-control-custom" id="archivoCargaMasiva" name="archivoCargaMasiva" accept=".xlsx" value="" placeholder=" ">
                                                <label for="archivoCargaMasiva" class="col-form-label">Asignación masiva</label>
                                </div>
                                <div class="modal-footer modal-footer-custom">
                                    <a href="#" class="btn btnFormatos" onclick="openImagePopup('../img/asignarAspirantes.png', 'Ejemplo de formato'); return false;">
                                        Ejemplo de formato
                                    </a>
                                    <a href="../formatos/FormatoAsignacionMasiva.xlsx" class="btn btnFormatos" download>Descargar formato
                                    </a>
                                    <button type="submit" class="btn btn-custom">Asignar</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
    <script>
        /*
        document.addEventListener('DOMContentLoaded', function () {
            // Evento para modal de modificar carrera
            document.querySelectorAll('.btn-modificar').forEach(function (button) {
                button.addEventListener('click', function () {
                    var aatagrupo = button.getAttribute('datagrupo');
                    var datadiv = button.getAttribute('datadiv');
                    var datadoc = button.getAttribute('datadoc');


                    document.getElementById('nombreGrupo').value = aatagrupo;
                    document.getElementById('carrera').value = datadiv;
                    document.getElementById('docente').value = datadoc;

                });
            });
        }
         */
    </script>
    <!-- Bootstrap y scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#filterName').on('input', function () {
                var searchText = $(this).val().toLowerCase();
                filterTable(searchText, '#example');
            });

            $('#filterCareer').on('change', function () {
                var searchText = $(this).val().toLowerCase();
                filterTable(searchText, '#example');
            });

            $('#filterDivision').on('change', function () {
                var searchText = $(this).val().toLowerCase();
                filterTable(searchText, '#example');
            });

            function filterTable(searchText, tableSelector) {
                $(tableSelector + ' tbody tr').each(function () {
                    var found = false;
                    $(this).find('td').each(function () {
                        if ($(this).text().toLowerCase().includes(searchText)) {
                            found = true;
                        }
                    });
                    if (found) {
                        $(this).show();
                    } else {
                        $(this).hide();
                    }
                });
            }
        });
        <!-- JavaScript adicional para manejar la información del grupo -->

        function setGrupoInfo(IdGrupo, nombreGrupo) {
            document.getElementById('IdGrupo').value = IdGrupo;
            document.getElementById('nombreGrupo').textContent = nombreGrupo;
        }


        function setGrupoInfoMasivo(grupoId, nombreGrupo) {
            // Setear los valores del grupo en el modal
            document.getElementById('grupoIdMasivo').value = grupoId;
            document.getElementById('nombreGrupoMasivo').textContent = nombreGrupo;
        }


        document.querySelectorAll('.btn-modificar, .activo, .inactivo').forEach(function(button) {
            button.addEventListener('click', function() {
                var folio = this.closest('tr').getAttribute('data-id');
                document.getElementById('idGrupo2').value = folio;

                var estadoActual = this.getAttribute('data-estado');
                var estadoContrario = estadoActual === '1' ? '2' : '1';
                document.getElementById('estadoIdEstado').value = estadoContrario;
            });
        });
    </script>

    <script>
        // JavaScript para ocultar automáticamente la alerta después de 5 segundos
        document.addEventListener('DOMContentLoaded', function() {
            const alerta = document.querySelector('.alerta');

            if (alerta.classList.contains('mostrar')) {
                setTimeout(function() {
                    alerta.classList.add('ocultar');
                }, 5000); // 5000 ms = 5 segundos

                // Remover la alerta del DOM después de la transición (opcional)
                alerta.addEventListener('transitionend', function() {
                    if (alerta.classList.contains('ocultar')) {
                        alerta.remove();
                    }
                });
            }
        });

    </script>
    <script>
        $(document).ready(function() {
            $('#actualizarGrupoModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var id = button.data('id');
                var nombre = button.data('nombre');
                var idCarrera = button.data('idcarrera');
                var idDocente = button.data('iddocente');

                var modal = $(this);
                modal.find('#idGrupo').val(id);
                modal.find('#nombreGrupo').val(nombre);

                // Seleccionar la carrera correcta
                modal.find('#carrera').val(idCarrera);

                // Seleccionar el docente correcto
                modal.find('#docente').val(idDocente);

                // Actualizar las etiquetas de los select
                updateSelectLabel(modal.find('#carrera'));
                updateSelectLabel(modal.find('#docente'));
            });

            // Función para actualizar la etiqueta del select
            function updateSelectLabel(selectElement) {
                var selectedOption = selectElement.find('option:selected');
                var label = selectElement.prev('label');
                var labelText = selectElement.data('label') || selectElement.attr('name');
                if (selectedOption.val()) {
                    label.text(labelText + ': ' + selectedOption.text());
                } else {
                    label.text(labelText + ':');
                }
            }

            $('#carrera, #docente').change(function() {
                updateSelectLabel($(this));
            });
        });
    </script>

</div>
        </div>
        <script src="../js/scriptAlertas.js"></script>
        <script src="../js/script.js"></script>
        <script src="../js/verAspirantes.js"></script>
    </body>
</html>