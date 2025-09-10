

<%@ page import="java.sql.*" %>
<%
    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");
    String contrasena = request.getParameter("contrasena");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_prendas_tienda", "root", "12345");

        String sql = "INSERT INTO usuarios (nombre, correo, contrasena) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, nombre);
        pstmt.setString(2, correo);
        pstmt.setString(3, contrasena); // ?? Aquí lo puedes mejorar con hash (BCrypt)

        pstmt.executeUpdate();

        // Redirigir a la página principal o mostrar mensaje
        response.sendRedirect("index.jsp?registro=ok");
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>

