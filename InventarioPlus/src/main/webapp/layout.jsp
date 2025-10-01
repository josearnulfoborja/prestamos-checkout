<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Obtener parámetros para la plantilla
    String pageTitle = request.getParameter("title");
    if (pageTitle == null) pageTitle = "InventarioPlus";
    
    String currentPage = request.getParameter("page");
    if (currentPage == null) currentPage = "dashboard";
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= pageTitle %> - InventarioPlus</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Estilos personalizados -->
    <link rel="stylesheet" href="assets/css/estilos.css">
    <link rel="stylesheet" href="assets/css/dashboard.css">

</head>
<body>
    <!-- Header -->
    <nav class="navbar navbar-expand-lg main-header">
        <div class="container-fluid">
            <!-- Sidebar Toggle Button -->
            <button class="btn btn-outline-light sidebar-toggle me-3" type="button" id="sidebarToggle">
                <i class="fas fa-bars"></i>
            </button>
            
            <!-- Brand -->
            <a class="navbar-brand" href="dashboard.jsp">
                <i class="fas fa-boxes me-2"></i>
                InventarioPlus
            </a>
            
            <!-- Header Right -->
            <div class="navbar-nav ms-auto">
                <!-- Notifications -->
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-bell"></i>
                        <span class="badge bg-danger rounded-pill">3</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><h6 class="dropdown-header">Notificaciones</h6></li>
                        <li><a class="dropdown-item" href="#"><i class="fas fa-exclamation-triangle text-warning me-2"></i>Stock bajo en Producto A</a></li>
                        <li><a class="dropdown-item" href="#"><i class="fas fa-info-circle text-info me-2"></i>Nueva actualización disponible</a></li>
                        <li><a class="dropdown-item" href="#"><i class="fas fa-user text-success me-2"></i>Nuevo usuario registrado</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-center" href="#">Ver todas</a></li>
                    </ul>
                </div>
                
                <!-- User Profile -->
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle user-profile" href="#" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-user-circle me-2"></i>
                        <span>Usuario</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#"><i class="fas fa-user me-2"></i>Mi Perfil</a></li>
                        <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i>Configuración</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="logout.jsp"><i class="fas fa-sign-out-alt me-2"></i>Cerrar Sesión</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <!-- Sidebar -->
    <nav class="sidebar" id="sidebar">
        <ul class="nav flex-column sidebar-nav">
            <li class="nav-item">
                <a class="nav-link <%= "dashboard".equals(currentPage) ? "active" : "" %>" href="dashboard.jsp">
                    <i class="fas fa-tachometer-alt"></i>
                    Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= "productos".equals(currentPage) ? "active" : "" %>" href="productos.jsp">
                    <i class="fas fa-boxes"></i>
                    Productos
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= "categorias".equals(currentPage) ? "active" : "" %>" href="categorias.jsp">
                    <i class="fas fa-tags"></i>
                    Categorías
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= "proveedores".equals(currentPage) ? "active" : "" %>" href="proveedores.jsp">
                    <i class="fas fa-truck"></i>
                    Proveedores
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= "ventas".equals(currentPage) ? "active" : "" %>" href="ventas.jsp">
                    <i class="fas fa-shopping-cart"></i>
                    Ventas
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= "compras".equals(currentPage) ? "active" : "" %>" href="compras.jsp">
                    <i class="fas fa-shopping-bag"></i>
                    Compras
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= "reportes".equals(currentPage) ? "active" : "" %>" href="reportes.jsp">
                    <i class="fas fa-chart-bar"></i>
                    Reportes
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= "usuarios".equals(currentPage) ? "active" : "" %>" href="usuarios.jsp">
                    <i class="fas fa-users"></i>
                    Usuarios
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%= "configuracion".equals(currentPage) ? "active" : "" %>" href="configuracion.jsp">
                    <i class="fas fa-cog"></i>
                    Configuración
                </a>
            </li>
        </ul>
    </nav>

    <!-- Main Content -->
    <main class="main-content">
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="dashboard.jsp">Inicio</a></li>
                <% if (!"dashboard".equals(currentPage)) { %>
                    <li class="breadcrumb-item active" aria-current="page">
                        <%= pageTitle %>
                    </li>
                <% } %>
            </ol>
        </nav>
        
        <!-- Page Title -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="h3 mb-0 text-gray-800"><%= pageTitle %></h1>
            <div class="text-muted">
                <i class="fas fa-calendar-alt me-1"></i>
                <span id="currentDate"></span>
            </div>
        </div>
        
        <!-- Content will be injected here -->
        <div id="page-content">
            <!-- Las páginas individuales incluirán su contenido aquí -->
            <jsp:include page="${param.contentPage}" />
        </div>
    </main>

    <!-- Footer -->
    <footer class="main-footer">
        <div class="d-flex justify-content-between align-items-center">
            <div class="text-muted">
                <strong>InventarioPlus</strong> © 2025. Sistema de Gestión de Inventario.
            </div>
            <div class="text-muted">
                Versión 1.0.0 | 
                <a href="#" class="text-decoration-none">Soporte</a> | 
                <a href="#" class="text-decoration-none">Documentación</a>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- JavaScript personalizado -->
    <script src="assets/js/validaciones.js"></script>
    <script src="assets/js/layout.js"></script>
    
    <!-- Additional scripts can be included here -->
    <jsp:invoke fragment="additionalScripts" />
</body>
</html>