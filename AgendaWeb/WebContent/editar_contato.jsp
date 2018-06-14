<%@page import="br.senai.sp.jandira.model.Contato"%>
<%@page import="br.senai.sp.jandira.dao.ContatoDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.senai.sp.jandira.model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	
	Usuario user = new Usuario();
	user = (Usuario) session.getAttribute("usuario"); 
	
		
	if(user == null){
		response.sendRedirect("login.html");
	} else {
		Contato c = new Contato();
		ContatoDao cDao = new ContatoDao();
		c = cDao.getContato(Integer.parseInt(request.getParameter("id")));
		
%>

		<!DOCTYPE html>
		<html>
			<head>
				<link rel="stylesheet" href="css/bootstrap.css"></link>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<title>Editar Contato</title>
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
							  		<li class="nav-item"><a href="#">Editar Contato</a></li>
							  	</ul>
							  </div>
							</div>
														
						</div>
						
						<div class="col-md-9">
							
							<div class="panel panel-warning">
							  <div class="panel-heading">
							  	
							  	<strong>
							  		<img src="imagens/menu24.png" style="height: 24px"> 
										Editar Contato
							  	</strong>

							  </div>
		
							  <div class="panel-body">
							  	
							  	<form method="post" action="GravarContato">
							  		
							  		<!-- Linha 1 -->
										<fieldset>
											<legend style="text-align: center;">Dados Gerais</legend>
											
											<div class="form-row">
											
												<div class="col-md-6 form-group">
													<input type="hidden" name="txtIdUsuario" value="<%= user.getId() %>"> 
													<label for="txtNome">Nome:</label>
													<input type="text" name="txtNome" class="form-control" value="<%=c.getNome()%>">
												</div>
			
			
												<div class="col-md-3 form-group">
													<label for="txtDtNasc">Dt. Nasc.:</label>
													<input type="date" name="txtDtNasc" class="form-control" value="<%=c.getDtNasc()%>">
												</div>
												
												<div class="col-md-3 form-group">
													<label for=cbSexo>Sexo:</label>
													<select name="cbSexo" class="form-control">
														<option value="s" <%= c.getSexo().equals("s")? "selected":"" %> >Selecione</option>
														<option value="m" <%= c.getSexo().equals("m")? "selected":"" %> >Masculino</option>
														<option value="f" <%= c.getSexo().equals("f")? "selected":"" %> >Feminino</option>
													</select>
												</div>
												
											</div>	
										</fieldset>
										<!-- Linha 2 -->
										<fieldset>
											<legend style="text-align: center;">Dados para Contato</legend>											
											<div class="form-row">
																			
												<div class="col-md-6 form-group">
													<label for="txtEmail">E-mail:</label>
													<input type="email" name="txtEmail" class="form-control" value="<%=c.getEmail()%>">
												</div>
												
												<div class="col-md-3 form-group">
													<label for="txtTelefone">Telefone:</label>
													<input type="text" name="txtTelefone" class="form-control" value="<%=c.getTelefone()%>">
												</div>
												
												<div class="col-md-3 form-group">
													<label for="txtCelular">Celular:</label>
													<input type="text" name="txtCelular" class="form-control" value="<%=c.getCelular()%>">
												</div>
											</div>
										</fieldset>
										<!-- Linha 3 -->
										<fieldset>
											<legend style="text-align: center;">Dados de Endereço</legend>
											<div class="form-row">
											
												<div class="col-md-8 form-group">
													<label for="txtLogradouro">Logradouro:</label>
													<input type="text" name="txtLogradouro" class="form-control" value="<%=c.getLogradouro()%>">
												</div>
												
												<div class="col-md-4 form-group">
													<label for="txtBairro">Bairro:</label>
													<input type="text" name="txtBairro" class="form-control" value="<%=c.getBairro()%>">
												</div>
											
											</div>
										</fieldset>
										<!-- Linha 4 -->
										<fieldset>
											<div class="form-row">
											
												<div class="col-md-4 form-group">
													<label for="txtCidade">Cidade:</label>
													<input type="text" name="txtCidade" class="form-control" value="<%=c.getCidade()%>">
												</div>
												
												<div class="col-md-4 form-group">
													<label for="txtEstado">Estado:</label>
													<input type="text" name="txtEstado" maxlength="2" class="form-control" value="<%=c.getEstado()%>">
												</div>
												
												<div class="col-md-4 form-group">
													<label for="txtCep">CEP:</label>
													<input type="text" name="txtCep" class="form-control" value="<%=c.getCep()%>">
												</div>
											
											</div>
										</fieldset>
										<hr>
										<div class="form-row">
											<div class="col-md-5"></div>
											<div class="col-md-7">
												<input type="submit" value="Criar usuário" class="btn btn-success">
												<input type="reset" value="Limpar formulário" class="btn btn-warning">
												<a href="index.jsp" class="btn btn-danger">Cancelar</a>
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