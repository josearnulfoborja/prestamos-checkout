<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Esta página ahora será protegida por el AuthFilter
    // No necesitamos verificar sesión aquí manualmente
    
    // Configurar parámetros para el layout
    request.setAttribute("pageTitle", "Dashboard - Sistema de Préstamos");
    request.setAttribute("breadcrumb", "Dashboard");
    
    // Agregar CSS específico del dashboard
    request.setAttribute("additionalCSS", "dashboard.css");
%>

<jsp:include page="layout.jsp">
    <jsp:param name="content" value="dashboard-content.jsp" />
</jsp:include>
