<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Establecer parámetros para la plantilla -->
<c:set var="pageTitle" value="Gestión de Productos" />
<c:set var="currentPage" value="productos" />

<!-- Incluir la plantilla layout -->
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="${pageTitle}" />
    <jsp:param name="page" value="${currentPage}" />
</jsp:include>

<!-- Contenido específico de la página Productos -->
<div id="page-content">
    <!-- Botones de acción -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <button class="btn btn-primary">
                <i class="fas fa-plus me-2"></i>Nuevo Producto
            </button>
            <button class="btn btn-success">
                <i class="fas fa-download me-2"></i>Exportar
            </button>
        </div>
        <div class="input-group" style="width: 300px;">
            <input type="text" class="form-control" placeholder="Buscar productos...">
            <button class="btn btn-outline-secondary" type="button">
                <i class="fas fa-search"></i>
            </button>
        </div>
    </div>

    <!-- Filtros -->
    <div class="card mb-4">
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <label class="form-label">Categoría</label>
                    <select class="form-select">
                        <option value="">Todas las categorías</option>
                        <option value="electronico">Electrónicos</option>
                        <option value="ropa">Ropa</option>
                        <option value="hogar">Hogar</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Estado</label>
                    <select class="form-select">
                        <option value="">Todos</option>
                        <option value="activo">Activo</option>
                        <option value="inactivo">Inactivo</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Stock</label>
                    <select class="form-select">
                        <option value="">Todos</option>
                        <option value="bajo">Stock Bajo</option>
                        <option value="disponible">Disponible</option>
                        <option value="agotado">Agotado</option>
                    </select>
                </div>
                <div class="col-md-3 d-flex align-items-end">
                    <button class="btn btn-outline-primary me-2">Filtrar</button>
                    <button class="btn btn-outline-secondary">Limpiar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Tabla de productos -->
    <div class="card shadow">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h6 class="m-0 font-weight-bold text-primary">Lista de Productos</h6>
            <span class="badge bg-primary">Total: 156 productos</span>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead class="table-light">
                        <tr>
                            <th>
                                <input class="form-check-input" type="checkbox" id="selectAll">
                            </th>
                            <th>Imagen</th>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Categoría</th>
                            <th>Stock</th>
                            <th>Precio</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input class="form-check-input" type="checkbox">
                            </td>
                            <td>
                                <img src="https://via.placeholder.com/50x50" alt="Producto" class="rounded">
                            </td>
                            <td><strong>P001</strong></td>
                            <td>
                                <div>
                                    <strong>Laptop Dell XPS 13</strong>
                                    <br>
                                    <small class="text-muted">Intel Core i7, 16GB RAM</small>
                                </div>
                            </td>
                            <td><span class="badge bg-info">Electrónicos</span></td>
                            <td>
                                <span class="badge bg-success">25 unidades</span>
                            </td>
                            <td><strong>$899.99</strong></td>
                            <td>
                                <span class="badge bg-success">Activo</span>
                            </td>
                            <td>
                                <div class="btn-group" role="group">
                                    <button class="btn btn-sm btn-outline-primary" title="Ver">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                    <button class="btn btn-sm btn-outline-warning" title="Editar">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-outline-danger" title="Eliminar">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="form-check-input" type="checkbox">
                            </td>
                            <td>
                                <img src="https://via.placeholder.com/50x50" alt="Producto" class="rounded">
                            </td>
                            <td><strong>P002</strong></td>
                            <td>
                                <div>
                                    <strong>Camiseta Nike Dri-FIT</strong>
                                    <br>
                                    <small class="text-muted">Talla M, Color Azul</small>
                                </div>
                            </td>
                            <td><span class="badge bg-secondary">Ropa</span></td>
                            <td>
                                <span class="badge bg-warning">5 unidades</span>
                            </td>
                            <td><strong>$29.99</strong></td>
                            <td>
                                <span class="badge bg-success">Activo</span>
                            </td>
                            <td>
                                <div class="btn-group" role="group">
                                    <button class="btn btn-sm btn-outline-primary" title="Ver">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                    <button class="btn btn-sm btn-outline-warning" title="Editar">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-outline-danger" title="Eliminar">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="form-check-input" type="checkbox">
                            </td>
                            <td>
                                <img src="https://via.placeholder.com/50x50" alt="Producto" class="rounded">
                            </td>
                            <td><strong>P003</strong></td>
                            <td>
                                <div>
                                    <strong>Mesa de Centro Moderna</strong>
                                    <br>
                                    <small class="text-muted">Madera de roble, 120x60cm</small>
                                </div>
                            </td>
                            <td><span class="badge bg-warning">Hogar</span></td>
                            <td>
                                <span class="badge bg-danger">2 unidades</span>
                            </td>
                            <td><strong>$149.99</strong></td>
                            <td>
                                <span class="badge bg-success">Activo</span>
                            </td>
                            <td>
                                <div class="btn-group" role="group">
                                    <button class="btn btn-sm btn-outline-primary" title="Ver">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                    <button class="btn btn-sm btn-outline-warning" title="Editar">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-outline-danger" title="Eliminar">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <!-- Paginación -->
            <nav aria-label="Paginación de productos">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Anterior</a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Siguiente</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<script>
// Funcionalidad del checkbox "Seleccionar todo"
document.getElementById('selectAll').addEventListener('change', function() {
    const checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
    checkboxes.forEach(checkbox => {
        checkbox.checked = this.checked;
    });
});
</script>