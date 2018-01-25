package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.Messager;
import util.Jdbc;

public class MessagerDao {
	public ArrayList<Messager> search(String time) throws ClassNotFoundException, SQLException{
		Connection con = Jdbc.connect();
		Statement sta = null;
		ResultSet rs = null;
		sta = (Statement) con.createStatement();
		 
		ArrayList<Messager> messagers = new ArrayList<Messager>();
		rs = (ResultSet) sta.executeQuery("select * from messa where time = '"+time+"'"+"order by time");

		while(rs.next()){
		Messager m = new Messager();						
		m.setName(rs.getString("name"));
		m.setMemo(rs.getString("memo"));
		m.setTime(rs.getString("time"));
		m.setCount(rs.getString("count"));
		m.setReply(rs.getString("reply"));
		m.setReplyTime(rs.getString("replyTime"));
		/*System.out.println(rs.getString("name")+"\t"+rs.getString("memo")+"\t"+rs.getString("time")+"\t"+
				rs.getString("reply")+"\t"+rs.getString("count")+"\t"+
				rs.getString("replyTime")+"\t"+"0000000000000000000000000000");*/
		messagers.add(m);
		}
		if(rs != null){
		rs.close();
		}
		Jdbc.close(sta, con);
		return messagers;
		}
	public ArrayList<Messager> search1(String replyTime) throws ClassNotFoundException, SQLException{
		Connection con = Jdbc.connect();
		Statement sta = null;
		ResultSet rs = null;
		sta = (Statement) con.createStatement();
		 
		ArrayList<Messager> messagers = new ArrayList<Messager>();
		rs = (ResultSet) sta.executeQuery("select * from messa where replyTime = '"+replyTime+"'"+"order by replyTime");

		while(rs.next()){
		Messager m = new Messager();						
		m.setName(rs.getString("name"));
		m.setMemo(rs.getString("memo"));
		m.setTime(rs.getString("time"));
		m.setCount(rs.getString("count"));
		m.setReply(rs.getString("reply"));
		m.setReplyTime(rs.getString("replyTime"));
		/*System.out.println(rs.getString("name")+"\t"+rs.getString("memo")+"\t"+rs.getString("time")+"\t"+
				rs.getString("reply")+"\t"+rs.getString("count")+"\t"+
				rs.getString("replyTime")+"\t"+"0000000000000000000000000000");*/
		messagers.add(m);
		}
		if(rs != null){
		rs.close();
		}
		Jdbc.close(sta, con);
		return messagers;
		}
}