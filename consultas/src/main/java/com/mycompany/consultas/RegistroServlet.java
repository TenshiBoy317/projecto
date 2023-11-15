package com.mycompany.consultas;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            double precio = Double.parseDouble(request.getParameter("precio"));
            String marca = request.getParameter("marca");
            String tipo = request.getParameter("tipo");

            Connection con = null;
            PreparedStatement ps = null;
            
            String url = "jdbc:mysql://157.90.212.15:3306/jmadesar_calzados?zeroDateTimeBehavior=CONVERT_TO_NULL";
            String user = "jmadesar_grupo2";
            String password = "Huancayo2023";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, user, password);
                String query = "INSERT INTO Productos (nombre, descripcion, precio, marca, tipo) VALUES (?, ?, ?, ?, ?)";
                ps = con.prepareStatement(query);
                ps.setString(1, nombre);
                ps.setString(2, descripcion);
                ps.setDouble(3, precio);
                ps.setString(4, marca);
                ps.setString(5, tipo);
                ps.executeUpdate();
                out.println("Producto registrado con éxito");
            } catch (Exception e) {
                out.println("Error al registrar Producto: " + e.getMessage());
            } finally {
                try {
                    if (ps != null) {
                        ps.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException e) {
                    out.println("Error al cerrar la conexión: " + e.getMessage());
                }
            }
        }
    }
}
