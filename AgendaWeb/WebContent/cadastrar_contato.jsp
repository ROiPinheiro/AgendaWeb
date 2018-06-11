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
										Usuário
							  	</strong>
							  </div>
							  
							  <div class="panel-body">
							  	
							  	<p><strong>Usuário: </strong> <%= user.getNome() %>
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
							  		<li class="nav-item"><a href="#">Cadastrar Contato</a></li>
							  	</ul>
							  </div>
							</div>
														
						</div>
						
						<div class="col-md-9">
							
							<div class="panel panel-primary">
							  <div class="panel-heading">
							  	
							  	<strong>
							  		<img src="imagens/menu24.png" style="height: 24px"> 
										Cadastrar Contato
							  	</strong>

							  </div>
		
							  <div class="panel-body">
							  	
							  	<form method="post" action="GravarUsuario">
							  	
										<fieldset>
										
											<legend style="text-align: center;">Dados Gerais</legend>
											<!-- Linha 1 -->
											<div class="form-row">
											
												<div class="col-md-6 form-group">
													<label for="txtNome">Nome:</label>
													<input type="text" name="txtNome" class="form-control">
												</div>
			
			
												<div class="col-md-3 form-group">
													<label for="txtDtNasc">Dt. Nasc.:</label>
													<input type="date" name="txtDtNasc" class="form-control">
												</div>
												
												<div class="col-md-3 form-group">
													<label for=cbSexo>Sexo:</label>
													<select name="cbSexo" class="form-control">
														<option value="s">Selecione</option>
														<option value="m">Masculino</option>
														<option value="f">Feminino</option>
													</select>
												</div>
												
											</div>
											
										</fieldset>
										<fieldset>
											<legend style="text-align: center;">Dados para Contato</legend>
											
											<!-- Linha 2 -->
											<div class="form-row">
																			
												<div class="col-md-6 form-group">
													<label for="txtEmail">E-mail:</label>
													<input type="email" name="txtEmail" class="form-control">
												</div>
												
												<div class="col-md-3 form-group">
													<label for="txtTelefone">Telefone:</label>
													<input type="text" name="txtTelefone" class="form-control">
												</div>
												
												<div class="col-md-3 form-group">
													<label for="txtCelular">Celular:</label>
													<input type="text" name="txtCelular" class="form-control">
												</div>
											</div>
										
										</fieldset>
										<fieldset>
											<legend style="text-align: center;">Dados de Endereço</legend>
											
											<div class="form-row">
											
												<div class="col-md-8 form-group">
													<label for="txtLogradouro">Logradouro:</label>
													<input type="text" name="txtLogradouro" class="form-control">
												</div>
												
												<div class="col-md-4 form-group">
													<label for="txtBairro">Bairro:</label>
													<input type="text" name="txtBairro" class="form-control">
												</div>
											
											</div>
											
											<div class="form-row">
											
												<div class="col-md-4 form-group">
													<label for="txtCidade">Cidade:</label>
													<input type="text" name="txtCidade" class="form-control">
												</div>
												
												<div class="col-md-4 form-group">
													<label for="txtEstado">Estado:</label>
													<input type="text" name="txtEstado" class="form-control">
												</div>
												
												<div class="col-md-4 form-group">
													<label for="txtCep">CEP:</label>
													<input type="text" name="txtCep" class="form-control">
												</div>
											
											</div>
											
										</fieldset>
										<hr>
											<div class="form-row">
												<div class="col-md-5"></div>
												<div class="col-md-7">
													<input type="submit" value="Criar usuário" class="btn btn-success">
													<input type="reset" value="Limpar formulário" class="btn btn-warning">
													<a href="login.html" class="btn btn-danger">Cancelar</a>
												</div>
											</div>
										
									</form>
							  	

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