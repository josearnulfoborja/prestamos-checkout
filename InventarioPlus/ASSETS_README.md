# Guía de Archivos CSS y JavaScript - InventarioPlus

Esta guía explica cómo están organizados los archivos CSS y JavaScript del proyecto InventarioPlus y cómo utilizarlos correctamente.

## 📁 Estructura de Assets

```
assets/
├── css/
│   ├── estilos.css      # Estilos base del layout
│   ├── dashboard.css    # Estilos específicos del dashboard
│   └── login.css        # Estilos específicos del login
├── js/
│   ├── layout.js        # JavaScript principal del layout
│   ├── login.js         # JavaScript del sistema de login
│   └── validaciones.js  # Utilidades de validación
└── img/                 # Imágenes (vacía por ahora)
```

## 🎨 Archivos CSS

### `assets/css/estilos.css`
**Propósito**: Estilos generales que se aplican a todas las páginas que usan el layout principal.

**Contiene**:
- Variables CSS globales (colores, dimensiones)
- Estilos del header y navegación
- Estilos del sidebar y menú lateral
- Estilos del contenido principal y footer
- Media queries para responsive design
- Animaciones básicas de cards y breadcrumb

**Se incluye en**: `layout.jsp`

### `assets/css/dashboard.css`
**Propósito**: Estilos específicos para la página del dashboard.

**Contiene**:
- Estilos para cards de estadísticas
- Clases para bordes de colores
- Estilos para gráficos y charts
- Estilos para tablas de datos
- Animaciones específicas del dashboard

**Se incluye en**: `layout.jsp` (disponible para todas las páginas que lo usen)

### `assets/css/login.css`
**Propósito**: Estilos específicos para la página de login.

**Contiene**:
- Estilos del container de login
- Estilos de la tarjeta de login
- Estilos de formularios de autenticación
- Estilos de botones sociales
- Media queries específicas para login

**Se incluye en**: `login.jsp`

## 🔧 Archivos JavaScript

### `assets/js/layout.js`
**Propósito**: Funcionalidades principales del layout que se aplican a todas las páginas.

**Funciones principales**:
```javascript
initializeLayout()          // Inicializa todas las funcionalidades
initSidebarToggle()        // Manejo del sidebar colapsible
initCurrentDate()          // Actualización de fecha en tiempo real
initSmoothScrolling()      // Scroll suave para enlaces
initAutoHideAlerts()       // Auto-ocultar alertas después de 5s
initAnimations()           // Animaciones de entrada para elementos
```

**Utilidades disponibles globalmente**:
```javascript
LayoutUtils.showToast(message, type)     // Mostrar notificación toast
LayoutUtils.confirmAction(message, cb)   // Modal de confirmación
LayoutUtils.toggleLoading(show)          // Mostrar/ocultar spinner
```

**Se incluye en**: `layout.jsp`

### `assets/js/login.js`
**Propósito**: Funcionalidades específicas del sistema de login.

**Funciones principales**:
```javascript
initializeLogin()          // Inicializa funcionalidades de login
initLoginForm()           // Manejo del formulario de login
initPasswordToggle()      // Toggle para mostrar/ocultar contraseña
initAnimations()          // Animaciones específicas del login
showError(message)        // Mostrar errores de login
showSuccess(message)      // Mostrar mensajes de éxito
showLoading(show)         // Loading state del botón
```

**Validaciones disponibles**:
```javascript
LoginValidations.isValidEmail(email)
LoginValidations.isStrongPassword(password)
LoginValidations.sanitizeInput(input)
```

**Se incluye en**: `login.jsp`

### `assets/js/validaciones.js`
**Propósito**: Utilidades de validación y formateo para usar en todo el proyecto.

**Validaciones disponibles**:
```javascript
Validaciones.requerido(valor, nombreCampo)
Validaciones.email(email)
Validaciones.longitudMinima(valor, minimo, nombreCampo)
Validaciones.numero(valor, nombreCampo)
Validaciones.telefono(telefono)
Validaciones.fecha(fecha, nombreCampo)
Validaciones.precio(precio)
Validaciones.stock(stock)
```

**Utilidades de formularios**:
```javascript
FormUtils.validarFormulario(formulario, reglas)
FormUtils.mostrarErrores(formulario, errores)
FormUtils.limpiarFormulario(formulario)
FormUtils.serializarFormulario(formulario)
```

**Utilidades de formato**:
```javascript
FormatoUtils.formatearPrecio(precio)
FormatoUtils.formatearNumero(numero)
FormatoUtils.formatearFecha(fecha)
FormatoUtils.capitalizar(texto)
```

**Se incluye en**: `layout.jsp` y `login.jsp`

## 🚀 Cómo Usar los Archivos

### Para una página que usa el layout principal:

```jsp
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="Mi Página" />
<c:set var="currentPage" value="mi-pagina" />

<jsp:include page="layout.jsp">
    <jsp:param name="title" value="${pageTitle}" />
    <jsp:param name="page" value="${currentPage}" />
</jsp:include>

<div id="page-content">
    <!-- Tu contenido aquí -->
    <!-- Automáticamente tienes acceso a: -->
    <!-- - Estilos de estilos.css y dashboard.css -->
    <!-- - JavaScript de layout.js y validaciones.js -->
    <!-- - Utilidades LayoutUtils, FormUtils, etc. -->
</div>

<script>
// Tu JavaScript específico aquí
// Puedes usar las utilidades globales:
LayoutUtils.showToast('¡Operación exitosa!', 'success');

// O las validaciones:
const errores = FormUtils.validarFormulario(miFormulario, {
    nombre: [
        { validador: Validaciones.requerido, mensaje: 'Nombre' },
        { validador: (v) => Validaciones.longitudMinima(v, 3, 'Nombre') }
    ]
});
</script>
```

### Para crear estilos específicos de una página:

Si necesitas estilos específicos para una nueva página, puedes:

1. **Crear un nuevo archivo CSS**:
```css
/* assets/css/mi-pagina.css */
.mi-clase-especifica {
    /* tus estilos */
}
```

2. **Incluirlo en tu JSP**:
```jsp
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="Mi Página" />
    <jsp:param name="page" value="mi-pagina" />
</jsp:include>

<!-- CSS específico adicional -->
<link rel="stylesheet" href="assets/css/mi-pagina.css">
```

### Para crear JavaScript específico de una página:

1. **Crear un archivo JS específico**:
```javascript
// assets/js/mi-pagina.js
document.addEventListener('DOMContentLoaded', function() {
    // Tu código específico aquí
    // Puedes usar las utilidades globales
});
```

2. **Incluirlo en tu JSP**:
```jsp
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="Mi Página" />
    <jsp:param name="page" value="mi-pagina" />
</jsp:include>

<div id="page-content">
    <!-- contenido -->
</div>

<!-- JavaScript específico adicional -->
<script src="assets/js/mi-pagina.js"></script>
```

## 🔧 Modificar Estilos Globales

Para cambiar colores, tamaños o comportamientos globales:

1. **Edita las variables CSS en `assets/css/estilos.css`**:
```css
:root {
    --primary-color: #tu-color-aqui;
    --sidebar-width: 280px; /* cambiar ancho del sidebar */
}
```

2. **Los cambios se aplicarán automáticamente a todas las páginas**

## ⚡ Mejores Prácticas

1. **Mantén la separación**: CSS en `/css/`, JS en `/js/`
2. **Usa las utilidades globales**: No reinventes funcionalidades ya disponibles
3. **Sigue las convenciones**: Nombres descriptivos y consistentes
4. **Documenta cambios importantes**: Especialmente en archivos base
5. **Prueba en móvil**: Los estilos son responsive pero siempre verifica

## 🐛 Solución de Problemas

### Los estilos no se aplican:
- Verifica que la ruta del CSS sea correcta
- Asegúrate de que el archivo existe
- Revisa la consola del navegador por errores 404

### JavaScript no funciona:
- Verifica que los archivos JS se carguen correctamente
- Asegúrate de que las dependencias (jQuery, Bootstrap) se carguen primero
- Revisa la consola por errores de JavaScript

### Problemas de responsive:
- Los breakpoints principales están en 768px
- Verifica que uses las clases de Bootstrap correctamente
- Prueba en diferentes tamaños de pantalla