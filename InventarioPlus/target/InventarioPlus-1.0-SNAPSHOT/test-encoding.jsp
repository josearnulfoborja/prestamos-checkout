<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); response.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prueba de Codificación - PrestaEquipos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h3><i class="fas fa-check-circle"></i> Prueba de Caracteres Especiales</h3>
                    </div>
                    <div class="card-body">
                        <h4>Texto con caracteres especiales:</h4>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <strong>Vocales con tilde:</strong> á, é, í, ó, ú, Á, É, Í, Ó, Ú
                            </li>
                            <li class="list-group-item">
                                <strong>Letra ñ:</strong> ñ, Ñ - español, niño, año, señor
                            </li>
                            <li class="list-group-item">
                                <strong>Símbolos:</strong> © ® ™ € $ £ ¥ § ¿ ¡
                            </li>
                            <li class="list-group-item">
                                <strong>Frases de prueba:</strong>
                                <ul>
                                    <li>¿Cómo está funcionando la codificación?</li>
                                    <li>El niño español tiene 5 años.</li>
                                    <li>¡Excelente! Los préstamos están en revisión.</li>
                                    <li>Configuración de mantenimiento programado.</li>
                                    <li>Evaluación técnica realizada satisfactoriamente.</li>
                                </ul>
                            </li>
                        </ul>
                        
                        <div class="mt-4">
                            <h5>Contexto del Sistema:</h5>
                            <div class="alert alert-info">
                                <p><strong>Sistema de Gestión de Préstamos de Equipos</strong></p>
                                <p>Este sistema permite la administración eficiente de préstamos de equipos industriales, 
                                incluyendo evaluaciones técnicas, gestión de clientes, y seguimiento de pagos.</p>
                                <p><em>Características principales:</em></p>
                                <ul>
                                    <li>Gestión de clientes y especialistas</li>
                                    <li>Control de inventario de equipos</li>
                                    <li>Evaluaciones técnicas previas</li>
                                    <li>Cálculo automático de costos</li>
                                    <li>Historial de transacciones</li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="mt-3">
                            <a href="${pageContext.request.contextPath}/" class="btn btn-primary">
                                <i class="fas fa-home"></i> Volver al Inicio
                            </a>
                            <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-secondary">
                                <i class="fas fa-sign-in-alt"></i> Ir al Login
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
</body>
</html>