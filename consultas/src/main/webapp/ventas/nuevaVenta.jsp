<%-- 
    Document   : nuevaVenta
    Created on : 8 nov. 2023, 11:53:26
    Author     : PC_MACHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Venta</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
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
