-- Crear la base de datos
CREATE DATABASE prestamos_db;
USE prestamos_db;

-- Tabla Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    documento VARCHAR(50) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    direccion VARCHAR(255),
    correo VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla Equipo
CREATE TABLE Equipo (
    idEquipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    estado ENUM('DISPONIBLE', 'EN_PRESTAMO', 'MANTENIMIENTO') DEFAULT 'DISPONIBLE',
    costoDia DECIMAL(10, 2) NOT NULL,
    costoHora DECIMAL(10, 2) NOT NULL,
    requiereEspecialista BOOLEAN DEFAULT FALSE
);

-- Tabla Especialista
CREATE TABLE Especialista (
    idEspecialista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    disponibilidad BOOLEAN DEFAULT TRUE
);

-- Tabla Prestamo
CREATE TABLE Prestamo (
    idPrestamo INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    idEquipo INT NOT NULL,
    idEspecialista INT,
    fechaEntrega DATE NOT NULL,
    fechaDevolucion DATE NOT NULL,
    deposito DECIMAL(10, 2) NOT NULL,
    costoTotal DECIMAL(10, 2) NOT NULL,
    estadoPrestamo ENUM('PENDIENTE', 'APROBADO', 'RECHAZADO', 'FINALIZADO') DEFAULT 'PENDIENTE',
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idEquipo) REFERENCES Equipo(idEquipo),
    FOREIGN KEY (idEspecialista) REFERENCES Especialista(idEspecialista)
);

-- Tabla EvaluacionTecnica
CREATE TABLE EvaluacionTecnica (
    idEvaluacion INT AUTO_INCREMENT PRIMARY KEY,
    idPrestamo INT NOT NULL,
    observaciones TEXT,
    aprobado BOOLEAN NOT NULL,
    FOREIGN KEY (idPrestamo) REFERENCES Prestamo(idPrestamo)
);

-- Tabla Usuario
CREATE TABLE Usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    rol ENUM('ADMIN', 'EVALUADOR', 'CLIENTE') NOT NULL
);

-- Tabla Historial
CREATE TABLE Historial (
    idHistorial INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT NOT NULL,
    accion VARCHAR(255) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    detalle TEXT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);