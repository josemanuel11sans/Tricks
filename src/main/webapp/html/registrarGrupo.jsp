<%--
  Created by IntelliJ IDEA.
  User: bigvaijatnielvillanuevamiranda
  Date: 18/07/24
  Time: 12:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registrar Grupo</title>
</head>
<body>
<h1>Registrar Grupo</h1>
<form action="../RegistrarGrupoServlet" method="post">
    <label for="nombreGrupo">Nombre del Grupo:</label>
    <input type="text" id="nombreGrupo" name="nombreGrupo" required><br>

    <label for="nombreCarrera">Carrera:</label>
    <input type="text" id="nombreCarrera" name="nombreCarrera" required><br>

    <label for="nombreDivision">División Académica:</label>
    <input type="text" id="nombreDivision" name="nombreDivision" required><br>

    <label for="nombreDocente">Nombre del Docente:</label>
    <input type="text" id="nombreDocente" name="nombreDocente" required><br>

    <button type="submit">Registrar</button>
</form>
</body>
</html>
