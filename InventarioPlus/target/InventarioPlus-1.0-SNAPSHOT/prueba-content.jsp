<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Contenido de la página de prueba -->
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <!-- Header de la página -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1 class="h2 text-primary-custom">
                        <i class="fas fa-flask me-2"></i>
                        Página de Prueba
                    </h1>
                    <p class="text-muted">Esta es una página simple para probar el layout del sistema</p>
                </div>
                <div>
                    <button class="btn btn-success" onclick="mostrarAlerta()">
                        <i class="fas fa-check me-1"></i>
                        Probar Funcionalidad
                    </button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Tarjetas de información -->
    <div class="row mb-4">
        <div class="col-lg-4 col-md-6 mb-3">
            <div class="card card-custom h-100">
                <div class="card-header card-header-custom">
                    <h5 class="mb-0">
                        <i class="fas fa-info-circle me-2"></i>
                        Información del Layout
                    </h5>
                </div>
                <div class="card-body">
                    <p>Este layout incluye:</p>
                    <ul>
                        <li>Sidebar responsive</li>
                        <li>Navegación superior</li>
                        <li>Menú completo sin restricciones</li>
                        <li>Estilos CSS personalizados</li>
                        <li>Bootstrap 5.3.2</li>
                        <li>Font Awesome 6.4.0</li>
                    </ul>
                </div>
            </div>
        </div>
        
        <div class="col-lg-4 col-md-6 mb-3">
            <div class="card card-custom h-100">
                <div class="card-header card-header-custom">
                    <h5 class="mb-0">
                        <i class="fas fa-cogs me-2"></i>
                        Características
                    </h5>
                </div>
                <div class="card-body">
                    <div class="d-flex align-items-center mb-2">
                        <i class="fas fa-check-circle text-success me-2"></i>
                        <span>Sin autenticación requerida</span>
                    </div>
                    <div class="d-flex align-items-center mb-2">
                        <i class="fas fa-check-circle text-success me-2"></i>
                        <span>Acceso completo al menú</span>
                    </div>
                    <div class="d-flex align-items-center mb-2">
                        <i class="fas fa-check-circle text-success me-2"></i>
                        <span>Diseño responsive</span>
                    </div>
                    <div class="d-flex align-items-center mb-2">
                        <i class="fas fa-check-circle text-success me-2"></i>
                        <span>Estilos personalizados</span>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-lg-4 col-md-6 mb-3">
            <div class="card card-custom h-100">
                <div class="card-header card-header-custom">
                    <h5 class="mb-0">
                        <i class="fas fa-tools me-2"></i>
                        Acciones de Prueba
                    </h5>
                </div>
                <div class="card-body">
                    <p>Puedes probar las siguientes funcionalidades:</p>
                    <div class="d-grid gap-2">
                        <button class="btn btn-primary-custom btn-sm" onclick="toggleSidebar()">
                            <i class="fas fa-bars me-1"></i>
                            Toggle Sidebar
                        </button>
                        <button class="btn btn-secondary btn-sm" onclick="cambiarTema()">
                            <i class="fas fa-palette me-1"></i>
                            Cambiar Tema
                        </button>
                        <button class="btn btn-info btn-sm" onclick="mostrarInfo()">
                            <i class="fas fa-info me-1"></i>
                            Mostrar Info
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Área de contenido adicional -->
    <div class="row">
        <div class="col-12">
            <div class="card card-custom">
                <div class="card-header card-header-custom">
                    <h5 class="mb-0">
                        <i class="fas fa-terminal me-2"></i>
                        Área de Contenido Dinámico
                    </h5>
                </div>
                <div class="card-body">
                    <p>Esta es un área donde puedes agregar cualquier contenido que necesites probar.</p>
                    <div class="alert alert-info" role="alert">
                        <i class="fas fa-lightbulb me-2"></i>
                        <strong>Tip:</strong> Puedes modificar este contenido editando el archivo <code>prueba-content.jsp</code>
                    </div>
                    
                    <!-- Ejemplo de tabla -->
                    <h6 class="mt-4">Ejemplo de Tabla</h6>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Estado</th>
                                    <th>Fecha</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Elemento de Prueba 1</td>
                                    <td><span class="badge bg-success">Activo</span></td>
                                    <td>30/09/2025</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Elemento de Prueba 2</td>
                                    <td><span class="badge bg-warning">Pendiente</span></td>
                                    <td>29/09/2025</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Elemento de Prueba 3</td>
                                    <td><span class="badge bg-danger">Inactivo</span></td>
                                    <td>28/09/2025</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function mostrarAlerta() {
    alert('¡El layout está funcionando correctamente!');
}

function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.getElementById('mainContent');
    
    if (sidebar && mainContent) {
        sidebar.classList.toggle('collapsed');
        mainContent.classList.toggle('expanded');
    }
}

function cambiarTema() {
    document.body.classList.toggle('dark-theme');
    alert('Funcionalidad de cambio de tema - Puedes implementar tu lógica aquí');
}

function mostrarInfo() {
    const info = `
    Layout Info:
    - Página actual: ${window.location.pathname}
    - Ancho de ventana: ${window.innerWidth}px
    - Altura de ventana: ${window.innerHeight}px
    - User Agent: ${navigator.userAgent.substring(0, 50)}...
    `;
    alert(info);
}
</script>