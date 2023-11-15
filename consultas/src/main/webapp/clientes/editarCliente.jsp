<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Cliente</title>
    <link rel="stylesheet" type="text/css" href="../css/editarcliente.css">
</head>
<body>
    <h1>Editar Cliente</h1>
    <form action="guardarEdicion.jsp" method="post">
        <% 
        int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
        
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
            String consulta = "SELECT * FROM Clientes WHERE id_cliente = " + id_cliente;
            rs = stmt.executeQuery(consulta);
        %>
<% if (rs.next()) { %>
    <%
    String nombre = rs.getString("nombre");
    String apellido = rs.getString("apellido");
    String dni = rs.getString("dni");
    String telefono = rs.getString("telefono");
    String direccion = rs.getString("direccion");
    String ciudad = rs.getString("ciudad");
    String codigo_postal = rs.getString("codigo_postal");
    String correo = rs.getString("correo_electronico"); // Agregar campo de correo electrónico
    %>
    <input type="hidden" name="id_cliente" value="<%= id_cliente %>">
    <label>Nombre:</label>
    <input type="text" name="nombre" value="<%= nombre %>"><br>
    <label>Apellido:</label>
    <input type="text" name="apellido" value="<%= apellido %>"><br>
    <label>DNI:</label>
    <input type="text" name="dni" value="<%= dni %>"><br>
    <label>Teléfono:</label>
    <input type="text" name="telefono" value="<%= telefono %>"><br>
    <label>Dirección:</label>
    <input type="text" name="direccion" value="<%= direccion %>"><br>
    <label>Ciudad:</label>
    <input type="text" name="ciudad" value="<%= ciudad %>"><br>
    <label>Código Postal:</label>
    <input type="text" name="codigo_postal" value="<%= codigo_postal %>"><br>
    <label>Correo Electrónico:</label>
    <input type="text" name="correo" value="<%= correo %>"><br> <!-- Campo de correo electrónico -->
    <input type="submit" value="Guardar Cambios">
<% } else { %>
    <p>No se encontró el cliente con el ID especificado.</p>
<% } %>

<% 
        } catch (Exception e) {
            out.println("Error al editar el cliente: " + e.getMessage());
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
  <a href="VerClientes.jsp">Volver a la lista de clientes</a>
    <a href="index.jsp">Inicio</a>
    </form>
</body>
</html>
