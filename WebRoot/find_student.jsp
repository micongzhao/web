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
    /*是否为空检查*/
	function check() {
		var number = $("#number").val();

		if (number == "" ) {
			$("#msg").text("学号不能为空！");
			return false;
		} else{
			return true;
		}

	}
	/*数字检查*/
	function isDigit(){
		var num = $("#number").val();  //12fd
        var code;  
        for (var i = 0; i < num.length; i++) {  
            //charAt()获取指定位置字符串,charCodeAt()返回该字符串的编码  
               //0的ASCII是48,9的ASCII是57  
            var code = num.charAt(i).charCodeAt(0);  
            if (code < 48 || code > 57) {  
            	$("#msg").text("学号只能包含0-9的数字！");
                return false;
            } 
            
        }  
        return true;
		
	}
</script>
</head>
<body>

	<h1>查找学生</h1>
	<br>
	<div align="center"><a href="./main.jsp" style="color:blue;font-weight: bold;">返回主界面</a></div>
	
	<div class="login-form">
		
		<form action="<%=request.getContextPath()%>/show_student.jsp" method="post" onsubmit="return check() && isDigit()">
			<input type="text" id="number" name="number" placeholder="请输入学生学号"><br>
			<br>
			<%-- jquery代码判断姓名和学号是否为空 --%>
			<span id="msg"></span>
			<br>
			<br>
			<div class="signin">
				<input type="submit" value="查找">
			</div>
		</form>

	</div>
	<div class="copy-rights">
		<p>Copyright &copy; 2016.viktor All rights reserved.</p>
	</div>

</body>
</html>