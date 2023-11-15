<%-- 
    Document   : listaVentas
    Created on : 8 nov. 2023, 12:06:18
    Author     : PC_MACHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<head>
    <title>Ver Clientes</title>
    <link rel="stylesheet" type="text/css" href="../css/vercliente.css">
</head>
<body>
    <h1>Ver Lista de Venta</h1>
    <table border="1">
        <tr>
            <th>id_venta</th>
            <th>id_cliente</th>
            <th>Fecha Venta</th>
            <th>Total Venta</th>
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
            String consulta = "SELECT * FROM Ventas";
            rs = stmt.executeQuery(consulta);
            
            while (rs.next()) {
                int id_venta = rs.getInt("id_venta");
                int id_cliente = rs.getInt("id_cliente");
                String fecha_venta = rs.getString("fecha_venta");
                String total_venta = rs.getString("total_venta");
  
        %>
        <tr>
            <td><%= id_venta %></td>
            <td><%= id_cliente %></td>
            <td><%= fecha_venta %></td>
            <td><%= total_venta %></td>
            
            <td>
                <form action="eliminarCliente.jsp" method="post">
                    <input type="hidden" name="id_venta" value="<%= id_venta %>">
                    <input type="submit" value="Eliminar">
                </form>
                <form action="editarCliente.jsp" method="post">
                    <input type="hidden" name="id_venta" value="<%= id_venta %>">
                    <input type="submit" value="Editar">
                </form>
            </td>
        </tr>
        <%
            }
        } catch (Exception e) {
            out.println("Error al mostrar las ventas " + e.getMessage());
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
