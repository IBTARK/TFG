document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.boton-ver-detalles').forEach(btn => {
    btn.addEventListener('click', () => {
      const id = btn.dataset.rutaId;
      const pane = document.getElementById(`detalles-ruta-${id}`);
      pane.classList.toggle('visible');
      btn.textContent = pane.classList.contains('visible')
        ? 'Ocultar'
        : 'Ver detalles';
    });
  });
});
