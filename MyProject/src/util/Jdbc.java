package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
	
public class Jdbc {
	//����
	public static Connection connect()throws SQLException, ClassNotFoundException{
	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("Driver loaded");
	//ȡ�����ӵ�url,�ܷ���MySQL���ݿ���û���,���룻user�����ݿ���� 
	String url = "jdbc:mysql://localhost/user?useUnicode=true&characterEncoding=UTF-8"; 
	String username = "root"; 
	String password = "root"; 
	
	

	   conn =(Connection) DriverManager.getConnection(url,username,password);
	   System.out.println("Database connected");
	return conn; 
	}

	//�ر�
	public static void close(Statement stat, Connection conn) throws SQLException{
	if(stat != null){
	stat.close();
	}
	if(conn != null){
	conn.close();
	}
	}
	 }
