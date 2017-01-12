<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ittx.studentmanager.db.StudentDB"%>
<%@ page import="com.ittx.studentmanager.bean.Student"%>
<%@ page import="java.util.ArrayList"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>员工列表</title>
<link rel="stylesheet" type="text/css" href="./css/mystyle.css"></link>
<script>
	function backMain(){
		window.location.href="./main.jsp";	
	}
</script>
</head>

<%-- <jsp:include page="./check_login.jsp"/> --%>

<%
	StudentDB studentDB = StudentDB.getInstance();
	ArrayList<Student> studentList = studentDB.getAllStudent();
%>


<body background="./images/bg1.jpg">
	
	<div class="emp_contaner">
		<h3>学生信息</h3>
		<!-- <button onclick="backMain()">返回主界面</button> -->
		<div ><a href="./main.jsp" style="background-color:transparent;color:blue">返回主界面</a></div>
		<br>
		<br>
		<br>
		<table>
			<tr>
				<th>学生头像</th>
				<th>学生学号</th>
				<th>学生名称</th>
				<th>学生年龄</th>
				<th>学生性别</th>
				<th colspan="2">操作</th>
			</tr>

			<%
				for (Student student : studentList) {
			%>
			<tr>
			    <td><img src="<%=student.getFileUrl()%>" width="60px" height="50px"/></td>
				<td><%=student.getNumber()%></td>
				<td><%=student.getName()%></td>
				<td><%=student.getAge()%></td>
				<td><%=student.isSex()==true?"男":"女"%></td>
				<td><a href="<%=request.getContextPath()%>/deleteservlet.do?num=<%=student.getNumber()%>">删除</a></td>
				<td><a href="<%=request.getContextPath()%>/update_student.jsp?num=<%=student.getNumber()%>">修改</a></td>
			</tr>
			<%
				}
			%>

		</table>

	</div>
</body>
</html>