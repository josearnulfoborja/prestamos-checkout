-- ================================================
-- BASE DE DATOS: SISTEMA DE GESTIÓN DE PRÉSTAMOS DE EQUIPOS
-- ================================================

-- Crear la base de datos
CREATE DATABASE prestamos_db;
USE prestamos_db;

-- ================================================
-- TABLA CLIENTE
-- ================================================
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    documento VARCHAR(50) NOT NULL UNIQUE,
    tipoDocumento ENUM('DUI', 'PASAPORTE', 'LICENCIA') DEFAULT 'DUI',
    telefono VARCHAR(15),
    direccion VARCHAR(255),
    correo VARCHAR(100) NOT NULL UNIQUE,
    fechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE
);



-- ================================================
-- TABLA ESPECIALISTA
-- ================================================
CREATE TABLE Especialista (
    idEspecialista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    certificaciones TEXT,
    disponibilidad BOOLEAN DEFAULT TRUE,
    fechaContratacion DATE,
    activo BOOLEAN DEFAULT TRUE
);

-- ================================================
-- TABLA EQUIPO
-- ================================================
CREATE TABLE Equipo (
    idEquipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    categoria VARCHAR(100),
    modelo VARCHAR(100),
    numeroSerie VARCHAR(100) UNIQUE,
    estado ENUM('DISPONIBLE', 'EN_PRESTAMO', 'MANTENIMIENTO', 'REPARACION') DEFAULT 'DISPONIBLE',
    costoDia DECIMAL(10, 2) NOT NULL,
    costoHora DECIMAL(10, 2) NOT NULL,
    requiereEspecialista BOOLEAN DEFAULT FALSE,
    fechaAdquisicion DATE,
    ultimoMantenimiento DATE,
    proximoMantenimiento DATE,
    ubicacion VARCHAR(100),
    activo BOOLEAN DEFAULT TRUE,
    fechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ================================================
-- TABLA USUARIO
-- ================================================
CREATE TABLE Usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nombre VARCHAR(100),
    correo VARCHAR(100) UNIQUE,
    rol ENUM('ADMIN','EVALUADOR','CLIENTE') NOT NULL,
    estado ENUM('ACTIVO','INACTIVO') DEFAULT 'ACTIVO',
    ultimoAcceso TIMESTAMP,
    intentos_fallidos INT DEFAULT 0,
    activo BOOLEAN DEFAULT TRUE,
    fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Usuario (
    ultimo_login DATETIME NULL,
    intentos_fallidos INT DEFAULT 0,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ================================================
-- TABLA PRESTAMO
-- ================================================
CREATE TABLE Prestamo (
    idPrestamo INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    idEquipo INT NOT NULL,
    idEspecialista INT,
    fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fechaEntrega DATE NOT NULL,
    fechaDevolucion DATE NOT NULL,
    fechaAprobacion TIMESTAMP NULL,
    deposito DECIMAL(10, 2) NOT NULL,
    costoTotal DECIMAL(10, 2) NOT NULL,
    tipoCobranza ENUM('POR_DIA', 'POR_HORA') DEFAULT 'POR_DIA',
    horasEstimadas INT,
    diasEstimados INT,
    estadoPrestamo ENUM('PENDIENTE', 'APROBADO', 'RECHAZADO', 'EN_CURSO', 'FINALIZADO') DEFAULT 'PENDIENTE',
    observaciones TEXT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idEquipo) REFERENCES Equipo(idEquipo),
    FOREIGN KEY (idEspecialista) REFERENCES Especialista(idEspecialista)
);

-- ================================================
-- TABLA EVALUACION TECNICA
-- ================================================
CREATE TABLE EvaluacionTecnica (
    idEvaluacion INT AUTO_INCREMENT PRIMARY KEY,
    idPrestamo INT NOT NULL,
    idUsuarioEvaluador INT NOT NULL,
    fechaEvaluacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    observaciones TEXT,
    requiereTransporte BOOLEAN DEFAULT FALSE,
    costoTransporte DECIMAL(10, 2) DEFAULT 0.00,
    requiereCapacitacion BOOLEAN DEFAULT FALSE,
    riesgosIdentificados TEXT,
    aprobado BOOLEAN NOT NULL,
    motivoRechazo TEXT,
    FOREIGN KEY (idPrestamo) REFERENCES Prestamo(idPrestamo),
    FOREIGN KEY (idUsuarioEvaluador) REFERENCES Usuario(idUsuario)
);

-- ================================================
-- TABLA MANTENIMIENTO
-- ================================================
CREATE TABLE Mantenimiento (
    idMantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    idEquipo INT NOT NULL,
    tipoMantenimiento ENUM('PREVENTIVO', 'CORRECTIVO', 'EMERGENCIA') NOT NULL,
    descripcion TEXT,
    costo DECIMAL(10, 2),
    fechaInicio DATE NOT NULL,
    fechaFin DATE,
    tecnicoResponsable VARCHAR(100),
    observaciones TEXT,
    realizado BOOLEAN DEFAULT FALSE,
    fechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idEquipo) REFERENCES Equipo(idEquipo)
);

-- ================================================
-- TABLA DOCUMENTO CLIENTE
-- ================================================
CREATE TABLE DocumentoCliente (
    idDocumento INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    tipoDocumento VARCHAR(50) NOT NULL,
    numeroDocumento VARCHAR(100) NOT NULL,
    fechaEmision DATE,
    fechaVencimiento DATE,
    rutaArchivo VARCHAR(255),
    activo BOOLEAN DEFAULT TRUE,
    fechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- ================================================
-- TABLA HISTORIAL (AUDITORIA)
-- ================================================
CREATE TABLE Historial (
    idHistorial INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    tabla VARCHAR(50) NOT NULL,
    idRegistro INT NOT NULL,
    accion ENUM('CREATE', 'UPDATE', 'DELETE', 'LOGIN', 'LOGOUT') NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    detalle TEXT,
    ipCliente VARCHAR(45),
    userAgent TEXT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

-- ================================================
-- VISTAS SQL PARA REPORTES
-- ================================================

-- Vista: Préstamos Activos
CREATE VIEW vw_prestamos_activos AS
SELECT 
    p.idPrestamo,
    c.nombre AS cliente,
    e.nombre AS equipo,
    p.fechaEntrega,
    p.fechaDevolucion,
    p.estadoPrestamo,
    p.costoTotal,
    DATEDIFF(p.fechaDevolucion, CURDATE()) AS diasRestantes
FROM Prestamo p
JOIN Cliente c ON p.idCliente = c.idCliente
JOIN Equipo e ON p.idEquipo = e.idEquipo
WHERE p.estadoPrestamo IN ('APROBADO', 'EN_CURSO');

-- Vista: Equipos Más Usados
CREATE VIEW vw_equipos_mas_usados AS
SELECT 
    e.idEquipo,
    e.nombre,
    e.categoria,
    COUNT(p.idPrestamo) AS totalPrestamos,
    SUM(p.costoTotal) AS ingresoTotal
FROM Equipo e
LEFT JOIN Prestamo p ON e.idEquipo = p.idEquipo
WHERE p.estadoPrestamo = 'FINALIZADO'
GROUP BY e.idEquipo, e.nombre, e.categoria
ORDER BY totalPrestamos DESC;

-- Vista: Préstamos por Estado
CREATE VIEW vw_prestamos_por_estado AS
SELECT 
    estadoPrestamo,
    COUNT(*) as cantidad,
    SUM(costoTotal) as montoTotal
FROM Prestamo 
GROUP BY estadoPrestamo;

-- ================================================
-- ÍNDICES PARA OPTIMIZACIÓN
-- ================================================
CREATE INDEX idx_prestamo_fechas ON Prestamo(fechaEntrega, fechaDevolucion);
CREATE INDEX idx_prestamo_estado ON Prestamo(estadoPrestamo);
CREATE INDEX idx_equipo_estado ON Equipo(estado);
CREATE INDEX idx_cliente_documento ON Cliente(documento);
CREATE INDEX idx_historial_fecha ON Historial(fecha);
CREATE INDEX idx_historial_usuario ON Historial(idUsuario, fecha);

-- ================================================
-- DATOS DE PRUEBA
-- ================================================

-- Insertar Usuarios
INSERT INTO Usuario (username, password, nombre, correo, rol) VALUES
('admin', '$2a$10$N9qo8uLOickgx2ZMRZoMye', 'Administrador Sistema', 'admin@prestaequipos.com', 'ADMIN'),
('evaluador1', '$2a$10$N9qo8uLOickgx2ZMRZoMye', 'María González', 'maria.gonzalez@prestaequipos.com', 'EVALUADOR'),
('cliente1', '$2a$10$N9qo8uLOickgx2ZMRZoMye', 'Carlos Ruiz', 'carlos.ruiz@email.com', 'CLIENTE');

-- Insertar Clientes
INSERT INTO Cliente (nombre, documento, tipoDocumento, telefono, direccion, correo) VALUES
('María González López', '12345678-9', 'DUI', '7123-4567', 'Col. Escalón, San Salvador', 'maria.gonzalez@email.com'),
('Carlos Eduardo Ruiz', '98765432-1', 'DUI', '7987-6543', 'Col. Miramonte, Santa Tecla', 'carlos.ruiz@email.com'),
('Ana Patricia López', '11223344-5', 'DUI', '7111-2233', 'Col. San Benito, San Salvador', 'ana.lopez@email.com'),
('José Antonio Martínez', '55667788-9', 'DUI', '7555-6677', 'Residencial Las Cumbres, Antiguo Cuscatlán', 'jose.martinez@email.com'),
('Sofía Isabel Hernández', '99887766-3', 'DUI', '7999-8877', 'Col. Centroamérica, San Salvador', 'sofia.hernandez@email.com');

-- Insertar Especialistas
INSERT INTO Especialista (nombre, especialidad, telefono, correo, certificaciones) VALUES
('Roberto García', 'Operador de Grúas', '7200-1234', 'roberto.garcia@prestaequipos.com', 'Certificación OSHA, Licencia Clase A'),
('Luis Fernando Morales', 'Técnico en Maquinaria Pesada', '7300-5678', 'luis.morales@prestaequipos.com', 'Certificación CAT, Técnico Mecánico');

-- Insertar Equipos
INSERT INTO Equipo (nombre, descripcion, categoria, modelo, numeroSerie, costoDia, costoHora, requiereEspecialista, ubicacion) VALUES
('Taladro Industrial HD-500', 'Taladro de percusión profesional para construcción', 'Herramientas Eléctricas', 'HD-500X', 'TAL001', 120.00, 15.00, FALSE, 'Bodega A-1'),
('Grúa Telescópica GT-25', 'Grúa móvil telescópica de 25 toneladas', 'Maquinaria Pesada', 'GT-25T', 'GRU001', 800.00, 100.00, TRUE, 'Patio Principal'),
('Sierra Circular SC-2000', 'Sierra circular de mesa para cortes de precisión', 'Herramientas Eléctricas', 'SC-2000Pro', 'SIE001', 90.00, 12.00, FALSE, 'Bodega A-2'),
('Compresor de Aire CA-100', 'Compresor de aire de 100 litros para herramientas neumáticas', 'Compresores', 'CA-100L', 'COM001', 60.00, 8.00, FALSE, 'Bodega B-1'),
('Soldadora MIG SM-300', 'Soldadora MIG profesional de 300 amperios', 'Soldadura', 'SM-300Pro', 'SOL001', 150.00, 20.00, TRUE, 'Taller Principal');

-- Insertar algunos préstamos de ejemplo
INSERT INTO Prestamo (idCliente, idEquipo, idEspecialista, fechaEntrega, fechaDevolucion, deposito, costoTotal, tipoCobranza, diasEstimados, estadoPrestamo) VALUES
(1, 1, NULL, '2025-10-05', '2025-10-10', 200.00, 600.00, 'POR_DIA', 5, 'PENDIENTE'),
(2, 2, 1, '2025-10-07', '2025-10-09', 1500.00, 1600.00, 'POR_DIA', 2, 'APROBADO'),
(3, 3, NULL, '2025-10-03', '2025-10-08', 150.00, 450.00, 'POR_DIA', 5, 'EN_CURSO');

-- ================================================
-- COMENTARIOS ADICIONALES
-- ================================================
/*
Esta base de datos incluye:

1. ENTIDADES PRINCIPALES:
   - Cliente (con documentos)
   - Equipo (con historial de mantenimiento)
   - Especialista (con certificaciones)
   - Usuario (para el sistema)
   - Prestamo (transacción principal)

2. ENTIDADES DE SOPORTE:
   - EvaluacionTecnica (proceso de aprobación)
   - Mantenimiento (gestión de equipos)
   - DocumentoCliente (respaldo documental)
   - Historial (auditoría completa)

3. VISTAS PARA REPORTES:
   - Préstamos activos
   - Equipos más utilizados
   - Distribución por estados

4. ÍNDICES para optimizar consultas frecuentes

5. DATOS DE PRUEBA para desarrollo y testing
*/