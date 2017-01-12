package com.ittx.studentmanager.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginFilter implements Filter {
	private String noUri;

	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		/**
		 * 过虑不做登录验证的请求
		 */
		String requestUrl = req.getRequestURI(); //获取当前请求url地址
		String[] urls = noUri.split(";");
		if(urls != null && urls.length > 0){
			for(String url : urls){
				if(requestUrl.indexOf(url) == -1){  //请求requestUrl不包含url
					continue;
				}else{
					chain.doFilter(request, response);  //放行
					return;
				}
			}
		}
		/**
		 * 登录验证
		 */
		HttpSession session = req.getSession();
		String user = (String) session.getAttribute("user");
		if(user == null){
			res.sendRedirect(req.getContextPath()+"/login.jsp");
		}else{
			chain.doFilter(request, response);
		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		noUri = fConfig.getInitParameter("noFilterUri");
		System.out.println("noUri >>> :"+noUri);
	}

}
