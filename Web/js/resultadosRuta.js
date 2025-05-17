document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.boton-ver-detalles').forEach(btn => {
    btn.addEventListener('click', () => {
      const id = btn.dataset.rutaId;
      const detalles = document.getElementById(`detalles-ruta-${id}`);
      detalles.classList.toggle('visible');
      btn.textContent = detalles.classList.contains('visible') ? 'Ocultar' : 'Ver detalles';
    });
  });
});