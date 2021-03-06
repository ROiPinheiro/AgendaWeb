<%@page import="br.senai.sp.jandira.model.Contato"%>
<%@page import="br.senai.sp.jandira.dao.ContatoDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.senai.sp.jandira.model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
	SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

	ArrayList<Contato> listaContatos = new ArrayList();
	
	Usuario user = new Usuario();
	user = (Usuario) session.getAttribute("usuario"); 
		
	if(user == null){
		response.sendRedirect("login.html");
	} else {
		ContatoDao cDao = new ContatoDao();
		listaContatos = cDao.getContatos(user.getId());
		
%>

		<!DOCTYPE html>
		<html>
			<head>
				<link rel="stylesheet" href="css/bootstrap.css"></link>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
				<title>Resposta da Servlet</title>
			</head>
			<body>
			
				<header>
					<div class="navbar nav-bar-default">
						<div class="row">			
							<div class="col-md-12" style="text-align: center;">
								<h1 class="well">MiContatos</h1>
							</div>
						</div>
					</div>
				</header>
				
				<div class="container">
					<div class="row">
						<div class="col-md-3">
						
							<div class="panel panel-primary">
							  <div class="panel-heading">
							  	<strong>
							  		<img src="imagens/menu24.png" style="height: 24px"> 
										Usu�rio
							  	</strong>
							  </div>
							  
							  <div class="panel-body">
							  	
							  	<p><strong>Usu�rio: </strong> <%= user.getNome() %>
							  	<p><strong>Cidade: </strong> <%= user.getCidade() %>
							  	<p><strong>Dt. Nasc.: </strong> <%= user.getDtNasc() %> 
							  	
							  	<p> <a href="sair.jsp">Logout</a> </p>
							  </div>
							</div>
							
							<div class="panel panel-primary">
							  <div class="panel-heading">
							  	
							  	<strong>
							  		<img src="imagens/menu24.png" style="height: 24px"> 
										Menu
							  	</strong>

							  </div>
		
							  <div class="panel-body">
							  	<ul class="nav">
							  		<li class="nav-item"><a href="index.jsp">Home</a></li>
							  		<li class="nav-item"><a href="cadastrar_contato.jsp">Cadastrar Contato</a></li>
							  	</ul>
							  </div>
							</div>
														
						</div>
						
						<div class="col-md-9">
							
							<div class="panel panel-primary">
							  <div class="panel-heading">
							  	
							  	<strong>
							  		<img src="imagens/menu24.png" style="height: 24px"> 
										Meus Contatos
							  	</strong>

							  </div>
		
							  <div class="panel-body">
							  
							  	<table class="table table-hover">
							  		<thead>
							  			<tr>
							  				<th>ID</th>
							  				<th>Nome</th>
							  				<th>E-mail</th>
							  				<th></th>
							  				<th></th>
							  			</tr>
							  		
							  		</thead>
										
										<% for (Contato contato : listaContatos){ // cada linha do lista, criar um contato  %>
											<tr>
												<td><%= contato.getId() %></td>
												<td><%= contato.getNome() %></td>
												<td><%= contato.getEmail() %></td>
												<td>
													<a href="atualizar_contato.jsp?id=<%= contato.getId()%> ">
														<img src="imagens/userEdit32.png" style="height: 24px">
													</a>
												</td>
												<td>
													<a href="excluir_contato.jsp?id=<%= contato.getId() %> ">
														<img src="imagens/userDelete32.png" style="height: 24px">
													</a>
												</td>								
											</tr>									
										<% } %>
									</table>

							  </div>
							</div>
							
						</div>
					</div>
				</div>
				
				<div class="navbar navbar-default" style="background-color: gray; text-align: center;">
					<div class="row">
						<div class="col-md-12">
							<p style="color: white">&copy; ROP Software - 2018 </p>
						</div>
					</div>
				</div>
		
			</body>
		</html>

<% } %>