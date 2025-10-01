<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%
    /**
     * Página principal que redirige al usuario según su estado de sesión.
     * - Si el usuario ya ha iniciado sesión, se le redirige al dashboard.
     * - Si no ha iniciado sesión, se le redirige a la página de login.
     

    // Verificar si ya hay un usuario logueado
    String rol = (String) session.getAttribute("rol");

    if (rol != null) {
        // Si ya hay sesión, redirigir al dashboard
        response.sendRedirect("dashboard.jsp");
    } else {
        // Si no hay sesión, ir a login
        response.sendRedirect("login.jsp");
    }*/

    response.sendRedirect("dashboard.jsp");
%>