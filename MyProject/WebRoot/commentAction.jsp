<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="util.Jdbc" %>
<%@ page import="java.sql.*" %>
<%@ page import="entity.Comment"%>
<%@ page import="entity.User"%>
<%!String realName = "Window";%>
<%!String realMemo = "Window";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  <body>
  <%--
     String realName = request.getParameter("username");
  --%>
  <%
			ArrayList<Comment> lists = (ArrayList) request.getAttribute("commentList");
			if (lists.size() == 0) {
			} else {
				for (int i = 0; i < lists.size(); i++) {
					Comment co = lists.get(i);
					String name = co.getName();
					String memo = co.getMemo();
					String point = memo;
					if (memo.equalsIgnoreCase(point)) {
					    realName = name;
						realMemo = memo;
					}
				}
			}
		%>
    <%
        out.println("说说发表成功！");
        out.println("<a href='comment.jsp?username="+realName+"'> 继续发表说说</a>");
    %>
  </body>
</html>
