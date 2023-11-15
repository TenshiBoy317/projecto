<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Formulario de Cliente</title>
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
</head>
<body>
    <h1>Formulario de Cliente</h1>
    <form action="procesarCliente.jsp" method="post">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre"><br><br>
        
        <label for="apellido">Apellido:</label>
        <input type="text" id="apellido" name="apellido"><br><br>
        
        <label for="telefono">Teléfono:</label>
        <input type="text" id="telefono" name="telefono"><br><br>
        
        <label for="direccion">Dirección:</label>
        <input type="text" id="direccion" name="direccion"><br><br>
        
        <label for="ciudad">Ciudad:</label>
        <input type="text" id="ciudad" name="ciudad"><br><br>
        
        <label for="codigo_postal">Código Postal:</label>
        <input type="text" id="codigo_postal" name="codigo_postal"><br><br>
        
        <label for="dni">DNI:</label>
        <input type="text" id="dni" name="dni"><br><br>
        
        <label for="correo_electronico">Correo Electrónico:</label>
        <input type="text" id="correo_electronico" name="correo_electronico"><br><br>
        
        <input type="submit" value="Guardar">
    </form>
    <a href="index.jsp">Inicio</a>
</body>
</html>
