package br.senai.sp.jandira.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.senai.sp.jandira.dbutils.Conexao;
import br.senai.sp.jandira.model.Usuario;

public class UsuarioDao {
	
	private Usuario usuario;
	
	private PreparedStatement stm;
	private ResultSet rs;
	
	public void setUsuairo(Usuario usuario) {
		
		this.usuario = usuario;
	}
	
	public Usuario autenticar(String email, String senha){
		
		usuario = null;
		stm = null;
		rs = null;
		
		String sql = "SELECT * FROM usuarios WHERE email = ? AND senha = ? ";
		
		try {
			stm = Conexao.getConexao().prepareStatement(sql);
			
			stm.setString(1, email);
			stm.setString(2, senha);
			
			rs = stm.executeQuery();
			
			if(rs.next()) { // achou usuario
				
				usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setCidade(rs.getString("cidade"));
				usuario.setDtNasc(rs.getString("dtNasc"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSenha(rs.getString("senha"));
				
			}
			stm.close();
			Conexao.getConexao().close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return usuario;
	}
	
	public boolean gravar() {
		
		boolean status = true;
		
		stm = null;
		
		String sql = "INSERT INTO usuarios" +
					 "(nome, email, senha, cidade, dtNasc) " +
					 "VALUES (?, ?, ?, ?, ?)";
		
		try {
			stm = Conexao.getConexao().prepareStatement(sql);
			
			stm.setString(1, usuario.getNome());
			stm.setString(2, usuario.getEmail());
			stm.setString(3, usuario.getSenha());
			stm.setString(4, usuario.getCidade());
			stm.setString(5, usuario.getDtNasc());
			
			stm.execute();
			
			stm.close();
			Conexao.getConexao().close();
		}
		catch(Exception e) {
			e.printStackTrace();
			
			status = false;
		}
		
		return status;
	}
}