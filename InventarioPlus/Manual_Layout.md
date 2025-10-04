# 📋 Manual de Uso del Layout - Sistema PrestaEquipos

## 🎯 Introducción

Este documento explica cómo utilizar el sistema de layout del **Sistema de Gestión de Préstamos de Equipos (PrestaEquipos)**. El layout proporciona una estructura consistente con header, sidebar y footer para todas las páginas de la aplicación.

---

## 🏗️ Estructura del Layout

### Componentes Principales:
- **Header/Navbar**: Navegación superior con notificaciones
- **Sidebar**: Menú lateral con opciones del sistema
- **Main Content**: Área principal para el contenido específico
- **Footer**: Pie de página pegado en la parte inferior

### Archivos del Sistema:
```
📁 src/main/webapp/
├── 📄 layout.jsp              # Layout principal
├── 📄 index.jsp               # Página de inicio
├── 📁 assets/
│   ├── 📁 css/
│   │   ├── 📄 estilos.css     # Estilos principales del layout
│   │   ├── 📄 dashboard.css   # Estilos específicos del dashboard
│   │   └── 📄 login.css       # Estilos del login
│   └── 📁 js/
│       ├── 📄 layout.js       # JavaScript del layout
│       └── 📄 validaciones.js # Validaciones generales
```

---

## 🚀 Cómo Crear una Nueva Página

### Paso 1: Crear el archivo JSP principal

Crea un archivo JSP que use el layout:

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); response.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Establecer el título de la página --%>
<c:set var="pageTitle" value="Mi Nueva Página" scope="request" />

<%-- Incluir el layout principal --%>
<jsp:include page="layout.jsp">
    <jsp:param name="content" value="mi-pagina-content.jsp" />
</jsp:include>
```

### Paso 2: Crear el archivo de contenido

Crea el archivo de contenido específico (ej: `mi-pagina-content.jsp`):

```jsp
<!-- Contenido específico de tu página -->
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fas fa-star text-primary"></i>
                        Mi Nueva Página
                    </h5>
                </div>
                <div class="card-body">
                    <p>Aquí va el contenido específico de tu página...</p>
                </div>
            </div>
        </div>
    </div>
</div>
```

---

## 🎨 Personalización del Layout

### Variables CSS Disponibles:
```css
:root {
    --primary-color: #2c3e50;      /* Color principal */
    --secondary-color: #3498db;    /* Color secundario */
    --success-color: #27ae60;      /* Color de éxito */
    --warning-color: #f39c12;      /* Color de advertencia */
    --danger-color: #e74c3c;       /* Color de peligro */
    --sidebar-width: 250px;        /* Ancho del sidebar */
}
```

### Clases CSS Útiles:
- `.text-primary-custom`: Texto color primario
- `.btn-toggle-sidebar`: Botón para mostrar/ocultar sidebar
- `.sidebar-menu`: Lista de menú del sidebar
- `.main-content`: Contenedor principal
- `.footer-custom`: Footer personalizado

---

## 📱 Responsividad

### Breakpoints:
- **Desktop**: > 768px - Sidebar visible
- **Mobile**: ≤ 768px - Sidebar oculto por defecto

### Comportamiento Móvil:
- Sidebar se oculta automáticamente
- Botón hamburguesa para mostrar/ocultar menú
- Layout se adapta a pantallas pequeñas

---

## 🔧 Configuración Avanzada

### Agregar CSS Adicional:
```jsp
<%-- En tu página JSP --%>
<c:set var="additionalCSS" value="mi-estilo-personalizado.css" scope="request" />
```

### Configurar Breadcrumb:
```jsp
<%-- En tu página JSP --%>
<c:set var="breadcrumb" value="Mi Sección > Mi Página" scope="request" />
```

### Mostrar Mensajes:
```jsp
<%-- Mensaje de éxito --%>
<c:set var="mensaje" value="Operación realizada exitosamente" scope="request" />

<%-- Mensaje de error --%>
<c:set var="error" value="Ha ocurrido un error" scope="request" />
```

---

## 📋 Ejemplos Prácticos

### Ejemplo 1: Página Simple
```jsp
<!-- mi-pagina.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); response.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="Gestión de Clientes" scope="request" />

<jsp:include page="layout.jsp">
    <jsp:param name="content" value="clientes-content.jsp" />
</jsp:include>
```

### Ejemplo 2: Página con Mensaje
```jsp
<!-- resultado.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); response.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="Resultado de Operación" scope="request" />
<c:set var="mensaje" value="Cliente guardado exitosamente" scope="request" />

<jsp:include page="layout.jsp">
    <jsp:param name="content" value="resultado-content.jsp" />
</jsp:include>
```

---

## 🎯 Menú del Sidebar

### Estructura del Menú:
```html
<!-- En layout.jsp -->
<ul class="sidebar-menu mt-3">
    <li>
        <a href="dashboard.jsp" class="active">
            <i class="fas fa-tachometer-alt"></i>
            Dashboard
        </a>
    </li>
    <li>
        <a href="clientes.jsp">
            <i class="fas fa-users"></i>
            Clientes
        </a>
    </li>
    <!-- Más opciones... -->
</ul>
```

### Agregar Nueva Opción al Menú:
1. Edita `layout.jsp`
2. Agrega un nuevo `<li>` en `.sidebar-menu`
3. Usa iconos de Font Awesome
4. Agrega clase `active` condicionalmente

---

## 🔍 Solución de Problemas

### Problema: Caracteres Especiales
**Solución**: Asegúrate de incluir estas líneas en cada JSP:
```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); response.setCharacterEncoding("UTF-8"); %>
```

### Problema: Footer No Se Pega Abajo
**Solución**: El layout ya tiene configurado sticky footer. Verifica que uses:
```html
<body class="d-flex flex-column min-vh-100">
```

### Problema: Sidebar No Funciona en Móvil
**Solución**: Verifica que `layout.js` esté cargando correctamente.

---

## 📚 Recursos Adicionales

### Librerías Incluidas:
- **Bootstrap 5.3.2**: Framework CSS
- **Font Awesome 6.4.0**: Iconos
- **Chart.js**: Gráficos (opcional)

### Enlaces Útiles:
- [Bootstrap Documentation](https://getbootstrap.com/docs/5.3/)
- [Font Awesome Icons](https://fontawesome.com/icons)
- [Chart.js Documentation](https://www.chartjs.org/docs/)

---

## ✅ Checklist de Desarrollo

Cuando crees una nueva página, asegúrate de:

- [ ] Incluir directivas UTF-8
- [ ] Establecer `pageTitle`
- [ ] Crear archivo de contenido separado
- [ ] Usar clases Bootstrap para responsividad
- [ ] Probar en desktop y móvil
- [ ] Verificar caracteres especiales
- [ ] Validar que el footer se pegue abajo

---

## 🚀 Ejemplo Completo

### Archivo: `equipos.jsp`
```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); response.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="Gestión de Equipos" scope="request" />
<c:set var="breadcrumb" value="Inventario > Equipos" scope="request" />

<jsp:include page="layout.jsp">
    <jsp:param name="content" value="equipos-content.jsp" />
</jsp:include>
```

### Archivo: `equipos-content.jsp`
```jsp
<div class="container-fluid">
    <!-- Header de la página -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center">
                <h2>
                    <i class="fas fa-cogs text-primary"></i>
                    Gestión de Equipos
                </h2>
                <button class="btn btn-primary">
                    <i class="fas fa-plus"></i>
                    Nuevo Equipo
                </button>
            </div>
        </div>
    </div>

    <!-- Cards de estadísticas -->
    <div class="row mb-4">
        <div class="col-md-3">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                        Total Equipos
                    </div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">142</div>
                </div>
            </div>
        </div>
        <!-- Más cards... -->
    </div>

    <!-- Tabla de equipos -->
    <div class="card shadow">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Datos de equipos -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
```

---

## 📞 Soporte

Si tienes problemas con el layout:

1. **Verifica** que todos los archivos CSS y JS estén cargando
2. **Revisa** la consola del navegador para errores
3. **Confirma** que las directivas UTF-8 estén presentes  
4. **Prueba** en diferentes navegadores y dispositivos

---

**¡Con este layout tienes todo lo necesario para crear páginas consistentes y profesionales en tu Sistema PrestaEquipos!** 🚀