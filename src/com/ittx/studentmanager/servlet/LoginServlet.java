package com.ittx.studentmanager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");
		String autoLogin = request.getParameter("autoLogin");
		
		if(userName.equals("admin") && passWord.equals("123456")){
			if("true".equals(autoLogin)){ //判断是否保存cookie状态
				saveCookie(response,userName,passWord,60*60*10);
			}else{
				saveCookie(response,userName,passWord,0);
			}
			
			//保存登录状态到session
			HttpSession session = request.getSession();
			session.setAttribute("user", userName);
			
//			session.setMaxInactiveInterval(10);
			
			response.sendRedirect("main.jsp");
		}else{
			request.getRequestDispatcher("login.jsp?isSucuess=false").forward(request, response);
		}
		
	}
	public void saveCookie(HttpServletResponse response,String userName,String passWord,int maxAGE){
		Cookie cookie_use = new Cookie("name", userName);
		Cookie cookie_psw = new Cookie("psw", passWord);
		cookie_use.setMaxAge(maxAGE);
		cookie_psw.setMaxAge(maxAGE);
		response.addCookie(cookie_use);
		response.addCookie(cookie_psw);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
