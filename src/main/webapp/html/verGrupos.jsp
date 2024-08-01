




<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.tricks.dao.GrupoDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.tricks.model.Grupo" %>
<%@ page import="mx.edu.utez.tricks.model.DivisionesAcademicas" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.tricks.dao.DivisionesAcademicasDAO" %>
<%@ page import="mx.edu.utez.tricks.dao.CarreraDao" %>
<%@ page import="mx.edu.utez.tricks.model.Carrera" %>
<%@ page import="mx.edu.utez.tricks.model.Usuario" %>
<%@ page import="mx.edu.utez.tricks.dao.UsuarioDao" %>


<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grupos</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/faviconGrupo.svg">
    <link rel="stylesheet" href="../css/style.css">
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

        .form-control-custom {
            background-color: #fff;
            color: black;
            border: none;
            border-radius: 4px;
            padding: 0.5rem 1rem;
        }

        .btn-custom {
            background-color: dodgerblue;
            color: white;
            border-radius: 4px;
            border: none;
            padding: 0.5rem 1.5rem;
            font-weight: bold;
        }
        .btn-files {
            background-color: gray;
            color: white;
            border-radius: 4px;
            border: none;
            padding: 0.5rem 1.5rem;
            font-weight: bold;
        }

        .btn-link-custom {
            background-color: purple;
            color: white;
            border-radius: 4px;
            border: none;
            padding: 0.5rem 1.5rem;
            font-weight: bold;
        }

        .btn-link-custom:hover {
            text-decoration: none;
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

    <div class="main">
        <div class="container mt-4 text-left">
            <h1 class="mb-4 text-light">Grupos</h1>

            <!-- Filtros y botón de registrar -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <input type="text" id="filterName" class="form-control" placeholder="Buscar por nombre">
                </div>
                <div class="col-md-3">
                    <select class="custom-select" id="filterCareer" required>
                        <option value="">Selecciona una carrera</option>
                        <%
                            CarreraDao carreraDao = new CarreraDao();
                            List<Carrera> carreraList = carreraDao.getAllCarreras();
                            for (Carrera carrera : carreraList ) {
                        %>
                        <option value="<%= carrera.getIdCarrera() %>"><%= carrera.getNombreCarrera() %></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="col-md-3">
                    <select class="custom-select" id="filterDivision" required>
                        <option value="">Selecciona una división</option>
                        <%
                            DivisionesAcademicasDAO divisionesAcademicasDAO = new DivisionesAcademicasDAO();
                            List<DivisionesAcademicas> listaDivisiones = divisionesAcademicasDAO.getAllDivisiones();
                            for (DivisionesAcademicas division : listaDivisiones) {
                        %>
                        <option value="<%= division.getIdDivision() %>"><%= division.getNombreDivision() %></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="col-md-3">
                    <button type="button" class="btn btnIcono w-100" data-toggle="modal"
                            data-target="#registrarGrupo">
                        Registrar grupo
                    </button>
                </div>
            </div><br>

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
                        <th>Modificar</th>
                    </tr>
                    </thead>
                    <tbody id="aspirantesTableBody">
                    <%
                        GrupoDao dao = new GrupoDao();
                        ArrayList<Grupo> lista = dao.getAll();
                        for (Grupo g : lista) {
                    %>
                    <tr style="height: 10px; font-size: 15px" data-id="<%= g.getIdGrupo() %>">
                        <td  style="padding: 0; margin: 0" ><%= g.getNombreGrupo() %></td>
                        <td style="padding: 0; margin: 0" ><%= g.getNombreDocente() + " " + g.getApellidoDocente() %></td>
                        <td style="padding: 0; margin: 0" ><%= g.getCarrera() %></td>
                        <td style="padding: 0; margin: 0" ><%= g.getDivisionAcademica() %></td>

                        <td style="padding: 0; margin: 0"  >
                            <button class="btn btnIcono btn-aspirantes" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#asignarMasivo"
                                    onclick="setGrupoInfoMasivo(${grupo.idGrupo}, '${grupo.nombreGrupo}')">
                                <i class="fas fa-users"></i>
                            </button>
                            <button class="btn btnIcono btn-aspirantes" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#asignarIndividual" data-whatever="Agregar Aspirante"
                                    onclick="setGrupoInfo('<%= g.getIdGrupo() %>', '<%= g.getNombreGrupo() %>')">
                                <i class="fas fa-user-plus"></i>
                            </button>


                        <td class="d-flex justify-content-center align-items-center" style="margin: 0;">
                            <% if (g.getEstadoIdEstado() == 1) { %>
                            <div class="activo" data-estado="1" data-toggle="modal" data-target="#modificarEstadoGrupo" data-whatever="ModificarEstadoGrupo"></div>
                            <% } else { %>
                            <div class="inactivo" data-estado="2" data-toggle="modal" data-target="#modificarEstadoGrupo" data-whatever="ModificarEstadoGrupo"></div>
                            <% } %>

                        </td >



                        <td style="padding: 0; margin: 0"  >
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#modificarGrupo" data-whatever="Modificar"
                                    onclick="window.location.href='modificarGrupo?id=<%= g.getIdGrupo() %>'">
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

<!-- Modal registrar grupo -->
<div class="modal fade" id="registrarGrupo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registrar grupo</h5>
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
                        <label for="carrera" class="col-form-label">Carrera:</label>
                        <select class="custom-select" id="carrera" name="carrera"  placeholder=" " required>
                            <option value=""></option>
                            <% for (Carrera carrera : carreraList) { %>
                            <option value="<%= carrera.getIdCarrera() %>" data-division="<%= carrera.getIdDivisionAcademica() %>"><%= carrera.getNombreCarrera() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="docente" class="col-form-label">Docente asignado:</label>
                        <select class="custom-select" id="docente" name="docente" required>
                            <option value="">Seleccionar</option>
                            <% for (Grupo user : lista) { %>
                            <option><%= user.getNombreDocente() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Registrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal modificar grupo -->
<div class="modal fade" id="modificarGrupo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modificar grupo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="../ModificarGrupoServlet">
                    <div class="form-group">
                        <label for="nombreGrupo" class="col-form-label">Nuevo nombre:</label>
                        <input type="text" class="form-control" id="nombreGrupo" name="nombreGrupo" required>
                    </div>
                    <div class="form-group">
                        <label for="divisionAcademica" class="col-form-label">División académica:</label>
                        <select class="custom-select" id="divisionAcademica" name="divisionAcademica" required>
                            <option value=" "></option>
                            <%
                                for (DivisionesAcademicas division : listaDivisiones) {
                            %>
                            <option value="<%= division.getIdDivision() %>"><%= division.getNombreDivision() %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="carrera" class="col-form-label">Carrera:</label>
                        <select class="custom-select" id="carrera" name="carrera" required>
                            <option value=" "></option>
                            <%
                                for ( Carrera carrera : carreraList) {
                            %>
                            <option value="<%= carrera.getIdCarrera() %>"><%= carrera.getNombreCarrera() %></option>
                            <%
                                }
                            %>

                        </select>
                    </div>
                    <div class="form-group">
                        <label for="docente" class="col-form-label">Docente asignado:</label>
                        <select class="custom-select" id="docente" name="docente" required>
                            <option value=" "></option>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Guardar cambios</button>
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
                <h5 class="modal-title custom-modal-title">Modificar Estado</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body custom-modal-body" >
                <form action="../ActualizarEstadoGrupoServlet" method="post">
                    <h6 class="custom-modal-text" id="customModalLabel">¿Estás seguro de cambiar el estado del
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
                        <button type="submit" class="btn btn-primary">Modificar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<!-- Modal asignar aspirante -->
<div class="modal fade" id="asignarIndividual" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Asignar aspirante al grupo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="assignAspirantForm" action="AsignarAspiranteServlet" method="post">
                    <input type="hidden" id="IdGrupo" name="IdGrupo" value="">
                    <div class="form-group">
                        <label for="nombreGrupo">Grupo seleccionado:</label>
                        <input type="text" class="form-control" id="nombreGrupo" name="nombreGrupo" readonly>
                    </div>
                    <div class="form-group">
                        <label for="folioAspirante">Folio del aspirante:</label>
                        <select class="custom-select" id="folioAspirante" name="folioAspirante" required>
                            <option value="folio1">Aspirante1</option>
                            <option value="folio2">Aspirante2</option>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary">Asignar</button>
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
                <form action="../uploadexcel" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="grupoNombreMasivo">Grupo:</label>
                        <input type="text" class="form-control form-control-custom" id="grupoNombreMasivo" name="grupoNombreMasivo" value="" readonly>
                    </div>
                    <div class="form-group">
                        <p>
                            <label for="archivoCargaMasiva">Asignación masiva</label>
                        <hr>
                        <label class="btn-files">Selecciona tus archivos
                            <input type="file" id="archivoCargaMasiva" name="archivoCargaMasiva" accept=".xlsx" />
                        </label>
                        </p>
                    </div>
                    <div class="modal-footer modal-footer-custom">
                        <a href="#" class="btn-link btn-link-custom">Ejemplo de formato</a>
                        <a href="#" class="btn-link btn-link-custom">Descargar formato</a>
                        <button type="submit" class="btn btn-custom">Asignar</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
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
</div>
</body>
</html>





