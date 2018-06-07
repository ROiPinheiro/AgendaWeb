package br.senai.sp.jandira.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.senai.sp.jandira.dao.UsuarioDao;
import br.senai.sp.jandira.model.Usuario;

@WebServlet("/Autentica")
public class Autentica extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Autentica() {
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("txtEmail");
		String senha = request.getParameter("txtSenha");
		
		HttpSession session = null;
		
		UsuarioDao uDao = new UsuarioDao();
		Usuario usuario = new Usuario();
		
		RequestDispatcher rd;
		
		usuario = uDao.autenticar(email, senha);
		
		if (usuario != null) { // se existir um usuario
			
			rd = request.getRequestDispatcher("index.jsp"); //enviar para index
			rd.forward(request, response);
			
			session = request.getSession();
			session.setAttribute("usuario", usuario);
		}else {
			
			rd = request.getRequestDispatcher("login.html");
			rd.forward(request, response);
		}
	}
}