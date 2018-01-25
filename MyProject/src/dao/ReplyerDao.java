package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.Replyer;
import util.Jdbc;

public class ReplyerDao {
	public ArrayList<Replyer> search(String subject) throws ClassNotFoundException, SQLException{
		Connection con = Jdbc.connect();
		Statement sta = null;
		ResultSet rs = null;
		sta = (Statement) con.createStatement();
		 
		ArrayList<Replyer> replyers = new ArrayList<Replyer>();
		rs = (ResultSet) sta.executeQuery("select * from replytable where subject = '"+subject+"'"+"order by time");

		while(rs.next()){
		Replyer r = new Replyer();						
		r.setName(rs.getString("name"));
		r.setSubject(rs.getString("subject"));
		r.setReplycontent(rs.getString("replycontent"));
		r.setTime(rs.getString("time"));
		//System.out.println(rs.getString("id")+"\t"+rs.getString("password")+"\t"+rs.getString("name")+"\t");
		replyers.add(r);
		}
		if(rs != null){
		rs.close();
		}
		Jdbc.close(sta, con);
		return replyers;
		}
}
