<%@ page import="java.sql.*" %>

<%
    String correo = request.getParameter("correo");
    String contrasena = request.getParameter("contrasena");

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_prendas_tienda", "root", "12345");

        String sql = "SELECT contrasena FROM usuarios WHERE correo = ?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, correo);
        rs = ps.executeQuery();

        if (rs.next()) {
            String storedPass = rs.getString("contrasena");

            if (contrasena.equals(storedPass)) {
                session.setAttribute("usuario", correo); // Guardamos sesión
                response.sendRedirect("index.jsp"); // Redirigir a inicio
            } else {
                out.println("<p style='color:red;'>Contraseña incorrecta</p>");
            }
        } else {
            out.println("<p style='color:red;'>Usuario no encontrado</p>");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch(Exception e){}
        if (ps != null) try { ps.close(); } catch(Exception e){}
        if (conn != null) try { conn.close(); } catch(Exception e){}
    }
%>
