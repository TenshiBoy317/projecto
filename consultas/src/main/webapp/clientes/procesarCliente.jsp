<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String telefono = request.getParameter("telefono");
    String direccion = request.getParameter("direccion");
    String ciudad = request.getParameter("ciudad");
    String codigo_postal = request.getParameter("codigo_postal");
    String dni = request.getParameter("dni"); // Agregar campo de DNI
    String correo = request.getParameter("correo_electronico"); // Agregar campo de correo electrónico
    
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
        String consulta = "INSERT INTO Clientes (nombre, apellido, telefono, direccion, ciudad, codigo_postal, dni, correo_electronico) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        stmt = conexion.prepareStatement(consulta);
        stmt.setString(1, nombre);
        stmt.setString(2, apellido);
        stmt.setString(3, telefono);
        stmt.setString(4, direccion);
        stmt.setString(5, ciudad);
        stmt.setString(6, codigo_postal);
        stmt.setString(7, dni);
        stmt.setString(8, correo); // Agregar el campo de correo electrónico al PreparedStatement
        stmt.executeUpdate();
        
        out.println("Cliente registrado exitosamente.");
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
