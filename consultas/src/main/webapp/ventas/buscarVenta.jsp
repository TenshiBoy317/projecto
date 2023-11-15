<%-- 
    Document   : buscarVenta
    Created on : 8 nov. 2023, 12:07:18
    Author     : PC_MACHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscar Venta</title>
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
            padding: 50px;
            width: 500px;
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
            background-color: #45a034;
        }
    </style>
    </head>
<body>
    <h1>Buscar Venta por Fecha</h1>
    <form method="post" action="ResultadoCliente.jsp">
        <label for="fecha_venta">Fecha de Venta</label>
        <input type="date" name="fecha_venta">
        <input type="submit" value="Buscar">
    </form>
    <a href="index.jsp">Inicio</a>
</body>
</html>
