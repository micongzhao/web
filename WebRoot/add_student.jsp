<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>添加学生</title>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<script
	src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script>
	function check() {
		var user = $("#user").val(); //获取表单元素值
		var number = $("#number").val();

		if (user == "" || number == "") {
			$("#msg").text("姓名和学号不能为空！");
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>

	<h1>添加学生</h1>
	<br>
	<div align="center"><a href="./main.jsp" style="color:blue;font-weight: bold;">返回主界面</a></div>
	
	<div class="login-form">
		
		<form action="./addStudentservlet.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
			<input type="text" id="user" class="text" name="userName" placeholder="请输入学生姓名">

			<input type="text" id="number" name="number" placeholder="请输入学生学号"><br><br>
			<span style="color:white">头像 :</span>
			<input type="file" id="myfile" name="header_img"/>
			<br>
			<br>
			<% String isCheck = request.getParameter("flag");
			   if("false".equals(isCheck)) {%>
				<span id="login_error">添加学生已经存在!</span>
			<% }%>
			<%-- jquery代码判断姓名和学号是否为空 --%>
			<span id="msg"></span>
			<br>
			<br>
			<div class="signin">
				<input type="submit" value="添加">
			</div>
		</form>

	</div>
	<div class="copy-rights">
		<p>Copyright &copy; 2016.viktor All rights reserved.</p>
	</div>

</body>
</html>