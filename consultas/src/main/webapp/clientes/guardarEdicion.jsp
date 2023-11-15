<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Guardar Edición</title>
</head>
<body>
    <h1>Guardar Edición</h1>
    <%
    int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String telefono = request.getParameter("telefono");
    String direccion = request.getParameter("direccion");
    String ciudad = request.getParameter("ciudad");
    String codigo_postal = request.getParameter("codigo_postal");
    String dni = request.getParameter("dni");
    String correo = request.getParameter("correo_electronico"); // Agregar campo de correo electrónico
    
    // Configura la conexión a la base de datos (asegúrate de tener una conexión válida)
    String jdbcUrl = "jdbc:mysql://157.90.212.15:3306/jmadesar_calzados";
    String usuario = "jmadesar_grupo2";
    String contraseña = "Huancayo2023";
    
    Connection conexion = null;
    PreparedStatement pstmt = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conexion = DriverManager.getConnection(jdbcUrl, usuario, contraseña);
        
        String consulta = "UPDATE Clientes SET nombre=?, apellido=?, telefono=?, direccion=?, ciudad=?, codigo_postal=?, dni=?, correo_electronico=? WHERE id_cliente=?";
        pstmt = conexion.prepareStatement(consulta);
        pstmt.setString(1, nombre);
        pstmt.setString(2, apellido);
        pstmt.setString(3, telefono);
        pstmt.setString(4, direccion);
        pstmt.setString(5, ciudad);
        pstmt.setString(6, codigo_postal);
        pstmt.setString(7, dni);
        pstmt.setString(8, correo); // Agregar el correo electrónico al PreparedStatement
        pstmt.setInt(9, id_cliente);
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
