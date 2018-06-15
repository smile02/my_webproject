package com.inc.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(value= {"/mypage/photo/*", "/mypage/visit/*", "/mypage/admin", "/mypage/myinfo"})
public class LoginFilter implements Filter {
   
	@Override
	public void destroy() {
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
				throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		
		String svo = (String)request.getSession().getAttribute("id");
		
		if(svo == null) {
			request.setAttribute("msg", "로그인 후 이용가능한 페이지입니다.");
			request.setAttribute("url", request.getContextPath()+"/mypage/reguser/login");
			request.getRequestDispatcher("/mypage/mypage_error.jsp")
					.forward(request, response);
			return;
		}
		
		if(request.getRequestURI().indexOf("/mypage/admin") >=0 &&
					!svo.equals("admin")) {
			request.setAttribute("msg", "관리자만 이용가능한 페이지입니다.");
			request.setAttribute("url", request.getContextPath()+"/mypage/main");
			request.getRequestDispatcher("/mypage/mypage_error.jsp")
					.forward(request, response);
			return;
		}
		
		chain.doFilter(req, res);
	}
	
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
