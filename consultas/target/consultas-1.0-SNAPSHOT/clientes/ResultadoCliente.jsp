<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resultado de la Búsqueda</title>
</head>
<body>
    <h1>Resultado de la Búsqueda</h1>
    <%
        String dni = request.getParameter("dni");

        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://157.90.212.15:3306/jmadesar_calzados";
            String usuario = "jmadesar_grupo2";
            String contraseña = "Huancayo2023";

            conn = DriverManager.getConnection(jdbcUrl, usuario, contraseña);

            String sql = "SELECT * FROM Clientes WHERE dni = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, dni);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String telefono = rs.getString("telefono");
                String direccion = rs.getString("direccion");
                String ciudad = rs.getString("ciudad");
                String codigo_postal = rs.getString("codigo_postal");
                String correo = rs.getString("correo_electronico"); // Agregar campo de correo electrónico

    %>
                <p><strong>DNI:</strong> <%= dni %></p>
                <p><strong>Nombre:</strong> <%= nombre %></p>
                <p><strong>Apellido:</strong> <%= apellido %></p>
                <p><strong>Teléfono:</strong> <%= telefono %></p>
                <p><strong>Dirección:</strong> <%= direccion %></p>
                <p><strong>Ciudad:</strong> <%= ciudad %></p>
                <p><strong>Código Postal:</strong> <%= codigo_postal %></p>
                <p><strong>Correo Electrónico:</strong> <%= correo %></p> <!-- Agregar campo de correo electrónico -->

    <%
            } else {
    %>
                <p>Cliente no encontrado.</p>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
    %>
            <p>Error al conectar a la base de datos.</p>
    <%
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
    <a href="index.jsp">Inicio</a>
</body>
</html>
