# Plantilla Layout JSP con Bootstrap

## Descripción

Esta plantilla proporciona un layout base para el sistema InventarioPlus, incluyendo:

- **Header**: Barra de navegación superior con logo, notificaciones y perfil de usuario
- **Sidebar**: Menú lateral de navegación con enlaces a diferentes secciones
- **Footer**: Pie de página con información del sistema
- **Bootstrap 5.3.2**: Framework CSS para diseño responsive
- **Font Awesome & Bootstrap Icons**: Iconografía

## Estructura de Archivos

```
webapp/
├── assets/
│   ├── css/
│   │   ├── estilos.css      # Estilos generales del layout
│   │   ├── dashboard.css    # Estilos específicos del dashboard
│   │   └── login.css        # Estilos específicos del login
│   ├── js/
│   │   ├── layout.js        # JavaScript principal del layout
│   │   ├── login.js         # JavaScript específico del login
│   │   └── validaciones.js  # Utilidades de validación
│   └── img/                 # Imágenes del proyecto
├── layout.jsp               # Plantilla base principal
├── dashboard.jsp            # Ejemplo de página usando la plantilla
├── productos.jsp            # Ejemplo de página de gestión
├── login.jsp                # Página de inicio de sesión
└── index.jsp                # Página de redirección inicial
```

## Cómo Usar la Plantilla

### 1. Estructura Básica

Para crear una nueva página usando la plantilla, sigue este formato:

```jsp
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Establecer parámetros para la plantilla -->
<c:set var="pageTitle" value="Título de tu Página" />
<c:set var="currentPage" value="nombre-pagina" />

<!-- Incluir la plantilla layout -->
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="${pageTitle}" />
    <jsp:param name="page" value="${currentPage}" />
</jsp:include>

<!-- Contenido específico de la página -->
<div id="page-content">
    <!-- Tu contenido aquí -->
</div>
```

### 2. Parámetros de la Plantilla

- `title`: Título que aparece en la pestaña del navegador y en el header de la página
- `page`: Identificador de la página actual para marcar el elemento activo en el sidebar

### 3. Páginas Disponibles en el Sidebar

Las siguientes páginas están configuradas en el menú lateral:

- `dashboard` - Panel principal
- `productos` - Gestión de productos
- `categorias` - Gestión de categorías
- `proveedores` - Gestión de proveedores
- `ventas` - Módulo de ventas
- `compras` - Módulo de compras
- `reportes` - Reportes y estadísticas
- `usuarios` - Gestión de usuarios
- `configuracion` - Configuración del sistema

### 4. Características del Layout

#### Header
- Logo y nombre del sistema
- Botón de toggle para sidebar en mobile
- Notificaciones con contador
- Menú de usuario con perfil y logout

#### Sidebar
- Navigation responsive
- Indicador visual de página activa
- Iconos Font Awesome para cada sección
- Colapsa automáticamente en móviles

#### Contenido Principal
- Breadcrumb automático
- Título de página dinámico
- Fecha actual
- Área de contenido flexible

#### Footer
- Información del sistema
- Enlaces a soporte y documentación
- Versión del sistema

### 5. Estilos y Colores

La plantilla utiliza las siguientes variables CSS:

```css
:root {
    --sidebar-width: 250px;
    --header-height: 60px;
    --primary-color: #0d6efd;
    --secondary-color: #6c757d;
    --success-color: #198754;
    --danger-color: #dc3545;
    --warning-color: #ffc107;
    --info-color: #0dcaf0;
}
```

### 6. Diseño Responsive

- **Desktop**: Sidebar fijo, contenido con margen
- **Tablet/Mobile**: Sidebar overlay, botón de toggle visible
- **Breakpoint**: 768px

### 7. Archivos CSS y JavaScript

#### Archivos CSS:
- **`assets/css/estilos.css`**: Estilos generales del layout (header, sidebar, footer)
- **`assets/css/dashboard.css`**: Estilos específicos para el dashboard 
- **`assets/css/login.css`**: Estilos específicos para la página de login

#### Archivos JavaScript:
- **`assets/js/layout.js`**: Funcionalidades principales del layout
  - Toggle del sidebar
  - Actualización automática de fecha
  - Animaciones suaves
  - Auto-hide de alertas
  - Utilidades generales (LayoutUtils)

- **`assets/js/login.js`**: Funcionalidades específicas del login
  - Manejo del formulario de login
  - Toggle de contraseña
  - Animaciones de entrada
  - Validaciones básicas

- **`assets/js/validaciones.js`**: Utilidades de validación
  - Validaciones de formularios
  - Formateo de datos
  - Utilidades para manejo de formularios

## Ejemplos de Uso

### Página Simple

```jsp
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="Mi Nueva Página" />
<c:set var="currentPage" value="mi-pagina" />

<jsp:include page="layout.jsp">
    <jsp:param name="title" value="${pageTitle}" />
    <jsp:param name="page" value="${currentPage}" />
</jsp:include>

<div id="page-content">
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">¡Hola Mundo!</h5>
            <p class="card-text">Este es el contenido de mi nueva página.</p>
        </div>
    </div>
</div>
```

### Página con Cards de Estadísticas

```jsp
<div id="page-content">
    <div class="row">
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                Total
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">1,234</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-boxes fa-2x text-primary"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
```

## Personalización

### Agregar Nuevas Páginas al Sidebar

1. Edita `layout.jsp`
2. Agrega un nuevo `<li class="nav-item">` en la sección del sidebar
3. Usa el formato: `<%= "tu-pagina".equals(currentPage) ? "active" : "" %>`

### Cambiar Colores

Modifica las variables CSS en la sección `<style>` de `layout.jsp`:

```css
:root {
    --primary-color: #tu-color-primario;
    --secondary-color: #tu-color-secundario;
}
```

### Agregar Scripts Adicionales

Usa el fragmento `additionalScripts` al final de tu contenido:

```jsp
<jsp:invoke fragment="additionalScripts">
    <script src="tu-script.js"></script>
</jsp:invoke>
```

## Dependencias

- Bootstrap 5.3.2 (CSS y JS)
- Font Awesome 6.4.0
- Bootstrap Icons 1.11.1
- Chart.js (para gráficos en dashboard)

## Navegadores Soportados

- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

## Notas de Implementación

1. Asegúrate de que el servidor soporte JSTL
2. Las imágenes de placeholder pueden reemplazarse con imágenes reales
3. Los enlaces del sidebar deben apuntar a páginas reales
4. El sistema de autenticación debe implementarse en el backend

## Próximas Mejoras

- [ ] Tema dark/light
- [ ] Más opciones de personalización
- [ ] Sidebar collapsible en desktop
- [ ] Mejores animaciones
- [ ] Soporte para PWA