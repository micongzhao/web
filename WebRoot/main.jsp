<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>系统主界面</title>
<style type="text/css">
body {
	background: url('images/bg1.jpg') no-repeat 0px 0px;
}

a:link, a:visited /* 未访问链接*/ {
	font-weight: bold;
	color: #FFFFFF;
	background-color:#008B8B;
	text-align: center;
	padding: 8px;
	text-decoration: none;
}

a:hover, a:active /* hover 鼠标移动到链接上,active鼠标点击时 */ {
	background-color: #7A991A;
}
</style>
</head>

<%-- <jsp:include page="./check_login.jsp"/> --%>

<body align="center">
	<br>
	<h1>系统主界面</h1>
	<br>
	<br>
	<a href="./add_student.jsp">添加学生</a>

	<a href="./student_list.jsp">显示学生列表</a>

	<a href="./find_student.jsp">查找学生</a>

	<a href="./logout.do">退出系统</a>

</body>
</html>