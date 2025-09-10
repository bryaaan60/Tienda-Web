<%@ page language="java" import="java.sql.*" %>

<%
   String url = "jdbc:mysql://localhost:3306/bd_prendas_tienda";
   String usuario = "root";
   String dbpassword = "12345";
   Connection conexion = null;

   try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      conexion = DriverManager.getConnection(url, usuario, dbpassword);
      request.setAttribute("conexion", conexion); 
   } catch(Exception e) {
      out.println("Error" + e.getMessage());
   }
%>