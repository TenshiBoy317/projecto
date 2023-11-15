<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Eliminar Cliente</title>
</head>
<body>
    <h1>Eliminar Cliente</h1>
    <% 
    int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
    
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
        String consulta = "DELETE FROM Clientes WHERE id_cliente = ?";
        stmt = conexion.prepareStatement(consulta);
        stmt.setInt(1, id_cliente);
        stmt.executeUpdate();
        
        out.println("Cliente eliminado correctamente.");
    } catch (Exception e) {
        out.println("Error al eliminar el cliente: " + e.getMessage());
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
    <a href="VerClientes.jsp">Volver a la lista de clientes</a>
    <a href="index.jsp">Inicio</a>
</body>
</html>
