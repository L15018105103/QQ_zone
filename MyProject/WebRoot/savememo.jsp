<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="util.Jdbc" %>
<%@ page import="java.sql.*" %>
<%@ page import="entity.Messager"%>
<%@ page import="entity.User"%>
<%!String realName = "Window";%>
<%!String realMemo = "Window";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  <body>
  <%
			ArrayList<Messager> lists = (ArrayList) request.getAttribute("messagerList");
			if (lists.size() == 0) {
				//out.print("无查询记录");
			} else {
				/* out.print("<table  cellspacing='0px' cellpadding='0px'>");
				out.print("<tr><td>姓名</td><td>ID</td></tr>"); */
				for (int i = 0; i < lists.size(); i++) {
					Messager m = lists.get(i);
					String name = m.getName();
					String memo = m.getMemo();
					String point = name;
					/* out.print("<tr>");
					out.print("<td>" + u.getName() + "</td>");
					out.print("<td>" + u.getId() + "</td>");
					out.print("</tr>"); */
					if (name.equalsIgnoreCase(point)) {
						realName = name;
						realMemo = memo;
					}
					/* out.print("<td>" + name + "</td>");
					out.print("<td>" + id + "</td>");
					out.print("<td>" + realName + "</td>"); */
				}
			}
		%>
    <%
        out.println("留言发表成功！");
        out.println("<a href='messageBoard.jsp?username="+realName+"'> 继续留言</a>");
    %>
  </body>
</html>
