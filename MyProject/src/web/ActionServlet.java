package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDao;
import dao.MessagerDao;
import dao.ReplyerDao;
import dao.UserDao;
import entity.Comment;
import entity.Messager;
import entity.Replyer;
import entity.User;
import util.Jdbc;

public class ActionServlet extends HttpServlet {


public void service(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
response.setContentType("text/html;charset=utf-8");
request.setCharacterEncoding("utf-8");
String uri = request.getRequestURI();
uri = uri.substring(uri.indexOf("MyProject/") + 10, uri.lastIndexOf("."));/*查一下这句话是什么意思*/

if(uri.equals("show")){
	System.out.println("use the client");
try {
show(request,response);
} catch (Exception e) {
e.printStackTrace();
} 
}

if(uri.equals("show1")){
	System.out.println("use the MySQL");
try{
	show1(request,response);
} catch(Exception e){
	e.printStackTrace();
}
}


if(uri.equals("show3")){
	System.out.println("use the MySQL for Comment");
try{
	show3(request,response);
} catch(Exception e){
	e.printStackTrace();
}
}

if(uri.equals("show4")){
	System.out.println("use the MySQL for messageReply");
try{
	show4(request,response);
} catch(Exception e){
	e.printStackTrace();
}
}

if(uri.equals("show5")){
	System.out.println("use the MySQL for commentReply");
try{
	show5(request,response);
} catch(Exception e){
	e.printStackTrace();
}
}

if(uri.equals("show6")){
	System.out.println("use the computer!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
try{
	show6(request,response);
} catch(Exception e){
	e.printStackTrace();
}
}

}

//查看列表
public void show(HttpServletRequest request, HttpServletResponse response)
throws Exception {
String id = request.getParameter("id");
String password = request.getParameter("password");
//System.out.println(password+"ddddddddddddddddddddddddddddddddddddddd"+id);
//根据id查询
List<User> userList = new UserDao().search(id,password);
//返回页面
request.setAttribute("userList", userList);
request.getRequestDispatcher("record.jsp").forward(request, response);
}

//留言板的留言部分
public void show1(HttpServletRequest request, HttpServletResponse response)
throws Exception{
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
String name = request.getParameter("name");
String memo = request.getParameter("memo");
String count = null;
String reply = null;
String replyTime = null;
int point = 1;
String time = df.format(new Date());
//System.out.println(name+" "+memo+" "+time+"4444444444444444444444");
try{
	   Connection conn=Jdbc.connect();
	   Statement smt = conn.createStatement();
	   ResultSet rs;
	   String sql1;
	   sql1 = "select * from messa";
	   rs = smt.executeQuery(sql1);
	   while (rs.next()) {
			point++;
	   }
	   count=point+"";
	   //System.out.println(count+"啊啊啊啊55555555555555555555555555555555");
	   String sql="insert into messa(name,memo,time,count,reply,replyTime) values(?,?,?,?,?,?)";
	   PreparedStatement pst=conn.prepareStatement(sql);
	    pst.setString(1,name);
	    pst.setString(2,memo);
	    pst.setString(3,time);
	    pst.setString(4,count);
	    pst.setString(5,reply);
	    pst.setString(6,replyTime);
	    int result =pst.executeUpdate();
	     if(result>0)
	       {
	        System.out.println("留言发表成功！");
	       }else{
	          System.out.println("留言发表失败！");
	          }
	   }catch(Exception ex){
	     ex.printStackTrace();
	    }
//根据time查询
List<Messager> messagerList = new MessagerDao().search(time);
//返回界面
request.setAttribute("messagerList", messagerList);
request.getRequestDispatcher("savememo.jsp").forward(request, response);
}



//说说日志部分
public void show3(HttpServletRequest request, HttpServletResponse response)
throws Exception{
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
String name = request.getParameter("name");
String memo = request.getParameter("memo");
String time = df.format(new Date());
String count = null;
String reply = null;
String replyTime = null;
String thumb = "0";
int point = 1;
//System.out.println(name+" "+memo+" "+time+"55555555555555555");
try{
	   Connection conn=Jdbc.connect();
	   Statement smt = conn.createStatement();
	   ResultSet rs;
	   String sql1;
	   sql1 = "select * from comment";
	   rs = smt.executeQuery(sql1);
	   while (rs.next()) {
			point++;
	   }
	   count=point+"";
	   String sql="insert into comment(name,memo,time,count,reply,replyTime,thumb) values(?,?,?,?,?,?,?)";
	   PreparedStatement pst=conn.prepareStatement(sql);
	    pst.setString(1,name);
	    pst.setString(2,memo);
	    pst.setString(3,time);
	    pst.setString(4,count);
	    pst.setString(5,reply);
	    pst.setString(6,replyTime);
	    pst.setString(7,thumb);
	    int result =pst.executeUpdate();
	     if(result>0)
	       {
	        System.out.println("说说发表成功！");
	       }else{
	          System.out.println("说说发表失败！");
	          }
	   }catch(Exception ex){
	     ex.printStackTrace();
	    }
//根据memo查询
List<Comment> commentList = new CommentDao().search(memo);
//返回界面
request.setAttribute("commentList",commentList);
request.getRequestDispatcher("commentAction.jsp").forward(request, response);
}

//留言板的留言回复部分
public void show4(HttpServletRequest request, HttpServletResponse response)
throws Exception{
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
String reply = request.getParameter("reply");
String count = null;
int point = 0;
String replyTime = df.format(new Date());
//System.out.println(name+" "+memo+" "+time+"4444444444444444444444");
try{
	   Connection conn=Jdbc.connect();
	   Statement smt = conn.createStatement();
	   ResultSet rs;
	   String sql1;
	   sql1 = "select * from messa";
	   rs = smt.executeQuery(sql1);
	   while (rs.next()) {
			point++;
	   }
	   //count.                        /*将字符串的内容存储的数字+1*/
	   /*或者是将字符串转换成字符*/
	   count=point+"";
	  // System.out.println(count+" "+reply+"哈哈哈好好好或或或或或或6666666666666");
	   //String sql="insert into messa(name,memo,time,count) values(?,?,?,?)";
	   String sql="update messa set reply =?,replyTime=? where count =?";
	   PreparedStatement pst=conn.prepareStatement(sql);
	 //  String sql="delete from messa where subject=?";
	  // PreparedStatement pst=conn.prepareStatement(sql);
	   //pst.setString(1,subject);
	   // pst.setString(3,time);
	    pst.setString(1,reply);
	    pst.setString(2,replyTime);
	    pst.setString(3,count);
	    //pst.setString(5, reply);
	    int result =pst.executeUpdate();
	     if(result>0)
	       {
	        System.out.println("留言回复发表成功！");
	       }else{
	          System.out.println("留言回复发表失败！");
	          }
	   }catch(Exception ex){
	     ex.printStackTrace();
	    }
//根据time查询
List<Messager> messagerList = new MessagerDao().search1(replyTime);
//返回界面
request.setAttribute("messagerList", messagerList);
request.getRequestDispatcher("messageReply.jsp").forward(request, response);
}

//说说回复部分
public void show5(HttpServletRequest request, HttpServletResponse response)
throws Exception{
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
String reply = request.getParameter("reply");
String count = null;
int point = 0;
String replyTime = df.format(new Date());
//System.out.println(name+" "+memo+" "+time+"4444444444444444444444");
try{
	   Connection conn=Jdbc.connect();
	   Statement smt = conn.createStatement();
	   ResultSet rs;
	   String sql1;
	   sql1 = "select * from comment";
	   rs = smt.executeQuery(sql1);
	   while (rs.next()) {
			point++;
	   }
	   //count.                        /*将字符串的内容存储的数字+1*/
	   /*或者是将字符串转换成字符*/
	   count=point+"";
	   //System.out.println(count+" "+reply+"哈哈哈好好好或或或或或或6666666666666");
	   //String sql="insert into messa(name,memo,time,count) values(?,?,?,?)";
	   String sql="update comment set reply =?,replyTime=? where count =?";
	   PreparedStatement pst=conn.prepareStatement(sql);
	 //  String sql="delete from messa where subject=?";
	  // PreparedStatement pst=conn.prepareStatement(sql);
	   //pst.setString(1,subject);
	   // pst.setString(3,time);
	    pst.setString(1,reply);
	    pst.setString(2,replyTime);
	    pst.setString(3,count);
	    //pst.setString(5, reply);
	    int result =pst.executeUpdate();
	     if(result>0)
	       {
	        System.out.println("说说回复发表成功！");
	       }else{
	          System.out.println("说说回复发表失败！");
	          }
	   }catch(Exception ex){
	     ex.printStackTrace();
	    }
//根据memo查询
List<Comment> commentList = new CommentDao().search1(replyTime);
//返回界面
request.setAttribute("commentList",commentList);
request.getRequestDispatcher("commentReply.jsp").forward(request, response);
}

//说说回复部分
public void show6(HttpServletRequest request, HttpServletResponse response)
throws Exception{
String clock = request.getParameter("clock");
String blockNumber = request.getParameter("blockNumber");

System.out.println(clock + "666666666666666666666666666666666666666");
System.out.println(blockNumber + "888888888888888888888888");

//request.setAttribute("commentList",commentList);
request.getRequestDispatcher("index.jsp").forward(request, response);
}







}