<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); response.setCharacterEncoding("UTF-8"); %>
<%
    /**
     * Página principal - Redirige a la página de prueba Hola Mundo
     * para verificar que el layout funciona correctamente.
     * 
     * Cuando el sistema esté completo, aquí se implementará:
     * - Verificación de sesión de usuario
     * - Redirección a dashboard si está logueado
     * - Redirección a login si no hay sesión
     */
    
    // Por ahora, redirigir directamente a la página de prueba
    response.sendRedirect("hola-mundo.jsp");
%>