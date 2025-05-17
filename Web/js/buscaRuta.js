document.addEventListener("DOMContentLoaded", function () {
    const formulario = document.querySelector("form"); // asume que solo hay un form en la página
    const origen = document.getElementById("origen");
    const destino = document.getElementById("destino");

    if (formulario) {
        formulario.addEventListener("submit", function (e) {
            let errores = [];

            if (!origen.value || !destino.value) {
                errores.push("Debe seleccionar tanto estación de origen como de destino.");
            } else if (origen.value === destino.value) {
                errores.push("El origen y el destino no pueden ser la misma estación.");
            }

            if (errores.length > 0) {
                e.preventDefault(); // Detiene el envío del formulario
                alert(errores.join("\n"));
            }
        });
    }
});
