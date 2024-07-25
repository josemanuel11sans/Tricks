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
                                    onclick="setGrupoInfoMasivo('<%= g.getIdGrupo() %>', '<%= g.getNombreGrupo() %>')">
                                <i class="fas fa-users"></i>
                            </button>
                            <button class="btn btnIcono btn-aspirantes" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#asignarIndividual" data-whatever="Agregar Aspirante"
                                    onclick="setGrupoInfoIndividual('<%= g.getIdGrupo() %>', '<%= g.getNombreGrupo() %>')">
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
                            <option value=" ">Docente:</option>
                            <% List<mx.edu.utez.tricks.model.Usuario> listaDocentes = new mx.edu.utez.tricks.dao.UsuarioDao().getAll();
                                for (mx.edu.utez.tricks.model.Usuario docente : listaDocentes) { %>
                            <option value="<%= docente.getId_usuario() %>"><%= docente.getNombre() + " " + docente.getApellido() %></option>
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

<!-- Modal asignar aspirante -->
<div class="modal fade" id="asignarMasivo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Asignar aspirantes a grupo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formCargaMasiva" method="post" action="../SubirArchivo">
                    <div class="form-group">
                        <label for="grupoInputMasivo" class="col-form-label">Grupo:</label>
                        <input type="text" class="form-control" id="grupoInputMasivo" name="grupo" readonly>
                    </div>
                    <div class="form-group">
                        <label for="archivoAspirantes" class="col-form-label">Selecciona el archivo de aspirantes:</label>
                        <input type="file" class="form-control-file" id="archivoAspirantes" name="archivoAspirantes" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Subir archivo</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal asignar aspirante individual -->
<div class="modal fade" id="asignarIndividual" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Asignar aspirante a grupo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formCargaIndividual" method="post" action="../AsignarAspiranteIndividual">
                    <div class="form-group">
                        <label for="grupoInputIndividual" class="col-form-label">Grupo:</label>
                        <input type="text" class="form-control" id="grupoInputIndividual" name="grupo" readonly>
                    </div>
                    <div class="form-group">
                        <label for="folio" class="col-form-label">Folio:</label>
                        <input type="text" class="form-control" id="folio" name="folio" required>
                    </div>
                    <div class="form-group">
                        <label for="nombre" class="col-form-label">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                    </div>
                    <div class="form-group">
                        <label for="apellidos" class="col-form-label">Apellidos:</label>
                        <input type="text" class="form-control" id="apellidos" name="apellidos" required>
                    </div>
                    <div class="form-group">
                        <label for="curp" class="col-form-label">CURP:</label>
                        <input type="text" class="form-control" id="curp" name="curp" required>
                    </div>
                    <div class="form-group">
                        <label for="fechaNacimiento" class="col-form-label">Fecha de nacimiento:</label>
                        <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Asignar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function setGrupoInfoMasivo(idGrupo, nombreGrupo) {
        document.getElementById('grupoInputMasivo').value = nombreGrupo;
    }

    function setGrupoInfoIndividual(idGrupo, nombreGrupo) {
        document.getElementById('grupoInputIndividual').value = nombreGrupo;
    }
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function() {
        $('#example').DataTable();

        $('#filterName').on('keyup', function() {
            var table = $('#example').DataTable();
            table.columns(0).search(this.value).draw();
        });

        $('#filterCareer').on('change', function() {
            var table = $('#example').DataTable();
            table.columns(2).search(this.value).draw();
        });

        $('#filterDivision').on('change', function() {
            var table = $('#example').DataTable();
            table.columns(3).search(this.value).draw();
        });
    });
</script>
</body>
</html>