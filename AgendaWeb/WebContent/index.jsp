<%@page import="br.senai.sp.jandira.model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
	
	Usuario user = new Usuario();
	user = (Usuario) session.getAttribute("usuario"); 
		
	if(user == null){
		response.sendRedirect("login.html");
	} else {
%>

		<!DOCTYPE html>
		<html>
			<head>
				<link rel="stylesheet" href="css/bootstrap.css"></link>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
				<title>Resposta da Servlet</title>
			</head>
			<body>
			
				<h1>Resultado:</h1>
				<h3>E-mail: <%= user.getEmail() %></h3>
				<h3>Senha: <%= user.getSenha() %></h3>
				<h3>Nome: <%= user.getNome() %></h3>
		
			</body>
		</html>

<% } %>