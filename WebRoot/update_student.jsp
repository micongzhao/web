<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ittx.studentmanager.db.StudentDB" %>
<%@page import="com.ittx.studentmanager.bean.Student" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>修改学生</title>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<script
	src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script>
	function check() {
		var age = $("#age").val(); //获取表单元素值
		var userName = $("#userName").val();
		var sex = $("#sex").val();
		if (age == "" || userName == "" || sex=="") {
			alert("姓名、年龄和性别不能为空！");
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>
    <% 
    	String number = request.getParameter("num");
    	Student student = StudentDB.getInstance().findStudentByNumber(Integer.parseInt(number));
    %>
	<h1>修改学生</h1>
	<br>
	<div align="center"><a href="./main.jsp" style="color:blue;font-weight: bold;">返回主界面</a>
	<a href="./student_list.jsp" style="color:blue;font-weight: bold;">返回上一级</a></div>
	
	<div class="login-form">
		
		<form action="<%=request.getContextPath()%>/updatestudentservlet.do" method="post" enctype="multipart/form-data"
		 onsubmit="return check()">
			<input type="text" id="user" class="text" name="userName" placeholder="请输入学生姓名" 
			   value="<%=student.getName()%>">

			<input type="text" id="age" name="age" placeholder="请输入学生年龄"
			    value="<%=student.getAge()%>"><br>
			
			<input type="text" id="sex" name="sex" placeholder="请输入学生性别" 
			     value="<%=student.isSex()==true?"男":"女"%>"><br><br>
			 
			<img src="<%=student.getFileUrl()%>" width="60px" height="60px"/> 
			<input type="file" id="myfile" name="header_img"/>
			<%--  type="hidden" 隐藏表单界面 --%>
			<input type="hidden" name="number"  value="<%=student.getNumber()%>"><br>
			<br>
			<br>
			<div class="signin">
				<input type="submit" value="确定">
			</div>
		</form>

	</div>
	<div class="copy-rights">
		<p>Copsyright &copy; 2016.viktor All rights reserved.</p>
	</div>

</body>
</html>