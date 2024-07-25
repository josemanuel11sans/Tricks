<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="mx.edu.utez.tricks.dao.GrupoDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.tricks.model.Grupo" %>
<%@ page import="mx.edu.utez.tricks.model.DivisionesAcademicas" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.tricks.dao.DivisionesAcademicasDAO" %>
<%@ page import="mx.edu.utez.tricks.dao.CarreraDao" %>
<%@ page import="mx.edu.utez.tricks.model.Carrera" %>


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
    <script src="../js/script.js"></script>
    <script>
        <!-- JavaScript adicional para manejar la información del grupo -->

        function setGrupoInfo(IdGrupo, nombreGrupo) {
            document.getElementById('IdGrupo').value = IdGrupo;
            document.getElementById('nombreGrupo1').value = nombreGrupo;
        }


        function setGrupoInfoMasivo(grupoId, nombreGrupo) {
            // Setear los valores del grupo en el modal
            document.getElementById('grupoIdMasivo').value = grupoId;
            document.getElementById('nombreGrupoMasivo').value = nombreGrupo;
        }

    </script>
</head>
<body>
<div class="wrapper" style="height: 100vh;">

    <jsp:include page="../componentes/menuLateral.jsp" />
    <%int g2 = 0; %>
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
                        <option value="<%= carrera.getNombreCarrera() %>"><%= carrera.getNombreCarrera() %></option>
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
                        <option value="<%= division.getSiglas() %>"><%= division.getSiglas()%></option>
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
                        <th>Modificar</th>
                    </tr>
                    </thead>
                    <tbody id="aspirantesTableBody">
                    <%
                        GrupoDao dao = new GrupoDao();
                        ArrayList<Grupo> lista = dao.getAll();
                        for (Grupo g : lista) {
                    %>
                    <tr style="height: 10px; font-size: 15px" >
                        <td  style="padding: 0; margin: 0" ><%= g.getNombreGrupo() %></td>
                        <td style="padding: 0; margin: 0" ><%= g.getNombreDocente() + " " + g.getApellidoDocente() %></td>
                        <td style="padding: 0; margin: 0" ><%= g.getCarrera() %></td>
                        <td style="padding: 0; margin: 0" ><%= g.getDivisionAcademica() %></td>
                        <td style="padding: 0; margin: 0"  >
                            <button class="btn btnIcono btn-aspirantes" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#asignarMasivo"
                                    onclick="setGrupoInfoMasivo('<%= g.getIdGrupo() %>', '<%= g.getNombreGrupo() %>') <%  g2 = g.getIdGrupo();%>">
                                <i class="fas fa-users"></i>

                            </button>
                            <button class="btn btnIcono btn-aspirantes" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#asignarIndividual" data-whatever="Agregar Aspirante"
                                    onclick="setGrupoInfo('<%= g.getIdGrupo() %>', '<%= g.getNombreGrupo() %>')">
                                <i class="fas fa-user-plus"></i>
                            </button>

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
    <div class="modal-dialog" role="document">
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
                        <label for="divisionAcademica" class="col-form-label"></label>
                        <select class="custom-select" id="divisionAcademica" name="divisionAcademica" required>
                            <option value=" ">División académica:</option>
                            <% for (DivisionesAcademicas division : listaDivisiones) { %>
                            <option value="<%= division.getIdDivision() %>"><%= division.getNombreDivision() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="carrera" class="col-form-label"></label>
                        <select class="custom-select" id="carrera" name="carrera" required>
                            <option value=" ">Carrera:</option>
                            <% for (Carrera carrera : carreraList) { %>
                            <option value="<%= carrera.getIdCarrera() %>"><%= carrera.getNombreCarrera() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="docente" class="col-form-label"></label>
                        <select class="custom-select" id="docente" name="docente" required>
                            <option value=" ">Docente asignado:</option>
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

<!-- Modal modificar grupo -->
<div class="modal fade" id="modificarGrupo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modificar grupo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="ModificarGrupoServlet">
                    <div class="form-group">
                        <input type="text" class="form-control" id="nombreGrupoMod" name="nombreGrupoMod" placeholder=" " required>
                        <label for="nombreGrupo" class="col-form-label">Nuevo nombre:</label>
                    </div>
                    <div class="form-group">
                        <label for="divisionAcademica" class="col-form-label"></label>
                        <select class="custom-select" id="divisionAcademicaMod" name="divisionAcademicaMod" required>
                            <option value=" ">División académica:</option>
                            <% for (DivisionesAcademicas division : listaDivisiones) { %>
                            <option value="<%= division.getIdDivision() %>"><%= division.getNombreDivision() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="carrera" class="col-form-label"></label>
                        <select class="custom-select" id="carreraMod" name="carreraMod" required>
                            <option value=" ">Carrera:</option>
                            <% for (Carrera carrera : carreraList) { %>
                            <option value="<%= carrera.getIdCarrera() %>"><%= carrera.getNombreCarrera() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="docente" class="col-form-label"></label>
                        <select class="custom-select" id="docenteMod" name="docenteMod" required>
                            <option value=" ">Docente asignado:</option>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Guardar cambios</button>
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
                <h5 class="modal-title" id="exampleModalLabel">Asignar aspirante al grupo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="assignAspirantForm" action="AsignarAspiranteServlet" method="post">
                    <input type="hidden" id="IdGrupo" name="IdGrupo" value="">
                    <div class="form-group">
                        <input type="text" class="form-control" id="nombreGrupo1" name="nombreGrupoAsig" placeholder=" " readonly>
                        <label for="nombreGrupo" class="col-form-label">Grupo:</label>
                    </div>
                    <div class="form-group">
                        <label for="folioAspirante" class="col-form-label"></label>
                        <select class="custom-select" id="folioAspirante" name="folioAspirante" required>
                            <option value="folio1">Aspirante:</option>
                        </select>
                    </div>
                    <div class="modal-footer">
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
                <form action="../asignargrupo" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="grupoIdMasivo" name="grupoIdMasivo" value="">
                    <div class="form-group">
                        <input type="text" class="form-control form-control-custom" id="nombreGrupoMasivo" name="grupoIdMasivo1" placeholder=" " readonly>
                        <label for="grupoNombreMasivo" class="col-form-label">Grupo:</label>
                    </div>
                    <div class="form-group">
                        <input type="file" class="form-control form-control-custom" id="archivoCargaMasiva" name="archivoCargaMasiva" accept=".xlsx" value="" placeholder=" ">
                        <label for="archivoCargaMasiva" class="col-form-label">Asignación masiva</label>
                    </div>
                    <div class="modal-footer modal-footer-custom">
                        <a href="#" class="btn btnFormatos" onclick="openImagePopup('../img/asignarAspirantes.png', 'Ejemplo de formato'); return false;">
                            Ejemplo de formato
                        </a>
                        <a href="../formatos/FormatoAsignacionMasiva.xlsx" class="btn btnFormatos" download>
                            Descargar formato
                        </a>

                        <button type="submit" class="btn btn-primary">Asignar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Bootstrap y scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>



<!-- Script para abrir la imagen de carga masiva de ejemplo -->
<script>
    function openImagePopup(url, title) {
        var width = 800;
        var height = 600;
        var left = (screen.width - width) / 2;
        var top = (screen.height - height) / 2;
        window.open(url, title, 'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left);
    }
</script>
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



</script>
</body>
</html>