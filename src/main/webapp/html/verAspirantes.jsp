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
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/estilosModal.css">
    <link rel="stylesheet" href="../css/estilosAspirantes.css">
    <link rel="stylesheet" href="../css/estilosAlertas.css">
</head>
<body>
<%
    String tipoAlerta = (String) session.getAttribute("alerta");
    String mensajeAlerta = "";

    if (tipoAlerta != null) {
        switch (tipoAlerta) {
            case "exito":
                mensajeAlerta = "Registro exitoso.";
                break;
            case "folioExistente":
                mensajeAlerta = "El folio ya está registrado.";
                break;
            case "curpExistente":
                mensajeAlerta = "El curp ya está registrado.";
                break;
            case "falloRegistro":
                mensajeAlerta = "No se pudo registrar al docente.";
                break;
            case "actualizacionExitosa":
                mensajeAlerta = "Modificación exitosa.";
                break;
            case "actualizacionExitosaEsta":
                mensajeAlerta = "Modificación de estado exitosa.";
                break;
            case "falloActualizacion":
                mensajeAlerta = "No se pudo modificar al docente.";
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

<div class="wrapper" style="height: 100vh;">
    <jsp:include page="../componentes/menuLateral.jsp" />

    <div class="main">
        <div class="container mt-4 text-left">
            <h1 class="mb-4 text-light">Aspirantes</h1>

            <!-- Filtros y botón de registrar -->
            <div class="row mb-3">
                <div class="col-md-2">
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
                        <option value="null">null</option>
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
                <div class="col-md-3">
                    <button type="button" class="btn btnIcono w-100" data-toggle="modal"
                            data-target="#registrarAspirantes">
                        Registrar aspirantes
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
                        <td style="padding: 0; margin: 0"><%= aspirante.getGrupo2() %></td>
                        <td class="d-flex justify-content-center align-items-center" style="margin: 0;">
                            <% if (aspirante.getEstado() == 1) { %>
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
                        <input type="text" class="form-control" id="folioAspirante" name="folioAspirante" placeholder="">
                        <label for="folioAspirante" class="col-form-label">Folio del Aspirante:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nombreAspirante" name="nombreAspirante" placeholder="">
                        <label for="nombreAspirante" class="col-form-label">Nombre del Aspirante:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="apellidosAspirante" name="apellidosAspirante" placeholder="">
                        <label for="apellidosAspirante" class="col-form-label">Apellidos del Aspirante:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="curpAspirante" name="curpAspirante" placeholder="">
                        <label for="curpAspirante" class="col-form-label">CURP del Aspirante:</label>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" id="fechaNacimientoAspirante" name="fechaNacimientoAspirante">
                        <label for="fechaNacimientoAspirante" class="col-form-label">Fecha de Nacimiento del Aspirante:</label>
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
                <h5 class="modal-title" id="exampleModalLabel">Actualizar Aspirante</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="../ActualizarAspiranteServlet" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" id="folioAspirante3" name="folioAspirante" readonly>
                        <label for="folioAspirante" class="col-form-label">Folio del Aspirante:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nombreAspirante3" name="nombreAspirante">
                        <label for="nombreAspirante" class="col-form-label">Nombre del Aspirante:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="apellidosAspirante3" name="apellidosAspirante">
                        <label for="apellidosAspirante" class="col-form-label">Apellidos del Aspirante:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="curpAspirante3" name="curpAspirante">
                        <label for="curpAspirante" class="col-form-label">CURP del Aspirante:</label>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" id="fechaNacimientoAspirante3" name="fechaNacimientoAspirante">
                        <label for="fechaNacimientoAspirante" class="col-form-label">Fecha de Nacimiento del Aspirante:</label>
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
<div class="modal fade" id="modificarEstado" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="max-height: 100vh !important; margin: 40vh auto;">
        <div class="modal-content">
            <div class="modal-body">
                <h6 class="" id="exampleModalLabel" style="margin-top: 20px; margin-bottom: 0; text-align: center;">¿Estas seguro de cambiar el estado del aspirante?</h6>
                <form action="../ActualizarEstadoServlet" method="post">
                    <div class="form-group" style="display: none">
                        <label for="folioAspirante2" class="col-form-label">Folio del Aspirante:</label>
                        <input type="text" class="form-control" id="folioAspirante2" name="folioAspirante2">
                    </div>
                    <div class="form-group" style="display: none">
                        <label for="estadoAspirante" class="col-form-label">Estado del Aspirante:</label>
                        <input type="text" class="form-control" id="estadoAspirante" name="estadoAspirante">
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Modificar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal para carga masiva de aspirantes-->
<div class="modal fade" id="registrarAspirantes" tabindex="-1" role="dialog" aria-labelledby="cargaMasivaLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content modal-content-custom">
            <div class="modal-header modal-header-custom">
                <h5 class="modal-title modal-title-custom" id="exampleModalLabel">Registrar aspirantes</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body modal-body-custom">
                <form action="../cargaraspirantes" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="file" class="form-control form-control-custom" id="archivoCargaMasiva" name="archivoCargaMasiva" accept=".xlsx" value="" placeholder=" ">
                        <label for="archivoCargaMasiva" class="col-form-label">Asignación masiva</label>
                    </div>
                    <div class="modal-footer modal-footer-custom">
                        <a href="#" class="btn btnFormatos" onclick="openImagePopup('../img/ejemploAspirantes.png', 'Ejemplo de formato'); return false;">
                            Ejemplo de formato
                        </a>
                        <a href="../formatos/FormatoRegistroMasivo.xlsx" class="btn btnFormatos" download>
                            Descargar formato
                        </a>
                        <button type="submit" class="btn btn-primary">Registrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/jsAspirantes.js"></script>
<script src="../js/script.js"></script>
<script src="../js/scriptAlertas.js"></script>
<script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>