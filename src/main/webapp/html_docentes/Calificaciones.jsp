<%--
  Created by IntelliJ IDEA.
  User: juani
  Date: 7/5/2024
  Time: 3:49 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cursos asignados</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img_svg/docente.svg">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
    <script src="https://kit.fontawesome.com/8f2cb0ebcf.js" crossorigin="anonymous"></script>
    <style>
        .table-responsive {
            max-height: 70vh;
            overflow-y: auto;
        }
        table {
            border-collapse: separate;
            border-spacing: 0;
        }
        thead th {
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            background: white;
            z-index: 1;
        }
        ::-webkit-scrollbar {
            display: none;
        }
        .table {
            margin-bottom: 0;
        }
        .modal-body {
            padding: 0 1.5rem;
            border-radius: .3rem;
        }
        .modal-footer {
            border: none;
        }
        .form-group {
            margin-bottom: .5rem !important;
        }
        .tabla {
            background-color: #fff;
            border-radius: 20px;
            display: block;
            width: 100%;
            overflow-x: auto;
            max-height: 70vh;
        }
    </style>
</head>
<body>
<!-- menu lateral docente calificaciones -->
<div class="wrapper" style="height: 100vh;">
    <jsp:include page="../componentes/menuLateralDocente.jsp" />

    <div class="main">
        <div class="container mt-4 text-left">
            <h1 class="mb-4 text-light">Calificaciones</h1>

            <!-- Filtros y botón de registrar -->
            <div class="row mb-3">
                <div class="col-md-3">
                    <select class="custom-select" required>
                        <option value="">Calificación...</option>
                    </select>
                </div>

                <div class="col-md-3">
                    <input type="text" id="filterName" class="form-control" placeholder="Buscar por Folio">
                </div>
            </div><br>

            <div class="container-xxl tabla">
                <table id="groupsTable" class="table table-striped" style="width:100%">
                    <thead class="thead-light">
                    <tr align="center">
                        <th>Folio</th>
                        <th>Nombre</th>
                        <th>Carrera</th>
                        <th>Estado</th>
                        <th>Calificación</th>
                    </tr>
                    </thead>
                    <tbody id="studentsTableBody">
                    <!-- La tabla se llenará con JavaScript -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
<script>
    // Datos de ejemplo (simulando una base de datos)
    const allStudents = [
        { folio: "B5366", nombre: "Angel Luis Ortega Chavez", carrera: "TICS", estado: true, calificacion: 10 },
        { folio: "B5367", nombre: "Juan Manuel Martinez Guzman", carrera: "TICS", estado: true, calificacion: 10 },
        { folio: "B5368", nombre: "Orlando Ruiz Cardenas", carrera: "TICS", estado: false, calificacion: null },
        { folio: "B5369", nombre: "Luis Manuel Villanueva Miranda", carrera: "TICS", estado: true, calificacion: 9 },
        { folio: "B5371", nombre: "Jesus Garcia Cardenas", carrera: "TICS", estado: false, calificacion: null },
        { folio: "B5372", nombre: "Juan Jose Cardenas Zapata", carrera: "TICS", estado: true, calificacion: 10 },
        { folio: "B5373", nombre: "María Fernanda López Gómez", carrera: "Arquitectura", estado: true, calificacion: 8 },
        { folio: "B5374", nombre: "Pedro Martínez Sánchez", carrera: "Derecho", estado: true, calificacion: 7 },
        { folio: "B5375", nombre: "Ana González Pérez", carrera: "Medicina", estado: false, calificacion: null },
        { folio: "B5376", nombre: "Jorge Ramírez Reyes", carrera: "Economía", estado: true, calificacion: 9 },
        { folio: "B5377", nombre: "Luisa Torres Hernández", carrera: "Biología", estado: false, calificacion: null },
        { folio: "B5378", nombre: "Rosa Mendoza López", carrera: "Historia", estado: true, calificacion: 10 },
        { folio: "B5379", nombre: "Carlos López Jiménez", carrera: "Derecho", estado: true, calificacion: 8 },
        { folio: "B5380", nombre: "Laura Ramírez Gutiérrez", carrera: "Medicina", estado: false, calificacion: null },
        { folio: "B5381", nombre: "Roberto González Pérez", carrera: "Arquitectura", estado: true, calificacion: 9 },
        { folio: "B5382", nombre: "María Fernández Martínez", carrera: "TICS", estado: true, calificacion: 7 },
        { folio: "B5383", nombre: "Juan Carlos Rodríguez Ruiz", carrera: "Economía", estado: false, calificacion: null },
        { folio: "B5384", nombre: "Ana María Sánchez López", carrera: "Biología", estado: true, calificacion: 10 },
        { folio: "B5385", nombre: "Sofía Pérez Gómez", carrera: "Historia", estado: true, calificacion: 8 }
    ];

    const studentsPerPage = 6;
    let currentPage = 1;

    function displayStudents(page) {
        const tableBody = document.querySelector("#studentsTableBody");
        tableBody.innerHTML = "";

        const start = (page - 1) * studentsPerPage;
        const end = start + studentsPerPage;
        const paginatedStudents = allStudents.slice(start, end);

        paginatedStudents.forEach(student => {
            const row = tableBody.insertRow();
            row.insertCell(0).textContent = student.folio;
            row.insertCell(1).textContent = student.nombre;
            row.insertCell(2).textContent = student.carrera;

            const estadoCell = row.insertCell(3);
            estadoCell.textContent = student.estado ? "•" : "•";
            estadoCell.className = student.estado ? "text-success" : "text-danger";

            const calificacionCell = row.insertCell(4);
            const calificacionSpan = document.createElement("span");
            calificacionSpan.className = "grade";
            calificacionSpan.textContent = student.calificacion !== null ? student.calificacion : "-";
            calificacionCell.appendChild(calificacionSpan);
        });

        updatePagination();
    }

    function updatePagination() {
        const paginationDiv = document.getElementById("pagination");
        paginationDiv.innerHTML = "";

        const totalPages = Math.ceil(allStudents.length / studentsPerPage);

        // Función para crear un elemento de página
        function createPageItem(page, text, disabled) {
            const li = document.createElement("li");
            li.className = "page-item";
            if (disabled) {
                li.className += " disabled";
            }
            if (currentPage === page) {
                li.className += " active";
            }

            const a = document.createElement("a");
            a.className = "page-link";
            a.href = "#";
            a.textContent = text;

            a.addEventListener("click", function() {
                currentPage = page;
                updatePagination();
                // Lógica adicional para manejar el cambio de página
            });

            li.appendChild(a);
            return li;
        }

        // Lógica adicional para construir la paginación
        for (let i = 1; i <= totalPages; i++) {
            const pageItem = createPageItem(i, i, false);
            paginationDiv.appendChild(pageItem);
        }
    }


    const a = document.createElement("a");
            a.className = "page-link";
            a.href = "#";
            a.textContent = text;
            a.addEventListener("click", (event) => {
                event.preventDefault();
                if (currentPage !== page && !disabled) {
                    currentPage = page;
                    displayStudents(currentPage);
                }
            });

            li.appendChild(a);
            return li;
        };

        paginationDiv.appendChild(createPageItem(currentPage - 1, "<<", currentPage === 1));

        for (let i = 1; i <= totalPages; i++) {
            paginationDiv.appendChild(createPageItem(i, i));
        }

        paginationDiv.appendChild(createPageItem(currentPage + 1, ">>", currentPage === totalPages));
    }

    // Inicializar la visualización
    displayStudents(currentPage);

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../js/script.js"></script>
</body>
</html>
