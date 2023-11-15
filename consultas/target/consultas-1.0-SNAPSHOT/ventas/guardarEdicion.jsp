<%-- 
    Document   : guardarEdicion
    Created on : 13 nov. 2023, 12:18:28
    Author     : PC_MACHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
    <title>Guardar Edición</title>
</head>
<body>
    <h1>Guardar Edición</h1>
    <%
                int id_venta = Integer.parseInt(request.getParameter("id_venta"));
                int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
                String fecha_venta = request.getParameter("fecha_venta");
                String total_venta = request.getParameter("total_venta");
    
    // Configura la conexión a la base de datos (asegúrate de tener una conexión válida)
    String jdbcUrl = "jdbc:mysql://157.90.212.15:3306/jmadesar_calzados";
    String usuario = "jmadesar_grupo2";
    String contraseña = "Huancayo2023";
    
    Connection conexion = null;
    PreparedStatement pstmt = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conexion = DriverManager.getConnection(jdbcUrl, usuario, contraseña);
        
        String consulta = "UPDATE Clientes SET id_venta=?, fecha_venta=?, total_venta=? WHERE id_venta=?";
        pstmt = conexion.prepareStatement(consulta);
        pstmt.setInt(1, id_cliente);
        pstmt.setString(2, fecha_venta);
        pstmt.setString(3, total_venta);
        pstmt.setInt(4, id_venta);
        int filasActualizadas = pstmt.executeUpdate();
    %>
    <p>Los cambios han sido guardados exitosamente.</p>
    <%
    } catch (Exception e) {
        out.println("Error al guardar los cambios: " + e.getMessage());
    } finally {
        if (pstmt != null) {
            pstmt.close();
        }
        if (conexion != null) {
            conexion.close();
        }
    }
    %>
    <a href="index.jsp">Inicio</a>
</body>
</html>
