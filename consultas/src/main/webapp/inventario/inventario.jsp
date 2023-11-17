<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ver Productos</title>
    <link rel="stylesheet" type="text/css" href="../css/vercliente.css">
</head>
<body>
    <h1>Ver Productos</h1>
    <table border="1">
        <tr>
            <th>ID Producto</th>
            <th>Nombre</th>
            <th>Marca</th>
            <th>Descripción</th>
            <th>Tipo</th>
            <th>Precio</th>
            <th>Color</th>
            <th>Cantidad</th>
            <th>Talla</th>
        </tr>
        <% 
        // Configura la conexión a la base de datos (asegúrate de tener una conexión válida)
        String jdbcUrl = "jdbc:mysql://157.90.212.15:3306/jmadesar_calzados";
        String usuario = "jmadesar_grupo2";
        String contraseña = "Huancayo2023";
        
        Connection conexion = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(jdbcUrl, usuario, contraseña);
            
            stmt = conexion.createStatement();
            String consulta = "SELECT P.id_producto, P.nombre, P.marca, P.descripcion, P.tipo, P.precio, I.color, I.cantidad_disponible, I.talla " +
                              "FROM Productos P " +
                              "JOIN Inventario I ON P.id_producto = I.id_producto";
            rs = stmt.executeQuery(consulta);
            
            while (rs.next()) {
                int id_producto = rs.getInt("id_producto");
                String nombre = rs.getString("nombre");
                String marca = rs.getString("marca");
                String descripcion = rs.getString("descripcion");
                String tipo = rs.getString("tipo");
                double precio = rs.getDouble("precio");
                String color = rs.getString("color");
                int cantidad = rs.getInt("cantidad_disponible");
                String talla = rs.getString("talla");
        %>
        <tr>
            <td><%= id_producto %></td>
            <td><%= nombre %></td>
            <td><%= marca %></td>
            <td><%= descripcion %></td>
            <td><%= tipo %></td>
            <td><%= precio %></td>
            <td><%= color %></td>
            <td><%= cantidad %></td>
            <td><%= talla %></td>
        </tr>
        <%
            }
        } catch (Exception e) {
            out.println("Error al mostrar los productos: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
        %>
    </table>
    <a href="index.jsp">Inicio</a>
</body>
</html>
