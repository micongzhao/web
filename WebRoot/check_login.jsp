<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String user = (String) session.getAttribute("user");
	if (user == null) {
		//没有登录，跳转到登录界面
		//response.sendRedirect("./login.jsp");
		%>
		 <jsp:forward page="./login.jsp"/>
		<%
		//request.getRequestDispatcher("./login.jsp").forward(request, response);
	}
%>