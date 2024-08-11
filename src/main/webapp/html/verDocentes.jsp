<%--
  Created by IntelliJ IDEA.
  User: RuuizOr
  Date: 25/06/2024
  Time: 09:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.tricks.dao.UsuarioDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.tricks.model.Usuario" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Docentes</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/faviconDocente.svg">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/estilosModal.css">
    <link rel="stylesheet" href="../css/estilosTabla.css">
    <link rel="stylesheet" href="../css/estilosAlertas.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="wrapper" style="height: 100vh;">
    <!-- Componente de menú lateral -->
    <jsp:include page="../componentes/menuLateral.jsp"/>

    <!-- Alertas de validaciones -->
    <%
        String tipoAlerta = (String) session.getAttribute("alerta");
        String mensajeAlerta = "";

        if (tipoAlerta != null) {
            switch (tipoAlerta) {
                case "exito":
                    mensajeAlerta = "Registro exitoso.";
                    break;
                case "correoExistente":
                    mensajeAlerta = "El correo ya está registrado.";
                    break;
                case "matriculaExistente":
                    mensajeAlerta = "La matrícula ya está registrada.";
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

    <!-- Cuerpo de la página -->
    <div class="main">
        <div class="container mt-4 text-left">
            <h1 class="mb-4 text-light">Docentes</h1>

            <!-- Filtros y botón de registrar -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <input type="text" id="filterName" class="form-control" placeholder="Buscar por nombre">
                </div>
                <div class="col-md-3">
                    <select id="filterState" class="custom-select" required>
                        <option value="">Estado</option>
                        <option value="Activo">Activo</option>
                        <option value="NoActivo">No Activo</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <button type="button" class="btn btnIcono w-100" data-toggle="modal" data-target="#registrarGrupo">
                        Registrar Docente
                    </button>
                </div>
            </div>
            <br>

            <!-- Tabla de datos del docente -->
            <div class="container-xxl tabla">
                <table class="table" id="example">
                    <thead class="thead-light">
                    <tr align="center">
                        <th>Matricula</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Estado</th>
                        <th>Modificar</th>
                    </tr>
                    </thead>
                    <tbody id="aspirantesTableBody">
                    <%
                        UsuarioDao dao = new UsuarioDao();
                        ArrayList<Usuario> lista = dao.getAll();
                        for (Usuario u : lista) {
                    %>
                    <tr style="height: 20px; font-size: 15px" data-id="<%= u.getId_usuario() %>">
                        <td style="padding: 0; margin: 0"><%= u.getId_usuario() %>
                        </td>
                        <td style="padding: 0; margin: 0"><%= u.getNombre() %> <%= u.getApellido()%>
                        </td>
                        <td style="padding: 0; margin: 0"><%= u.getMail() %>
                        </td>
                        <td class="d-flex justify-content-center align-items-center" style="margin: 0;">
                            <% if (u.getEstado() == 1) { %>
                            <div class="activo" data-estado="1" data-toggle="modal"
                                 data-target="#modificarEstadoDocente" data-whatever="ModificarEstadoDocente"></div>
                            <% } else { %>
                            <div class="inactivo" data-estado="2" data-toggle="modal"
                                 data-target="#modificarEstadoDocente" data-whatever="ModificarEstadoDocente"></div>
                            <% } %>
                        </td>
                        <td style="padding: 0; margin: 0">
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#modificarDocente"
                                    data-id="<%= u.getId_usuario() %>"
                                    data-nombre="<%= u.getNombre() %>"
                                    data-apellido="<%= u.getApellido() %>"
                                    data-mail="<%= u.getMail() %>"
                                    data-contra="<%= u.getContra() %>">
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

<!-- Modal registrar docente nuevo -->
<div class="modal fade" id="registrarGrupo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Registrar Docente</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="../RegistrarDocenteServlet" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" id="idDocente" name="idDocente" placeholder=" "
                               required>
                        <label for="idDocente" class="col-form-label">Matrícula:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder=" " required>
                        <label for="nombre" class="col-form-label">Nombre:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="apellido" name="apellido" placeholder=" " required>
                        <label for="apellido" class="col-form-label">Apellidos:</label>
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" id="mail" name="mail" placeholder=" " required>
                        <label for="mail" class="col-form-label">Correo Electrónico:</label>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="contra" name="contra" placeholder=" " required>
                        <label for="contra" class="col-form-label">Contraseña:</label>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Registrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal modificar datos del docente -->
<div class="modal fade" id="modificarDocente" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modificar Docente</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="../ModificarDocenteServlet" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" id="idDocenteMod" name="idDocente" placeholder=" "
                               readonly>
                        <label for="idDocenteMod" class="col-form-label">ID Docente:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nombreMod" name="nombre" placeholder=" " required>
                        <label for="nombreMod" class="col-form-label">Nombre:</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="apellidoMod" name="apellido" placeholder=" "
                               required>
                        <label for="apellidoMod" class="col-form-label">Apellidos:</label>
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" id="mailMod" name="mail" placeholder=" " required>
                        <label for="mailMod" class="col-form-label">Correo Electrónico:</label>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="contraMod" name="contra" placeholder=" "
                               required>
                        <label for="contraMod" class="col-form-label">Contraseña:</label>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Modificar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Modal modificar estado del docente -->
<div class="modal fade" id="modificarEstadoDocente" tabindex="-1" role="dialog" aria-labelledby="customModalLabel"
     aria-hidden="true">
    <div class="modal-dialog custom-modal-dialog" role="document">
        <div class="modal-content custom-modal-content">
            <div class="modal-header custom-modal-header">
                <h5 class="modal-title custom-modal-title">Modificar Estado</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body custom-modal-body">
                <form action="../ModificarEstadoDocServlet" method="post">
                    <h6 class="custom-modal-text" id="customModalLabel">¿Estás seguro de cambiar el estado del
                        docente?</h6>
                    <div class="form-group custom-form-group" style="display: none">
                        <label for="idDocente2" class="col-form-label custom-col-form-label">Matrícula:</label>
                        <input type="text" class="form-control custom-form-control" id="idDocente2" name="idDocente2"
                               placeholder="Matrícula" required>
                    </div>
                    <div class="form-group custom-form-group" style="display: none">
                        <label for="estadoDocente" class="col-form-label custom-col-form-label">Estado:</label>
                        <input type="text" class="form-control custom-form-control" id="estadoDocente"
                               name="estadoDocente" placeholder="Estado" required>
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

<!-- Scripts utilizados -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/script.js"></script>
<script src="../js/scriptDocentes.js"></script>
<script src="../js/scriptAlertas.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

