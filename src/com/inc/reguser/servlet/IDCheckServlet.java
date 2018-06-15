package com.inc.reguser.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.SignUpDao;

@WebServlet("/mypage/idCheck")
public class IDCheckServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		
		String idCheck = SignUpDao.getInstance().getIdCheck(id);
		
		response.getWriter().print(idCheck);
	}
}
