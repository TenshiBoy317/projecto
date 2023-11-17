<%-- 
    Document   : nuevaVenta
    Created on : 8 nov. 2023, 11:53:26
    Author     : PC_MACHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Bienvenidos a AYELED</title>
    <link rel="stylesheet" type="text/css" href="../css/formulario.css">
    </head>
    </head>
    <body>
        <h1>Formulario de Venta</h1>
        <form action="index.jsp" method="post">
            <label for="id_venta">id_venta:</label>
            <input type="number" id="id_venta" name="id_venta">
            <br>
            <br>
            
            <label for="id_cliente">id_cliente:</label>
            <input type="number" id="id_cliente" name="id_cliente">
            <br>
            <br>
            
            <label for="fecha_venta">Fecha de Venta:</label>
            <input type="date" id="fecha_venta" name="fecha_venta">
            <br>
            <br>
            
            <label for="total_venta">Total de Venta:</label>
            <input type="number" id="total_venta" name="total_venta">
            <br>
            
            <input type="submit" value="Registrar">
        </form>
        
    </body>
</html>
