<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario Cliente</title>
    <link rel="stylesheet" href="assets/css/estilos.css">
</head>
<body>
    <h1>Registrar Cliente</h1>
    <form action="clientes" method="post">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required>

        <label for="documento">Documento:</label>
        <input type="text" id="documento" name="documento" required>

        <label for="telefono">Teléfono:</label>
        <input type="text" id="telefono" name="telefono">

        <label for="direccion">Dirección:</label>
        <input type="text" id="direccion" name="direccion">

        <label for="correo">Correo:</label>
        <input type="email" id="correo" name="correo" required>

        <button type="submit">Registrar</button>
    </form>
</body>
</html>