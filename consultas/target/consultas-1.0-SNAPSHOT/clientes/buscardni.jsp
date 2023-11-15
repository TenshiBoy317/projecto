<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Buscar Cliente por DNI</title>
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
</head>
<style>
    h1{
        background-color: red;
        width: 400px;
        height: 50px
    }
</style>
<body>
    <h1>Buscar Cliente por DNI</h1>
    <form method="post" action="ResultadoCliente.jsp">
        <label for="dni">DNI del Cliente:</label>
        <input type="text" name="dni">
        <input type="submit" value="Buscar">
    </form>
    <a href="index.jsp">Inicio</a>
</body>
</html>
