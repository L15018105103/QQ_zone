package dao;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.User;
import util.Jdbc;

public class UserDao {
public ArrayList<User> search(String id,String password) throws ClassNotFoundException, SQLException{
Connection con = Jdbc.connect();
Statement sta = null;
ResultSet rs = null;
sta = (Statement) con.createStatement();
 
ArrayList<User> users = new ArrayList<User>();
rs = (ResultSet) sta.executeQuery("select * from client where id = '"+id+"'");

while(rs.next()){
User u = new User();						
u.setId(rs.getString("id"));
u.setPassword(rs.getString("password"));
u.setName(rs.getString("name"));
u.setNickName(rs.getString("nickname"));
u.setBirthday(rs.getString("birthday"));
u.setPlace(rs.getString("place"));
u.setConstellation(rs.getString("constellation"));
u.setBlood(rs.getString("blood"));
u.setProfession(rs.getString("profession"));
//System.out.println(rs.getString("id")+"\t"+rs.getString("password")+"\t"+rs.getString("name")+"\t");
users.add(u);
}
if(rs != null){
rs.close();
}
Jdbc.close(sta, con);
return users;
}
}
