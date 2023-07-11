<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.lang.StringBuilder" %>
<html>
    <head>
        <title>Registro Exitoso-Usuario</title>
        <meta charset="UTF-8">
        <!--Referencia externa al css-->
        <link rel="stylesheet" href="general.css">
    </head>
    <body class="action">
        <img src="logoverde.png" class="biglogo">
        <%-- conseguir valores del formulario y asignarlo a una variable --%>
        <% 
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String edad = request.getParameter("edad");
        String contra = request.getParameter("contra");
        String usuario = request.getParameter("usuario");%>
        
        <%--conectar a la bd e insertar valores --%>
        <% Class.forName("com.mysql.jdbc.Driver");
        Connection dbconect= DriverManager.getConnection("jdbc:mysql://localhost:3310/proyectofinal","root","");
        Statement dbstatement=dbconect.createStatement();
        String insertarsql="INSERT INTO usuario VALUES ('"+nombre+"','"+apellido+"', '"+edad+"','"+contra+"','"+usuario+"')"; 
        dbstatement.executeUpdate(insertarsql);
        %>
        <br><h2>Registro exitoso. <br>Regrese al<a href="Home.html"> Inicio</a>.</h2>
    </body>
</html> 
<%-- --%>

.