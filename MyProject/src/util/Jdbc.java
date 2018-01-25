package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
	
public class Jdbc {
	//连接
	public static Connection connect()throws SQLException, ClassNotFoundException{
	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("Driver loaded");
	//取得连接的url,能访问MySQL数据库的用户名,密码；user：数据库表名 
	String url = "jdbc:mysql://localhost/user?useUnicode=true&characterEncoding=UTF-8"; 
	String username = "root"; 
	String password = "root"; 
	
	

	   conn =(Connection) DriverManager.getConnection(url,username,password);
	   System.out.println("Database connected");
	return conn; 
	}

	//关闭
	public static void close(Statement stat, Connection conn) throws SQLException{
	if(stat != null){
	stat.close();
	}
	if(conn != null){
	conn.close();
	}
	}
	 }
