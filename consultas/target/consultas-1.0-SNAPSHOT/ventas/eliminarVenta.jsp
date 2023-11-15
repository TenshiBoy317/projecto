<%-- 
    Document   : eliminarVenta
    Created on : 8 nov. 2023, 12:08:02
    Author     : PC_MACHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Venta</title>
    </head>
<body>
    <h1>Eliminar Venta</h1>
    <% 
    int id_venta = Integer.parseInt(request.getParameter("id_venta"));
    
    // Configura la conexión a la base de datos (asegúrate de tener una conexión válida)
    String jdbcUrl = "jdbc:mysql://157.90.212.15:3306/jmadesar_calzados";
    String usuario = "jmadesar_grupo2";
    String contraseña = "Huancayo2023";
    
    Connection conexion = null;
    PreparedStatement stmt = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conexion = DriverManager.getConnection(jdbcUrl, usuario, contraseña);
        
        // Elimina el cliente de la base de datos
        String consulta = "DELETE FROM Clientes WHERE id_venta = ?";
        stmt = conexion.prepareStatement(consulta);
        stmt.setInt(1, id_venta);
        stmt.executeUpdate();
        
        out.println("Venta eliminado correctamente.");
    } catch (Exception e) {
        out.println("Error al eliminar la venta " + e.getMessage());
    } finally {
        if (stmt != null) {
            stmt.close();
        }
        if (conexion != null) {
            conexion.close();
        }
    }
    %>
    <br>
    <a href="listaVenta.jsp">Volver a la lista de clientes</a>
    <a href="index.jsp">Inicio</a>
</body>
</html>
