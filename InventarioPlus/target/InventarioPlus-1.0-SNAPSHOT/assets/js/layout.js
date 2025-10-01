/**
 * InventarioPlus - JavaScript del Layout Principal
 */

// Esperar a que el DOM esté cargado
document.addEventListener('DOMContentLoaded', function() {
    initializeLayout();
});

/**
 * Inicializar funcionalidades del layout
 */
function initializeLayout() {
    initSidebarToggle();
    initCurrentDate();
    initSmoothScrolling();
    initAutoHideAlerts();
    initAnimations();
}

/**
 * Funcionalidad del toggle del sidebar
 */
function initSidebarToggle() {
    const sidebarToggle = document.getElementById('sidebarToggle');
    const sidebar = document.getElementById('sidebar');
    
    if (sidebarToggle && sidebar) {
        // Toggle del sidebar
        sidebarToggle.addEventListener('click', function() {
            sidebar.classList.toggle('show');
        });
        
        // Cerrar sidebar al hacer clic fuera en móvil
        document.addEventListener('click', function(event) {
            if (window.innerWidth <= 768) {
                if (!sidebar.contains(event.target) && !sidebarToggle.contains(event.target)) {
                    sidebar.classList.remove('show');
                }
            }
        });
        
        // Cerrar sidebar al cambiar tamaño de ventana
        window.addEventListener('resize', function() {
            if (window.innerWidth > 768) {
                sidebar.classList.remove('show');
            }
        });
    }
}

/**
 * Actualizar fecha actual en el header
 */
function initCurrentDate() {
    updateCurrentDate();
    // Actualizar cada minuto
    setInterval(updateCurrentDate, 60000);
}

function updateCurrentDate() {
    const dateElement = document.getElementById('currentDate');
    if (dateElement) {
        const now = new Date();
        const options = { 
            year: 'numeric', 
            month: 'long', 
            day: 'numeric',
            weekday: 'long'
        };
        dateElement.textContent = now.toLocaleDateString('es-ES', options);
    }
}

/**
 * Scroll suave para enlaces anchor
 */
function initSmoothScrolling() {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });
}

/**
 * Auto-ocultar alertas después de 5 segundos
 */
function initAutoHideAlerts() {
    setTimeout(function() {
        const alerts = document.querySelectorAll('.alert');
        alerts.forEach(function(alert) {
            if (bootstrap && bootstrap.Alert) {
                const bsAlert = new bootstrap.Alert(alert);
                bsAlert.close();
            }
        });
    }, 5000);
}

/**
 * Inicializar animaciones de entrada
 */
function initAnimations() {
    // Animación de entrada para cards
    const cards = document.querySelectorAll('.card');
    cards.forEach((card, index) => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(20px)';
        
        setTimeout(() => {
            card.style.transition = 'all 0.5s ease';
            card.style.opacity = '1';
            card.style.transform = 'translateY(0)';
        }, 100 + (index * 100));
    });
}

/**
 * Utilidades generales
 */
const LayoutUtils = {
    /**
     * Mostrar notificación toast
     */
    showToast: function(message, type = 'info') {
        // Crear elemento toast
        const toast = document.createElement('div');
        toast.className = `toast align-items-center text-white bg-${type} border-0`;
        toast.setAttribute('role', 'alert');
        toast.innerHTML = `
            <div class="d-flex">
                <div class="toast-body">
                    ${message}
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
            </div>
        `;
        
        // Agregar al container de toasts
        let toastContainer = document.getElementById('toast-container');
        if (!toastContainer) {
            toastContainer = document.createElement('div');
            toastContainer.id = 'toast-container';
            toastContainer.className = 'toast-container position-fixed bottom-0 end-0 p-3';
            document.body.appendChild(toastContainer);
        }
        
        toastContainer.appendChild(toast);
        
        // Mostrar toast
        if (bootstrap && bootstrap.Toast) {
            const bsToast = new bootstrap.Toast(toast);
            bsToast.show();
            
            // Remover del DOM después de ocultarse
            toast.addEventListener('hidden.bs.toast', () => {
                toast.remove();
            });
        }
    },
    
    /**
     * Confirmar acción con modal
     */
    confirmAction: function(message, callback) {
        if (confirm(message)) {
            callback();
        }
    },
    
    /**
     * Mostrar/ocultar loading spinner
     */
    toggleLoading: function(show = true) {
        let spinner = document.getElementById('global-spinner');
        
        if (show && !spinner) {
            spinner = document.createElement('div');
            spinner.id = 'global-spinner';
            spinner.className = 'position-fixed top-0 start-0 w-100 h-100 d-flex align-items-center justify-content-center';
            spinner.style.backgroundColor = 'rgba(0,0,0,0.5)';
            spinner.style.zIndex = '9999';
            spinner.innerHTML = `
                <div class="spinner-border text-primary" role="status">
                    <span class="visually-hidden">Cargando...</span>
                </div>
            `;
            document.body.appendChild(spinner);
        } else if (!show && spinner) {
            spinner.remove();
        }
    }
};

// Hacer LayoutUtils disponible globalmente
window.LayoutUtils = LayoutUtils;