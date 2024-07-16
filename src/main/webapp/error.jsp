<%--
  Created by IntelliJ IDEA.
  User: orlan
  Date: 016/07/2024
  Time: 17:05 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error 404</title>
    <link rel="shortcut icon" type="image/x-icon" href="img_svg/error.svg">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/estilosIndex.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #343a40;
            color: white;
            overflow: hidden;
        }
        .center-screen {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
            text-align: center;
            animation: fadeIn 2s;
        }
        .error-text {
            font-size: 72px;
            font-weight: bold;
            animation: bounceIn 2s;
        }
        .subtext {
            font-size: 24px;
            animation: fadeInUp 2s;
            margin-bottom: 20px;
        }
        .back-home-btn {
            padding: 10px 20px;
            font-size: 16px;
            color: #FFFFFF;
            background-color: #ffcc00;
            border: none;
            border-radius: 50px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            animation: fadeInUp 2s;
        }
        .back-home-btn:hover {
            background-color: #ffd633;
            transform: translateY(-3px);
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        @keyframes bounceIn {
            0%, 20%, 40%, 60%, 80%, 100% {
                -webkit-transform: translateY(0);
                transform: translateY(0);
            }
            50% {
                -webkit-transform: translateY(-10px);
                transform: translateY(-10px);
            }
            70% {
                -webkit-transform: translateY(-5px);
                transform: translateY(-5px);
            }
        }
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
<div class="center-screen">
    <div class="error-text">ERROR 404</div>
    <div class="subtext">Archivo no encontrado</div>
    <button class="back-home-btn" onclick="window.location.href='html/inicioAdmin.jsp'">Volver a la página principal</button>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
