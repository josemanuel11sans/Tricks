<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="mx.edu.utez.tricks.dao.GruposAsignadosDao" %>
<%@ page import="mx.edu.utez.tricks.model.GrupoAsignado" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.tricks.dao.UsuarioDao" %>
<%@ page import="mx.edu.utez.tricks.model.Usuario" %>
<%@ page import="java.util.ArrayList" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio Docente</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/docente.svg">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/estilosModal.css">
    <link rel="stylesheet" href="../css/estilosTabla.css">
    <link rel="stylesheet" href="../css/relojStilo.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
<div class="wrapper" style="height: 100vh;"> <!-- Contenedor principal con altura de la pantalla completa -->
    <div class="main">
        <div class="container mt-5 text-left" style="max-width: 90vw;">
            <h1 class="mb-4 text-light">Cursos Asignados</h1> <!-- Título de la página -->

            <!-- Filtros de búsqueda -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <input type="text" id="filterName" class="form-control" placeholder="Buscar por grupo"> <!-- Filtro por nombre de grupo -->
                </div>
                <div class="col-md-3">
                    <input type="text" id="filterCarrera" class="form-control" placeholder="Buscar por carrera"> <!-- Filtro por nombre de carrera -->
                </div>
            </div>
            <br>

            <!-- Tabla de cursos asignados -->
            <div class="container-xxl tabla">
                <table class="table" id="example">
                    <thead class="thead-light">
                    <tr align="center">
                        <th>Grupo</th>
                        <th>Carrera</th>
                        <th>Asistencia</th>
                        <th>Aspirantes</th>
                    </tr>
                    </thead>
                    <tbody id="cursosAsignadosTableBody">
                    <%
                        // Obtener la lista de grupos asignados al docente utilizando el DAO
                        GruposAsignadosDao dao = new GruposAsignadosDao();
                        List<GrupoAsignado> gruposAsignados = dao.getGruposAsignadosPorDocente((String) session.getAttribute("userEmail"));

                        // Iterar sobre la lista de grupos asignados y mostrar los datos en la tabla
                        for (GrupoAsignado grupo : gruposAsignados) {
                    %>
                    <tr style="height: 20px; font-size: 15px" data-id="<%= grupo.getIdGrupo() %>"> <!-- Cada fila representa un grupo -->
                        <td style="padding: 0; margin: 0"><%= grupo.getNombreGrupo() %></td> <!-- Nombre del grupo -->
                        <td style="padding: 0; margin: 0"><%= grupo.getCarrera() %></td> <!-- Carrera del grupo -->
                        <td style="padding: 0; margin: 0"> <!-- Botón para ir a la página de asistencias del grupo -->
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#modificarGrupo" data-whatever="Modificar"
                                    onclick="window.location.href='Asistencias.jsp?id=<%= grupo.getIdUsuario() %>'">
                                <i class="fas fa-download"></i>
                            </button>
                        </td>

                        <td style="padding: 0; margin: 0">
                            <!-- Botón para ir a la página de aspirantes del grupo -->
                            <button class="btn btnIcono btn-modificar" data-toggle="modal"
                                    style="height: 25px; font-size: 15px; margin: 5px; width: 25px"
                                    data-target="#modificarGrupo" data-whatever="Modificar"
                                    onclick="window.location.href='${pageContext.request.contextPath}/html_docentes/Calificaciones.jsp?grupoId=<%= grupo.getIdGrupo() %>'">
                                <i class="fas fa-users"></i>
                            </button>
                        </td>
                    </tr>
                    <% } %> <!-- Fin del bucle for -->
                    </tbody>
                </table>
            </div>
        </div>

        <div style="position: fixed; bottom: 20px; right: 80px;">
            <img src="../img_svg/user-shield-solid.svg" id="password" style="cursor: pointer;" alt="Contraseña">
        </div>

        <div style="position: fixed; bottom: 20px; right: 20px;">
            <img src="../img_svg/ayuda.svg" id="ayudaD" style="cursor: pointer;" alt="Ayuda">
        </div>

        <div class="sidebar-footer background-color" title="Salir" style="position: fixed; bottom: 20px; left: 20px;">
            <a href="../index.jsp" class="sidebar-link">
                <i class="fas fa-right-from-bracket"></i>
            </a>
        </div>
    </div>
</div> <!-- Cierre del contenedor principal -->

<!-- Modal contraseña -->
<div class="modal fade" id="modalInformacion" tabindex="-1" role="dialog" aria-labelledby="modalInformacionLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="text-white bg-success card-custom" style="height: auto; margin-bottom: 0;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <div class="card-body text-left" style="width: 100%;">
                    <%
                        String userName = (String) session.getAttribute("username");
                        String userApellido = (String) session.getAttribute("userApellido");
                        String userEmail = (String) session.getAttribute("userEmail");
                    %>
                    <h5 id="teacher-name" class="card-title"><%= (userName != null) ? userName : "NOMBRE" %>
                        <%= (userApellido != null) ? userApellido : " APELLIDO" %>
                    </h5>
                    <p id="teacher-email" class="card-text"><%= (userEmail != null) ? userEmail : "CORREO" %></p>
                    <button type="button" class="btn btnIcono w-100" data-toggle="modal"
                            data-target="#cambiarContrasena">
                        Cambiar contraseña
                    </button>
                </div>
            </div>


        </div>
    </div>
</div>

<!-- Modal cambiar contraseña -->
<div class="modal fade" id="cambiarContrasena" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Cambiar contraseña</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post">
                    <div class="form-group">
                        <input type="password" class="form-control" id="contraseñaAnterior" name="ContraseñaAnterior" placeholder="" required>
                        <label for="contraseñaAnterior" class="col-form-label">Contraseña anterior</label>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="contraseñaNueva" name="ContraseñaNueva" placeholder="" required>
                        <label for="contraseñaNueva" class="col-form-label">Contraseña nueva</label>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="confirmarContraseña" name="confirmarContraseña" placeholder="" required>
                        <label for="confirmarContraseña" class="col-form-label">Confirma la contraseña</label>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Cambiar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> <!-- jQuery para manipulación del DOM -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/scripDocente.js"></script>
<script src="../js/script.js"></script>
<script src="informacionDinamica.js"></script>
<script src="../js/scriptCursosAsignados.js"></script> <!-- Script específico para la página de cursos asignados -->
<script src="../js/scriptAlertas.js"></script> <!-- Script para manejo de alertas -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> <!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> <!-- Popper para tooltips y popovers -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> <!-- Bootstrap JS -->
<script src="../js/reloj.js"></script> <!-- Archivo de JavaScript para el reloj -->
<script>
    $(document).ready(function() { // Ejecuta el código cuando el DOM esté listo
        $("#filterName, #filterCarrera").on("keyup", function() { // Filtrar la tabla según el nombre de grupo o carrera
            var value = $(this).val().toLowerCase(); // Valor del filtro convertido a minúsculas
            var column = $(this).attr("id") === "filterName" ? 0 : 1; // Determina la columna a filtrar (0 para grupo, 1 para carrera)
            $("#cursosAsignadosTableBody tr").filter(function() { // Filtra las filas de la tabla
                $(this).toggle($(this).children("td").eq(column).text().toLowerCase().indexOf(value) > -1) // Muestra las filas que coinciden con el filtro
            })
        })
    })

    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('password').addEventListener('click', function() {
            $('#modalInformacion').modal('show');
        });
    });
</script>
</body>
</html>