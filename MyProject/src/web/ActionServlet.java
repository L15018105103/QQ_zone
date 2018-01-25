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
uri = uri.substring(uri.indexOf("MyProject/") + 10, uri.lastIndexOf("."));/*��һ����仰��ʲô��˼*/

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

//�鿴�б�
public void show(HttpServletRequest request, HttpServletResponse response)
throws Exception {
String id = request.getParameter("id");
String password = request.getParameter("password");
//System.out.println(password+"ddddddddddddddddddddddddddddddddddddddd"+id);
//����id��ѯ
List<User> userList = new UserDao().search(id,password);
//����ҳ��
request.setAttribute("userList", userList);
request.getRequestDispatcher("record.jsp").forward(request, response);
}

//���԰�����Բ���
public void show1(HttpServletRequest request, HttpServletResponse response)
throws Exception{
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
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
	   //System.out.println(count+"��������55555555555555555555555555555555");
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
	        System.out.println("���Է���ɹ���");
	       }else{
	          System.out.println("���Է���ʧ�ܣ�");
	          }
	   }catch(Exception ex){
	     ex.printStackTrace();
	    }
//����time��ѯ
List<Messager> messagerList = new MessagerDao().search(time);
//���ؽ���
request.setAttribute("messagerList", messagerList);
request.getRequestDispatcher("savememo.jsp").forward(request, response);
}



//˵˵��־����
public void show3(HttpServletRequest request, HttpServletResponse response)
throws Exception{
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
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
	        System.out.println("˵˵����ɹ���");
	       }else{
	          System.out.println("˵˵����ʧ�ܣ�");
	          }
	   }catch(Exception ex){
	     ex.printStackTrace();
	    }
//����memo��ѯ
List<Comment> commentList = new CommentDao().search(memo);
//���ؽ���
request.setAttribute("commentList",commentList);
request.getRequestDispatcher("commentAction.jsp").forward(request, response);
}

//���԰�����Իظ�����
public void show4(HttpServletRequest request, HttpServletResponse response)
throws Exception{
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
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
	   //count.                        /*���ַ��������ݴ洢������+1*/
	   /*�����ǽ��ַ���ת�����ַ�*/
	   count=point+"";
	  // System.out.println(count+" "+reply+"�������úúû������6666666666666");
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
	        System.out.println("���Իظ�����ɹ���");
	       }else{
	          System.out.println("���Իظ�����ʧ�ܣ�");
	          }
	   }catch(Exception ex){
	     ex.printStackTrace();
	    }
//����time��ѯ
List<Messager> messagerList = new MessagerDao().search1(replyTime);
//���ؽ���
request.setAttribute("messagerList", messagerList);
request.getRequestDispatcher("messageReply.jsp").forward(request, response);
}

//˵˵�ظ�����
public void show5(HttpServletRequest request, HttpServletResponse response)
throws Exception{
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
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
	   //count.                        /*���ַ��������ݴ洢������+1*/
	   /*�����ǽ��ַ���ת�����ַ�*/
	   count=point+"";
	   //System.out.println(count+" "+reply+"�������úúû������6666666666666");
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
	        System.out.println("˵˵�ظ�����ɹ���");
	       }else{
	          System.out.println("˵˵�ظ�����ʧ�ܣ�");
	          }
	   }catch(Exception ex){
	     ex.printStackTrace();
	    }
//����memo��ѯ
List<Comment> commentList = new CommentDao().search1(replyTime);
//���ؽ���
request.setAttribute("commentList",commentList);
request.getRequestDispatcher("commentReply.jsp").forward(request, response);
}

//˵˵�ظ�����
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