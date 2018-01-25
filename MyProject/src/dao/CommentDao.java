package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.Comment;
import util.Jdbc;

public class CommentDao {
	public ArrayList<Comment> search(String memo) throws ClassNotFoundException, SQLException{
		Connection con = Jdbc.connect();
		Statement sta = null;
		ResultSet rs = null;
		sta = (Statement) con.createStatement();
		 
		ArrayList<Comment> comments = new ArrayList<Comment>();
		rs = (ResultSet) sta.executeQuery("select * from comment where memo = '"+memo+"'"+"order by time");

		while(rs.next()){
		Comment co = new Comment();
		co.setName(rs.getString("name"));
		co.setMemo(rs.getString("memo"));
		co.setTime(rs.getString("time"));
		co.setCount(rs.getString("count"));
		co.setReply(rs.getString("reply"));
		co.setReplyTime(rs.getString("replyTime"));
		//System.out.println(rs.getString("id")+"\t"+rs.getString("password")+"\t"+rs.getString("name")+"\t");
		comments.add(co);
		}
		if(rs != null){
		rs.close();
		}
		Jdbc.close(sta, con);
		return comments;
		}
	public ArrayList<Comment> search1(String replyTime) throws ClassNotFoundException, SQLException{
		Connection con = Jdbc.connect();
		Statement sta = null;
		ResultSet rs = null;
		sta = (Statement) con.createStatement();
		 
		ArrayList<Comment> comments = new ArrayList<Comment>();
		rs = (ResultSet) sta.executeQuery("select * from comment where replyTime = '"+replyTime+"'"+"order by replyTime");

		while(rs.next()){
		Comment co = new Comment();
		co.setName(rs.getString("name"));
		co.setMemo(rs.getString("memo"));
		co.setTime(rs.getString("time"));
		co.setCount(rs.getString("count"));
		co.setReply(rs.getString("reply"));
		co.setReplyTime(rs.getString("replyTime"));
		//System.out.println(rs.getString("id")+"\t"+rs.getString("password")+"\t"+rs.getString("name")+"\t");
		comments.add(co);
		}
		if(rs != null){
		rs.close();
		}
		Jdbc.close(sta, con);
		return comments;
		}
}
