<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="entity.User"%>
<%@ page import="util.Jdbc" %>
<%@ page import="java.sql.*" %>
<%!String realName = "Window";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>点赞页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
   <%
		String realTime = null;
		realTime = new String(request.getParameter("usertime").getBytes("iso8859-1"), "utf-8");
	%>
    <% 
     try{
      int count = 0;
      String reply = null,thumb=null;
      Connection conn=Jdbc.connect();
      Statement sta = null;
	  ResultSet rs = null;
	  sta = (Statement) conn.createStatement();
      rs = (ResultSet) sta.executeQuery("select * from comment where time = '"+realTime+"'"+"order by time");
      while(rs.next()){
       realName = rs.getString("name");
       thumb = rs.getString("thumb");
      }
      if(thumb!=null)
      {
        count = Integer.parseInt(thumb);
      }
      count++;
      thumb = String.valueOf(count);
      //System.out.println(thumb+"lllllllllllllllllllllllaaaaaaaaaakdkdkdddd"+realTime);
      String sql="update comment set thumb=? where time =?";
	  PreparedStatement pst=conn.prepareStatement(sql);
	 //  String sql="delete from messa where subject=?";
	  // PreparedStatement pst=conn.prepareStatement(sql);
	   //pst.setString(1,subject);
	   // pst.setString(3,time);
	    pst.setString(1,thumb);
	    pst.setString(2,realTime);
      int result=pst.executeUpdate();
      if(result>0)
      {
        out.print("点赞成功！");
        out.println("<a href='comment.jsp?username="+realName+"''>返回说说日志页面</a>");
      }
      else
      {
         out.print("点赞失败！");
         out.println("<a href='comment.jsp?username="+realName+"''>返回说说日志页面</a>");
      }
      }catch(Exception ex){
        ex.printStackTrace();
       }
     %>
  </body>
</html>
