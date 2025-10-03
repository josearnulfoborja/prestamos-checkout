<!-- Contenido de la página Hola Mundo -->
<div class="container-fluid">
    <!-- Encabezado de bienvenida -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="jumbotron bg-primary text-white rounded p-5">
                <h1 class="display-4">
                    <i class="fas fa-rocket text-warning"></i>
                    ¡Hola Mundo!
                </h1>
                <p class="lead">Esta es una página de prueba para verificar que el layout funciona correctamente.</p>
                <hr class="my-4" style="border-color: rgba(255,255,255,0.3);">
                <p>Sistema de Gestión de Préstamos de Equipos - <strong>PrestaEquipos</strong></p>
                <p class="mb-0">
                    <i class="fas fa-calendar-alt"></i>
                    Fecha actual: <strong>2 de octubre de 2025</strong>
                </p>
            </div>
        </div>
    </div>

    <!-- Cards de información -->
    <div class="row mb-4">
        <div class="col-md-4">
            <div class="card border-primary h-100">
                <div class="card-header bg-primary text-white">
                    <i class="fas fa-check-circle"></i> Layout Funcionando
                </div>
                <div class="card-body">
                    <h5 class="card-title">✅ Header</h5>
                    <p class="card-text">El header con navegación superior se muestra correctamente.</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card border-success h-100">
                <div class="card-header bg-success text-white">
                    <i class="fas fa-bars"></i> Sidebar Activo
                </div>
                <div class="card-body">
                    <h5 class="card-title">✅ Menú Lateral</h5>
                    <p class="card-text">El sidebar con todas las opciones del sistema está visible.</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card border-info h-100">
                <div class="card-header bg-info text-white">
                    <i class="fas fa-paint-brush"></i> Estilos CSS
                </div>
                <div class="card-body">
                    <h5 class="card-title">✅ Bootstrap + CSS</h5>
                    <p class="card-text">Los estilos personalizados y Bootstrap están cargando bien.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Sección de prueba de caracteres especiales -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fas fa-language text-primary"></i>
                        Prueba de Caracteres Especiales
                    </h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <h6>Textos con tildes y ñ:</h6>
                            <ul class="list-unstyled">
                                <li><i class="fas fa-arrow-right text-success"></i> Gestión</li>
                                <li><i class="fas fa-arrow-right text-success"></i> Préstamos</li>
                                <li><i class="fas fa-arrow-right text-success"></i> Evaluación</li>
                                <li><i class="fas fa-arrow-right text-success"></i> Configuración</li>
                                <li><i class="fas fa-arrow-right text-success"></i> Español</li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <h6>Símbolos especiales:</h6>
                            <ul class="list-unstyled">
                                <li><i class="fas fa-arrow-right text-info"></i> ¿Funciona correctamente?</li>
                                <li><i class="fas fa-arrow-right text-info"></i> ¡Excelente resultado!</li>
                                <li><i class="fas fa-arrow-right text-info"></i> Años: 2024, 2025</li>
                                <li><i class="fas fa-arrow-right text-info"></i> Niños y niñas</li>
                                <li><i class="fas fa-arrow-right text-info"></i> Diseño y programación</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Botones de acción -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card bg-light">
                <div class="card-body text-center">
                    <h5>Navegación de Prueba</h5>
                    <p class="text-muted">Puedes probar los siguientes enlaces para verificar la navegación:</p>
                    <div class="btn-group" role="group">
                        <a href="${pageContext.request.contextPath}/" class="btn btn-primary">
                            <i class="fas fa-home"></i> Inicio
                        </a>
                        <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-secondary">
                            <i class="fas fa-sign-in-alt"></i> Login
                        </a>
                        <a href="${pageContext.request.contextPath}/test-encoding.jsp" class="btn btn-info">
                            <i class="fas fa-font"></i> Test Encoding
                        </a>
                        <button type="button" class="btn btn-success" onclick="mostrarAlerta()">
                            <i class="fas fa-bell"></i> Probar JS
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Información del sistema -->
    <div class="row">
        <div class="col-12">
            <div class="alert alert-info" role="alert">
                <h6 class="alert-heading">
                    <i class="fas fa-info-circle"></i> Información del Sistema
                </h6>
                <p><strong>Proyecto:</strong> Sistema de Gestión de Préstamos de Equipos</p>
                <p><strong>Framework:</strong> Jakarta EE 10.0.0 + Bootstrap 5.3.2</p>
                <p><strong>Servidor:</strong> Apache Tomcat 10+</p>
                <p><strong>Base de Datos:</strong> MySQL</p>
                <p class="mb-0"><strong>Estado:</strong> <span class="badge bg-success">Layout Funcionando Correctamente</span></p>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript personalizado para pruebas -->
<script>
function mostrarAlerta() {
    alert('¡Hola Mundo! 🌍\n\nEl JavaScript está funcionando correctamente.\n\nCaracteres especiales: ñ, á, é, í, ó, ú');
}

// Mostrar mensaje en consola
console.log('Página Hola Mundo cargada correctamente ✅');
console.log('Caracteres especiales funcionando: ñ, tildes (á,é,í,ó,ú), símbolos (¿,¡)');
</script>