package br.senai.sp.jandira.dbutils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	
	private static Connection con;
	
	public static Connection getConexao(){
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			String dbUrl = "jdbc:mysql://10.107.140.2:3306/agenda?useSSL=false";
			
			con = DriverManager.getConnection(dbUrl, "root", "bcd127");
						
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}

}
