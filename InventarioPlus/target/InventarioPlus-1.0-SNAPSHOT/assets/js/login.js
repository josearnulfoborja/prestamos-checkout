/**
 * InventarioPlus - JavaScript de Login
 */

document.addEventListener('DOMContentLoaded', function() {
    initializeLogin();
});

/**
 * Inicializar funcionalidades de login
 */
function initializeLogin() {
    initLoginForm();
    initPasswordToggle();
    initAnimations();
}

/**
 * Manejar el formulario de login
 */
function initLoginForm() {
    const loginForm = document.getElementById('loginForm');
    
    if (loginForm) {
        loginForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            
            // Validación básica
            if (!username || !password) {
                showError('Por favor, completa todos los campos.');
                return;
            }
            
            // Mostrar loading
            showLoading(true);
            
            // Simulación de login (reemplazar con lógica real)
            setTimeout(() => {
                if (username === 'admin' && password === 'admin') {
                    // Login exitoso
                    sessionStorage.setItem('user', username);
                    showSuccess('¡Bienvenido! Redirigiendo...');
                    
                    setTimeout(() => {
                        window.location.href = 'dashboard.jsp';
                    }, 1000);
                } else {
                    showError('Usuario o contraseña incorrectos.');
                }
                
                showLoading(false);
            }, 1500);
        });
    }
}

/**
 * Toggle para mostrar/ocultar contraseña
 */
function initPasswordToggle() {
    const passwordInput = document.getElementById('password');
    
    if (passwordInput) {
        const passwordToggle = document.createElement('button');
        passwordToggle.type = 'button';
        passwordToggle.className = 'btn btn-outline-secondary password-toggle';
        passwordToggle.innerHTML = '<i class="fas fa-eye"></i>';
        
        passwordInput.parentElement.style.position = 'relative';
        passwordInput.parentElement.appendChild(passwordToggle);
        
        passwordToggle.addEventListener('click', function() {
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            
            const icon = this.querySelector('i');
            icon.className = type === 'password' ? 'fas fa-eye' : 'fas fa-eye-slash';
        });
    }
}

/**
 * Animaciones de entrada
 */
function initAnimations() {
    const loginCard = document.querySelector('.login-card');
    
    if (loginCard) {
        loginCard.style.opacity = '0';
        loginCard.style.transform = 'translateY(20px)';
        
        setTimeout(() => {
            loginCard.style.transition = 'all 0.5s ease';
            loginCard.style.opacity = '1';
            loginCard.style.transform = 'translateY(0)';
        }, 100);
    }
}

/**
 * Mostrar mensaje de error
 */
function showError(message) {
    const errorAlert = document.getElementById('errorAlert');
    const errorMessage = document.getElementById('errorMessage');
    
    if (errorAlert && errorMessage) {
        errorMessage.textContent = message;
        errorAlert.classList.remove('d-none');
        
        // Ocultar el error después de 5 segundos
        setTimeout(() => {
            errorAlert.classList.add('d-none');
        }, 5000);
    }
}

/**
 * Mostrar mensaje de éxito
 */
function showSuccess(message) {
    // Crear o mostrar alert de éxito
    let successAlert = document.getElementById('successAlert');
    
    if (!successAlert) {
        successAlert = document.createElement('div');
        successAlert.id = 'successAlert';
        successAlert.className = 'alert alert-success';
        successAlert.innerHTML = `
            <i class="fas fa-check-circle me-2"></i>
            <span id="successMessage"></span>
        `;
        
        const errorAlert = document.getElementById('errorAlert');
        errorAlert.parentNode.insertBefore(successAlert, errorAlert);
    }
    
    const successMessage = document.getElementById('successMessage');
    successMessage.textContent = message;
    successAlert.classList.remove('d-none');
}

/**
 * Mostrar/ocultar loading
 */
function showLoading(show) {
    const submitBtn = document.querySelector('.btn-login');
    
    if (submitBtn) {
        if (show) {
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Iniciando sesión...';
        } else {
            submitBtn.disabled = false;
            submitBtn.innerHTML = '<i class="fas fa-sign-in-alt me-2"></i>Iniciar Sesión';
        }
    }
}

/**
 * Validaciones adicionales
 */
const LoginValidations = {
    /**
     * Validar formato de email
     */
    isValidEmail: function(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    },
    
    /**
     * Validar fuerza de contraseña
     */
    isStrongPassword: function(password) {
        // Al menos 8 caracteres, una mayúscula, una minúscula y un número
        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d@$!%*?&]{8,}$/;
        return passwordRegex.test(password);
    },
    
    /**
     * Sanitizar input
     */
    sanitizeInput: function(input) {
        return input.trim().replace(/[<>"']/g, '');
    }
};

// Hacer disponible globalmente
window.LoginValidations = LoginValidations;