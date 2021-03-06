package br.senai.sp.jandira.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.jandira.dao.UsuarioDao;
import br.senai.sp.jandira.model.Usuario;


@WebServlet("/GravarUsuario")
public class GravarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public GravarUsuario() {
        super();

    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario u = new Usuario();
		UsuarioDao uDao = new UsuarioDao();
		RequestDispatcher rd;
		
		u.setNome(request.getParameter("txtNome"));
		u.setCidade(request.getParameter("txtCidade"));
		u.setDtNasc(request.getParameter("txtDtNasc"));
		u.setEmail(request.getParameter("txtEmail"));
		u.setSenha(request.getParameter("txtSenha"));
		
		uDao.setUsuairo(u);
		
		if (uDao.gravar()){
			rd = request.getRequestDispatcher("sucesso.html");
			
		}
		else {
			rd = request.getRequestDispatcher("cadastro_usuario.html?erro=1");
		}
		rd.forward(request, response);
	}
}
