<!-- Cards de estadísticas - Sistema de Préstamos -->
<div class="row mb-4">
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2" style="border-left: 4px solid var(--primary-color);">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Préstamos Activos</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">23</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-handshake fa-2x text-primary"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2" style="border-left: 4px solid var(--success-color);">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Ingresos del Mes</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">$48,320</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-dollar-sign fa-2x text-success"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-warning shadow h-100 py-2" style="border-left: 4px solid var(--warning-color);">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Equipos en Mantenimiento</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">7</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-tools fa-2x text-warning"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-info shadow h-100 py-2" style="border-left: 4px solid var(--info-color);">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Total Equipos</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">142</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-cogs fa-2x text-info"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Row de gráficos -->
<div class="row">
    <!-- Gráfico de préstamos mensuales -->
    <div class="col-xl-8 col-lg-7">
        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Préstamos por Mes</h6>
                <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow">
                        <a class="dropdown-item" href="#">Ver detalles</a>
                        <a class="dropdown-item" href="#">Exportar reporte</a>
                        <a class="dropdown-item" href="#">Configurar alertas</a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="chart-area">
                    <canvas id="prestamosChart" width="100%" height="320"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Gráfico circular de estados de préstamos -->
    <div class="col-xl-4 col-lg-5">
        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Estados de Préstamos</h6>
            </div>
            <div class="card-body">
                <div class="chart-pie pt-4 pb-2">
                    <canvas id="estadosChart" width="100%" height="320"></canvas>
                </div>
                <div class="mt-4 text-center small">
                    <span class="mr-2">
                        <i class="fas fa-circle text-success"></i> Aprobados
                    </span>
                    <span class="mr-2">
                        <i class="fas fa-circle text-warning"></i> Pendientes
                    </span>
                    <span class="mr-2">
                        <i class="fas fa-circle text-danger"></i> Rechazados
                    </span>
                    <span class="mr-2">
                        <i class="fas fa-circle text-info"></i> Finalizados
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Row de equipos más solicitados y préstamos recientes -->
<div class="row">
    <!-- Tabla de equipos más solicitados -->
    <div class="col-xl-6 col-lg-6">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    <i class="fas fa-trophy"></i> Equipos Más Solicitados
                </h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Equipo</th>
                                <th>Préstamos</th>
                                <th>Ingresos</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <i class="fas fa-hammer text-primary"></i>
                                    <strong>Taladro Industrial HD-500</strong>
                                </td>
                                <td><span class="badge bg-primary">18</span></td>
                                <td>$2,340</td>
                                <td><span class="badge bg-success">Disponible</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <i class="fas fa-truck text-warning"></i>
                                    <strong>Grúa Telescópica GT-25</strong>
                                </td>
                                <td><span class="badge bg-primary">12</span></td>
                                <td>$8,400</td>
                                <td><span class="badge bg-info">En Préstamo</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <i class="fas fa-cut text-danger"></i>
                                    <strong>Sierra Circular SC-2000</strong>
                                </td>
                                <td><span class="badge bg-primary">15</span></td>
                                <td>$1,890</td>
                                <td><span class="badge bg-warning">Mantenimiento</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <i class="fas fa-cog text-info"></i>
                                    <strong>Compresor de Aire CA-100</strong>
                                </td>
                                <td><span class="badge bg-primary">10</span></td>
                                <td>$1,200</td>
                                <td><span class="badge bg-success">Disponible</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Tabla de préstamos recientes -->
    <div class="col-xl-6 col-lg-6">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    <i class="fas fa-clock"></i> Préstamos Recientes
                </h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Cliente</th>
                                <th>Equipo</th>
                                <th>Fecha Entrega</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>María González</td>
                                <td>Taladro Industrial</td>
                                <td>02/10/2025</td>
                                <td><span class="badge bg-warning">Pendiente</span></td>
                                <td>
                                    <button class="btn btn-sm btn-primary" title="Ver detalles">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                    <button class="btn btn-sm btn-success" title="Aprobar">
                                        <i class="fas fa-check"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>Carlos Ruiz</td>
                                <td>Grúa Telescópica</td>
                                <td>01/10/2025</td>
                                <td><span class="badge bg-success">Aprobado</span></td>
                                <td>
                                    <button class="btn btn-sm btn-primary" title="Ver detalles">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                    <button class="btn btn-sm btn-info" title="Entregar">
                                        <i class="fas fa-handshake"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>Ana López</td>
                                <td>Sierra Circular</td>
                                <td>30/09/2025</td>
                                <td><span class="badge bg-info">En Curso</span></td>
                                <td>
                                    <button class="btn btn-sm btn-primary" title="Ver detalles">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                    <button class="btn btn-sm btn-warning" title="Recibir">
                                        <i class="fas fa-undo"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>José Martínez</td>
                                <td>Compresor</td>
                                <td>29/09/2025</td>
                                <td><span class="badge bg-secondary">Finalizado</span></td>
                                <td>
                                    <button class="btn btn-sm btn-primary" title="Ver detalles">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                    <button class="btn btn-sm btn-success" title="Completado">
                                        <i class="fas fa-check-circle"></i>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Alertas y notificaciones -->
<div class="row">
    <div class="col-12">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    <i class="fas fa-bell"></i> Alertas y Notificaciones
                </h6>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <div class="alert alert-warning" role="alert">
                            <i class="fas fa-exclamation-triangle"></i>
                            <strong>¡Atención!</strong> 3 equipos requieren mantenimiento preventivo esta semana.
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="alert alert-info" role="alert">
                            <i class="fas fa-calendar-alt"></i>
                            <strong>Recordatorio:</strong> 5 préstamos vencen mañana.
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="alert alert-success" role="alert">
                            <i class="fas fa-chart-line"></i>
                            <strong>¡Excelente!</strong> Ingresos del mes superan la meta en 15%.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Scripts adicionales para los gráficos -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
// Gráfico de líneas para préstamos mensuales
const ctxPrestamos = document.getElementById('prestamosChart').getContext('2d');
const prestamosChart = new Chart(ctxPrestamos, {
    type: 'line',
    data: {
        labels: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
        datasets: [
            {
                label: 'Préstamos Solicitados',
                data: [45, 52, 38, 67, 73, 89, 95, 78, 85, 92, 88, 76],
                backgroundColor: 'rgba(13, 110, 253, 0.1)',
                borderColor: 'rgba(13, 110, 253, 1)',
                borderWidth: 3,
                fill: true,
                tension: 0.4
            },
            {
                label: 'Préstamos Aprobados',
                data: [38, 45, 32, 58, 65, 78, 82, 68, 75, 81, 76, 68],
                backgroundColor: 'rgba(25, 135, 84, 0.1)',
                borderColor: 'rgba(25, 135, 84, 1)',
                borderWidth: 3,
                fill: true,
                tension: 0.4
            }
        ]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            title: {
                display: true,
                text: 'Tendencia de Préstamos por Mes'
            }
        },
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    stepSize: 10
                }
            }
        },
        interaction: {
            intersect: false,
            mode: 'index'
        }
    }
});

// Gráfico circular para estados de préstamos
const ctxEstados = document.getElementById('estadosChart').getContext('2d');
const estadosChart = new Chart(ctxEstados, {
    type: 'doughnut',
    data: {
        labels: ['Aprobados', 'Pendientes', 'Rechazados', 'Finalizados'],
        datasets: [{
            data: [45, 23, 8, 67],
            backgroundColor: [
                'rgba(25, 135, 84, 0.8)',    // Verde para aprobados
                'rgba(255, 193, 7, 0.8)',    // Amarillo para pendientes
                'rgba(220, 53, 69, 0.8)',    // Rojo para rechazados
                'rgba(13, 202, 240, 0.8)'    // Azul para finalizados
            ],
            borderColor: [
                'rgba(25, 135, 84, 1)',
                'rgba(255, 193, 7, 1)',
                'rgba(220, 53, 69, 1)',
                'rgba(13, 202, 240, 1)'
            ],
            borderWidth: 2
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: {
                display: false
            },
            tooltip: {
                callbacks: {
                    label: function(context) {
                        const label = context.label;
                        const value = context.parsed;
                        const total = context.dataset.data.reduce((a, b) => a + b, 0);
                        const percentage = ((value / total) * 100).toFixed(1);
                        return `${label}: ${value} (${percentage}%)`;
                    }
                }
            }
        }
    }
});

// Funciones adicionales para el dashboard
function actualizarEstadisticas() {
    // Simular actualización de datos en tiempo real
    // En una implementación real, esto haría una llamada AJAX al servidor
    console.log('Actualizando estadísticas del dashboard...');
}

// Actualizar estadísticas cada 5 minutos
setInterval(actualizarEstadisticas, 300000);

// Función para filtrar datos por fecha
function filtrarPorFecha(periodo) {
    console.log('Filtrando datos por período:', periodo);
    // Aquí se implementaría la lógica para filtrar los gráficos
}

// Event listeners para interactividad
document.addEventListener('DOMContentLoaded', function() {
    // Agregar tooltips a los elementos
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
    
    console.log('Dashboard de Préstamos de Equipos cargado correctamente');
});
</script>