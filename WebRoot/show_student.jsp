<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ittx.studentmanager.db.StudentDB"%>
<%@ page import="com.ittx.studentmanager.bean.Student"%>
<%@ page import="java.util.ArrayList"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生界面</title>
<link rel="stylesheet" type="text/css" href="./css/mystyle.css"></link>

</head>
<%
	String number = request.getParameter("number");

	Student student = StudentDB.getInstance().findStudentByNumber(Integer.parseInt(number));
%>
<body background="./images/bg1.jpg">

	<div class="emp_contaner">
		<h3>学生信息</h3>
		<div>
			<a href="./main.jsp"
				style="background-color: transparent; color: blue">返回主界面</a>
		</div>
		<br> <br> <br>
		<table>
			<tr>
				<th>学生学号</th>
				<th>学生名称</th>
				<th>学生年龄</th>
				<th>学生性别</th>
			</tr>
	
			<tr>

 			    <td><%=student!=null?student.getNumber():""%></td>
				<td><%=student!=null?student.getName():""%></td>
				<td><%=student!=null?student.getAge():""%></td>
				<td><%=student!=null?(student.isSex() == true ? "男" : "女"):""%></td>
			</tr>


		</table>

	</div>
</body>
</html>