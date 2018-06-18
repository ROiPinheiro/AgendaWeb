package br.senai.sp.jandira.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.jandira.dao.ContatoDao;
import br.senai.sp.jandira.model.Contato;

@WebServlet("/AtualizarContato")
public class AtualizarContato extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AtualizarContato() {
        super();

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Contato contato = new Contato();
		ContatoDao cDao = new ContatoDao();
		RequestDispatcher rd;
		
		contato.setId(Integer.parseInt(request.getParameter("txtIdContato")));
		contato.setNome(request.getParameter("txtNome"));
		contato.setDtNasc(request.getParameter("txtDtNasc"));
		contato.setEmail(request.getParameter("txtEmail"));
		contato.setLogradouro(request.getParameter("txtLogradouro"));
		contato.setBairro(request.getParameter("txtBairro"));
		contato.setCidade(request.getParameter("txtCidade"));
		contato.setEstado(request.getParameter("txtEstado"));
		contato.setCep(request.getParameter("txtCep"));
		contato.setTelefone(request.getParameter("txtTelefone"));
		contato.setCelular(request.getParameter("txtCelular"));
		contato.setSexo(request.getParameter("cbSexo"));
		
		cDao.setContato(contato);
		
		if(cDao.atualizarContato()) {
			rd = request.getRequestDispatcher("index.jsp");
		}
		else {
			rd = request.getRequestDispatcher("atualizar_contato.jsp");
		}
		
		rd.forward(request, response);
	}

}
