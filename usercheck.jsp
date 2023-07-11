<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.lang.StringBuilder" %>
<html>
    <head>
        <title>Check-Usuario</title>
        <meta charset="UTF-8">
        <!--Referencia externa al css-->
        <link rel="stylesheet" href="general.css">
    </head>
    <body class="action">
        <img src="logoverde.png" class="biglogo">
        <%-- conseguir valores del formulario y asignarlo a una variable --%>
        <% 
        String contra = request.getParameter("contra");
        String usuario = request.getParameter("usuario");%>
        
        <%--conectar a la bd--%>
        <% Class.forName("com.mysql.jdbc.Driver");
        Connection dbconect= DriverManager.getConnection("jdbc:mysql://localhost:3310/proyectofinal","root","");
        try{
        PreparedStatement consultaP=dbconect.prepareStatement("SELECT * FROM usuario WHERE u_usuario=? AND u_contra=?");
        consultaP.setString(1,usuario);
        consultaP.setString(2,contra);
        ResultSet resultado = consultaP.executeQuery();
        
        String rutaDeDestino1 = "Home.html"; 
        String rutaDeDestino2 = "Registro-Usuarios.html"; 

        if(resultado.next())
            out.print("<h2>Usuario correcto. <a href=\"" + rutaDeDestino1 + "\">Inicio</a>.</h2>");
        else 
            out.print("<h2>Error de login, usuario o contraseña incorrecta. <a href=\"" + rutaDeDestino2 + "\">Inicio</a>.</h2>");
        } 
        catch (Exception e)
        {
        	out.println("Error");
        	out.println("Consulta inválida.");
        }
        %>
    </body>
</html> 
