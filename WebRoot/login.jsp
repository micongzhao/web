<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登录</title>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<script src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script>
	function check() {
		$("#login_error").text(""); //文本内容
		var user = $("#user").val(); //获取表单元素值
		var psw = $("#psw").val();

		if (user == "" || psw == "") {
			$("#msg").text("用户名和密码不能为空！");
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>
	<h1>系统登录界面</h1>
	<div class="login-form">
		<div class="head-info">
			<label class="lbl-1"> </label> <label class="lbl-2"> </label> <label
				class="lbl-3"> </label>
		</div>
		<div class="clear"></div>
		<div class="avtar">
			<img src="images/avtar.png" />
		</div>
		<%
		    String userName="";
			String passWord="";
			Cookie[] cookies = request.getCookies();
			if (cookies != null && cookies.length > 0) {
				for (Cookie c : cookies) {
					if(c.getName().equals("name")){
						userName = c.getValue();
					}else if(c.getName().equals("psw")){
						passWord = c.getValue();
					}

				}
			}
		%>
		
		<form action="./loginservlet.do" method="post"
			onsubmit="return check()">

			<input type="text" id="user" class="text" name="userName"
				placeholder="请输入用户名" value="<%=userName%>"> 
				
			<input type="password" id="psw"
				name="passWord" placeholder="请输入密码" value="<%=passWord%>"><br>
		   <input
				type="checkbox" name="autoLogin" value="true" checked="checked"><span
				style="color: gray">保存登录信息</span><br />
			<%
				//java后端 判断用户名和密码是否正确
				String isSucess = request.getParameter("isSucuess");
				if ("false".equals(isSucess)) {
			%>
			<span id="login_error">用户名或密码出错!</span>
			<%
				}
			%>

			<%-- jquery代码判断用户名和密码是否为空 --%>
			<span id="msg"></span> <br> <br>
			<div class="signin">
				<input type="submit" value="登录">
			</div>
		</form>

	</div>
	<div class="copy-rights">
		<p>Copyright &copy; 2016.viktor All rights reserved.</p>
	</div>

</body>
</html>