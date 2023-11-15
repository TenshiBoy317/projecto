<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Producto</title>
    <link rel="stylesheet" type="text/css" href="../css/productos/productos.css">
</head>
<body>
    <form action="../RegistroServlet" method="post">
        <h1 class="Producto">Registro de Producto</h1>
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" required>

        <label for="descripcion">Descripción:</label>
        <input type="text" name="descripcion" required>
        
        <label for="precio">Precio:</label>
        <input type="number" name="precio" step="0.01" required>

        <label for="marca">Marca:</label>
        <input type="text" name="marca" required>

        <label for="tipo">Tipo:</label>
        <input type="text" name="tipo" required>

        <br>
        <input type="submit" value="Registrar">
    </form>
</body>
</html>