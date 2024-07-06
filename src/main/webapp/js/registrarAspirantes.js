function obtenerindex(nombre) {
  const parametros = new URLSearchParams(window.location.search);
  return parametros.get(nombre);
}

const index = obtenerindex("index");
let aspirantes = JSON.parse(localStorage.getItem("aspirantes")) || [];
console.log(index);
if (index !== null && index !== undefined) {
  const aspirante = aspirantes[parseInt(index)];
  if (aspirante) {
    document.getElementById("nombre").value = aspirante.nombre;
    document.getElementById("apellidos").value = aspirante.apellidos;
    document.getElementById("curp").value = aspirante.curp;
    document.getElementById("folio").value = aspirante.folio;
    document.getElementById("fechaNacimiento").value =
      aspirante.fechaNacimiento;
    document.getElementById("formTitle").textContent = "Editar Aspirante";
  }
}

document
  .getElementById("registrationForm")
  .addEventListener("submit", function (event) {
    event.preventDefault();

    const nuevoAspirante = {
      nombre: document.getElementById("nombre").value,
      apellidos: document.getElementById("apellidos").value,
      curp: document.getElementById("curp").value,
      folio: document.getElementById("folio").value,
      fechaNacimiento: document.getElementById("fechaNacimiento").value,
    };

    if (index !== null && index !== undefined) {
      aspirantes[parseInt(index)] = nuevoAspirante;
    } else {
      aspirantes.push(nuevoAspirante);
    }

    localStorage.setItem("aspirantes", JSON.stringify(aspirantes));
    window.location.href = "../html/verAspirantes.jsp";
  });
