function obtenerAspirantesDeLocalStorage() {
  const aspirantesString = localStorage.getItem("aspirantes");
  return aspirantesString ? JSON.parse(aspirantesString) : [];
}
function guardarAspirantesEnLocalStorage(aspirantes) {
  localStorage.setItem("aspirantes", JSON.stringify(aspirantes));
}
function actualizarTabla(aspirantes) {
  let aspirantesTableBody = document.getElementById("aspirantesTableBody");
  aspirantesTableBody.innerHTML = "";
  aspirantes.forEach((aspirante, index) => {
    const newRow = document.createElement("tr");
    newRow.innerHTML = `
          <td>${aspirante.nombre}</td>
          <td>${aspirante.apellidos}</td>
          <td>${aspirante.curp}</td>
          <td>${aspirante.folio}</td>
          <td>${aspirante.fechaNacimiento}</td>
          <td>
            <button class="btn btn-danger btn-eliminar" data-index="${index}">
              <i class="fas fa-trash"></i>
            </button>
          </td>
          <td>
            <a href="registrarAspirantes.jsp?index=${index}" class="btn btn-primary">
              <i class="fas fa-edit"></i>
            </a>
          </td>
      `;
    aspirantesTableBody.appendChild(newRow);
  });
  let btnsEliminar = document.querySelectorAll(".btn-eliminar");
  btnsEliminar.forEach((btn) => {
    btn.addEventListener("click", function () {
      let index = parseInt(btn.getAttribute("data-index"));
      aspirantes.splice(index, 1);
      guardarAspirantesEnLocalStorage(aspirantes);
      actualizarTabla(aspirantes);
    });
  });
}
let aspirantes = obtenerAspirantesDeLocalStorage();
actualizarTabla(aspirantes);
