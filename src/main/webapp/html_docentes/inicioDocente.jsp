<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.LocalDate" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Docentes</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/docente.svg">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/estilosModal.css">
    <link rel="stylesheet" href="../css/estilosTabla.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cursos asignados</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/docente.svg">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
</head>

<body>
<div class="wrapper" style="height: 100vh;">
    <jsp:include page="../componentes/menuLateralDocente.jsp" />

    <div class="main">
        <div class="container mt-5 text-left">
            <h1 class="mb-4 text-light">Inicio</h1>
            <div class="row">
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card text-white bg-warning card-custom">
                        <div class="card-body text-center">
                            <div class="icon-container mb-2">
                                <i class="fas fa-users icon-custom"></i>
                            </div>
                            <h5 class="card-title card-title-custom">Grupos asignados</h5>
                            <p class="card-text card-text-custom">3</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12 mb-3">
                    <div class="card text-white bg-success card-custom">
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
                            <p class="card-text">Información adicional sobre el docente.</p>
                            <button type="button" class="btn btnIcono w-100" data-toggle="modal"
                                    data-target="#cambiarContrasena">
                                Cambiar contraseña
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-5">
                <h3 class="mb-4 text-light text-center">Frase del día</h3>
                <div class="card">
                    <div class="card-body">
                        <%
                            String[] frases = {
                                    "La educación no es simplemente un proceso de llenar un cubo vacío, sino un acto de encender una chispa, una chispa que arde con la pasión por el aprendizaje, que se transforma en una llama que ilumina todo lo que toca. Es a través de esta llama que los estudiantes no solo adquieren conocimientos, sino que descubren el poder del pensamiento crítico, el valor de la curiosidad y la importancia de contribuir a un mundo más grande que ellos mismos. - Anónimo",
                                    "Enseñar no es solo transmitir información, sino inspirar el deseo de descubrir, la pasión por explorar, y la capacidad de cuestionar lo que sabemos. Un verdadero educador no se conforma con llenar mentes con hechos, sino que cultiva una mentalidad de búsqueda constante, donde cada pregunta lleva a otra, y cada respuesta abre la puerta a nuevas posibilidades. La enseñanza es un viaje compartido de crecimiento, donde tanto el maestro como el alumno se transforman mutuamente. - John Dewey",
                                    "El verdadero propósito de la educación es liberar a los estudiantes del miedo a lo desconocido, dándoles la confianza para navegar por el mundo con un espíritu inquisitivo y una mente abierta. La educación no es solo una preparación para la vida; es la vida misma. A través del acto de enseñar, no solo transmitimos conocimientos, sino que sembramos las semillas del cambio, empoderando a las futuras generaciones para que se conviertan en arquitectos de un mundo más justo y equitativo. - Paulo Freire",
                                    "La enseñanza efectiva no se trata solo de impartir información de manera eficiente; se trata de tocar las vidas de los estudiantes, de ayudarlos a ver el mundo de maneras que nunca antes habían considerado, y de darles las herramientas para convertirse en pensadores críticos, solucionadores de problemas y ciudadanos compasivos. Un maestro no solo guía a sus estudiantes a través del currículo, sino que los acompaña en un viaje de autodescubrimiento, donde el aprendizaje se convierte en una experiencia transformadora que trasciende el aula. - Anónimo",
                                    "Educar no es solo preparar a las personas para un futuro incierto, sino también equiparlas para enfrentar los desafíos del presente con coraje, sabiduría y una profunda humanidad. Un maestro no es simplemente un transmisor de conocimiento, sino un cultivador de mentes y corazones, alguien que ve el potencial en cada estudiante y trabaja incansablemente para ayudar a liberar ese potencial, sabiendo que en cada mente iluminada se encuentra la promesa de un mañana mejor. - John Amos Comenius",
                                    "El éxito en la educación no se mide únicamente por las calificaciones obtenidas, sino por la capacidad de los estudiantes para enfrentar los desafíos del futuro con creatividad, resiliencia y un deseo inquebrantable de aprender. Los verdaderos educadores son aquellos que inspiran a sus alumnos a buscar el conocimiento más allá de los límites del aula, fomentando un amor por el aprendizaje que perdura toda la vida. - Anónimo",
                                    "La enseñanza es un arte y una ciencia que va más allá de la simple transmisión de información; es un acto de amor y compromiso hacia el crecimiento y desarrollo de cada estudiante. Un maestro exitoso no solo enseña lecciones, sino que también modela comportamientos, valores y actitudes que formarán la base del carácter y la ética de trabajo de sus alumnos. - Anónimo",
                                    "La educación debe ser vista como un viaje de descubrimiento personal, no solo una preparación para la vida laboral. Cada estudiante trae consigo un conjunto único de habilidades, intereses y talentos que deben ser cultivados y desarrollados. Un maestro eficaz es aquel que reconoce y nutre estas diferencias individuales, ayudando a cada alumno a alcanzar su máximo potencial. - Anónimo",
                                    "Un gran maestro sabe que el verdadero aprendizaje ocurre cuando los estudiantes están motivados, inspirados y se sienten valorados. El éxito en la educación no se trata solo de enseñar contenido académico, sino de construir relaciones significativas que fomenten la confianza, el respeto y el amor por el aprendizaje. - Anónimo",
                                    "La educación no solo forma mentes, sino también corazones y espíritus. Los mejores maestros son aquellos que no solo instruyen, sino que también inspiran, alientan y apoyan a sus alumnos en cada paso de su viaje educativo, ayudándolos a convertirse en personas completas y conscientes de su impacto en el mundo. - Anónimo"
                            };

                            // Obtén el día del año actual
                            LocalDate fechaActual = LocalDate.now();
                            int diaDelAno = fechaActual.getDayOfYear();

                            // Usa el día del año para indexar el arreglo
                            int indice = diaDelAno % frases.length;
                            String fraseDelDia = frases[indice];
                        %>
                        <p class="card-text text-center"><em>"<%= fraseDelDia %>"</em></p>
                    </div>
                </div>
            </div>
        </div>
        <div style="position: fixed; bottom: 20px; right: 20px;">
            <img src="../img_svg/ayuda.svg" id="ayudaD" style="cursor: pointer;" alt="Ayuda">
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
                    <form>
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
                            <button type="submit" class="btn btn-primary">Crear</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="../js/scripDocente.js"></script>
    <script src="../js/script.js"></script>
    <script src="informacionDinamica.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="../js/script.js"></script>

</body>
</html>
