<%-- 
    Document   : modificarVenta
    Created on : 8 nov. 2023, 12:07:46
    Author     : PC_MACHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
    <title>Editar Venta</title>
    <link rel="stylesheet" type="text/css" href="../css/editarcliente.css">
</head>
<body>
    <h1>Editar Venta</h1>
    <form action="guardarEdicion.jsp" method="post">
        <% 
        int id_venta = Integer.parseInt(request.getParameter("id_venta"));
        
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
            String consulta = "SELECT * FROM Clientes WHERE id_venta = " + id_venta;
            rs = stmt.executeQuery(consulta);
        %>
<% if (rs.next()) { %>
    <%
                int id_cliente = rs.getInt("id_cliente");
                String fecha_venta = rs.getString("fecha_venta");
                String total_venta = rs.getString("total_venta");
    %>
    <input type="number" name="id_venta" value="<%= id_venta %>">
    <label>id_venta</label>
    <input type="number" name="id_cliente" value="<%= id_cliente %>">
    <label>id_cliente</label>
    <input type="date" name="fecha_venta" value="<%= fecha_venta %>"><br>
    <label>fecha_venta</label>
    <input type="number" name="total_venta" value="<%= total_venta %>"><br>
    <label>total_venta</label>
<% } else { %>
    <p>No se encontró la venta con el ID especificado.</p>
<% } %>

<% 
        } catch (Exception e) {
            out.println("Error al editar la venta " + e.getMessage());
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
  <a href="listaVenta.jsp">Volver a la lista de ventas</a>
    <a href="index.jsp">Inicio</a>
    </form>
</body>
</html>
