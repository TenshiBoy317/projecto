<%-- 
    Document   : procesarVenta
    Created on : 8 nov. 2023, 12:10:59
    Author     : PC_MACHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Procesando Formulario</title>
</head>
<body>
    <h1>Procesando Formulario</h1>
    <%
    // Parámetros del formulario
                int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
                String fecha_venta = request.getParameter("fecha_venta");
                String total_venta = request.getParameter("total_venta");
    
    // Configura la conexión a la base de datos (asegúrate de tener una conexión válida)
    String jdbcUrl = "jdbc:mysql://157.90.212.15:3306/jmadesar_calzados";
    String usuario = "jmadesar_grupo2";
    String contraseña = "Huancayo2023";
    
    Connection conexion = null;
    PreparedStatement stmt = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conexion = DriverManager.getConnection(jdbcUrl, usuario, contraseña);
        
        // Inserta los datos en la tabla de clientes
        String consulta = "INSERT INTO Ventas (id_cliente, fecha_venta, total_venta) VALUES (?, ?, ?)";
        stmt = conexion.prepareStatement(consulta);
        stmt.setInt(1, id_cliente);
        stmt.setString(2, fecha_venta);
        stmt.setString(3, total_venta);
        stmt.executeUpdate();
        
        out.println("Venta registrado exitosamente.");
    } catch (Exception e) {
        out.println("Error al procesar el formulario: " + e.getMessage());
    } finally {
        if (stmt != null) {
            stmt.close();
        }
        if (conexion != null) {
            conexion.close();
        }
    }
    %>
    <a href="index.jsp">Inicio</a>
</body>
</html>
