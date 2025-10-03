<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); response.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Establecer el título de la página --%>
<c:set var="pageTitle" value="Hola Mundo" scope="request" />

<%-- Incluir el layout principal --%>
<jsp:include page="layout.jsp">
    <jsp:param name="content" value="hola-simple-content.jsp" />
</jsp:include>