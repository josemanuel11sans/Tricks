<%--
  Created by IntelliJ IDEA.
  User: Josem
  Date: 18/06/2024
  Time: 09:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Aspirantes</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../../../../IdeaProjects/tricks/src/main/webapp/css/estilosregistro.css">
</head>
<body  style="background-color: #081E33;">
<div class="container mt-5">
    <form id="registrationForm" class="custom-form"
          style="background-color: #fff; padding: 20px; border-radius: 10px;">
        <h1 id="formTitle" class="mb-4 text-center">Registrar Aspirante</h1>
        <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="apellidos">Apellidos:</label>
            <input type="text" id="apellidos" name="apellidos" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="curp">CURP:</label>
            <input type="text" id="curp" name="curp" class="form-control" maxlength="18" required>
        </div>
        <div class="form-group">
            <label for="folio">Folio:</label>
            <input type="text" id="folio" name="folio" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="fechaNacimiento">Fecha de Nacimiento:</label>
            <input type="date" id="fechaNacimiento" name="fechaNacimiento" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Guardar</button>
    </form>

</div>
<script src="../js/registrarAspirantes.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
