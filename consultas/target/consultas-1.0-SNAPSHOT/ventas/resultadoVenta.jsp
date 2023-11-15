<%-- 
    Document   : resultadoVenta
    Created on : 13 nov. 2023, 14:24:34
    Author     : PC_MACHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
    <title>Resultado de la Búsqueda</title>
</head>
<body>
    <h1>Resultado de la Búsqueda</h1>
    <%
        String fecha_venta = request.getParameter("fecha_venta");

        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://157.90.212.15:3306/jmadesar_calzados";
            String usuario = "jmadesar_grupo2";
            String contraseña = "Huancayo2023";

            conn = DriverManager.getConnection(jdbcUrl, usuario, contraseña);

            String sql = "SELECT * FROM Ventas WHERE fecha_venta = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, fecha_venta);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int id_venta = rs.getInt("id_venta");
                int id_cliente = rs.getInt("id_cliente");
                String total_venta = rs.getString("total_venta");

    %>
                <p><strong>id_venta</strong> <%= id_venta %></p>
                <p><strong>id_cliente</strong> <%= id_cliente %></p>
                <p><strong>fecha_venta</strong> <%= fecha_venta %></p>
                <p><strong>total_venta</strong> <%= total_venta %></p>

    <%
            } else {
    %>
                <p>Venta no encontrado.</p>
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
