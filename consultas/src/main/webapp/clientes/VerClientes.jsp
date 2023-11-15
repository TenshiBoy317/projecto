<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ver Clientes</title>
    <link rel="stylesheet" type="text/css" href="../css/vercliente.css">
</head>
<body>
    <h1>Ver Clientes</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>DNI</th>
            <th>Teléfono</th>
            <th>Dirección</th>
            <th>Ciudad</th>
            <th>Código Postal</th>
            <th>Correo Electrónico</th> <!-- Agregar columna de Correo Electrónico -->
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
            String consulta = "SELECT * FROM Clientes";
            rs = stmt.executeQuery(consulta);
            
            while (rs.next()) {
                int id_cliente = rs.getInt("id_cliente");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String dni = rs.getString("dni");
                String telefono = rs.getString("telefono");
                String direccion = rs.getString("direccion");
                String ciudad = rs.getString("ciudad");
                String codigo_postal = rs.getString("codigo_postal");
                String correo = rs.getString("correo_electronico"); // Agregar columna de correo electrónico
        %>
        <tr>
            <td><%= id_cliente %></td>
            <td><%= nombre %></td>
            <td><%= apellido %></td>
            <td><%= dni %></td>
            <td><%= telefono %></td>
            <td><%= direccion %></td>
            <td><%= ciudad %></td>
            <td><%= codigo_postal %></td>
            <td><%= correo %></td> <!-- Mostrar el valor del correo electrónico -->
            
            <td>
                <form action="eliminarCliente.jsp" method="post">
                    <input type="hidden" name="id_cliente" value="<%= id_cliente %>">
                    <input type="submit" value="Eliminar">
                </form>
                <form action="editarCliente.jsp" method="post">
                    <input type="hidden" name="id_cliente" value="<%= id_cliente %>">
                    <input type="submit" value="Editar">
                </form>
            </td>
        </tr>
        <%
            }
        } catch (Exception e) {
            out.println("Error al mostrar los clientes: " + e.getMessage());
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
