<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión - InventarioPlus</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Estilos personalizados -->
    <link rel="stylesheet" href="assets/css/login.css">

</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <!-- Header -->
            <div class="login-header">
                <div class="mb-3">
                    <i class="fas fa-boxes fa-3x"></i>
                </div>
                <h2>InventarioPlus</h2>
                <p class="subtitle mb-0">Sistema de Gestión de Inventario</p>
            </div>
            
            <!-- Body -->
            <div class="login-body">
                <!-- Alert para errores -->
                <div class="alert alert-danger d-none" id="errorAlert">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    <span id="errorMessage"></span>
                </div>
                
                <!-- Formulario de login -->
                <form id="loginForm" action="LoginServlet" method="post">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Usuario" required>
                        <label for="username">
                            <i class="fas fa-user me-2"></i>Usuario
                        </label>
                    </div>
                    
                    <div class="form-floating">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" required>
                        <label for="password">
                            <i class="fas fa-lock me-2"></i>Contraseña
                        </label>
                    </div>
                    
                    <div class="remember-forgot">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="remember" name="remember">
                            <label class="form-check-label" for="remember">
                                Recordarme
                            </label>
                        </div>
                        <a href="#" class="forgot-password">¿Olvidaste tu contraseña?</a>
                    </div>
                    
                    <button type="submit" class="btn btn-primary btn-login">
                        <i class="fas fa-sign-in-alt me-2"></i>
                        Iniciar Sesión
                    </button>
                </form>
                
                <!-- Divider -->
                <div class="divider">
                    <span>o continúa con</span>
                </div>
                
                <!-- Social Login -->
                <div class="social-login">
                    <button type="button" class="btn btn-social">
                        <i class="fab fa-google"></i>
                    </button>
                    <button type="button" class="btn btn-social">
                        <i class="fab fa-microsoft"></i>
                    </button>
                    <button type="button" class="btn btn-social">
                        <i class="fab fa-github"></i>
                    </button>
                </div>
            </div>
            
            <!-- Footer -->
            <div class="login-footer">
                <p class="mb-0">
                    ¿No tienes cuenta? <a href="register.jsp">Regístrate aquí</a>
                </p>
                <p class="mb-0 mt-2">
                    <small>&copy; 2025 InventarioPlus. Todos los derechos reservados.</small>
                </p>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- JavaScript personalizado -->
    <script src="assets/js/validaciones.js"></script>
    <script src="assets/js/login.js"></script>
</body>
</html>