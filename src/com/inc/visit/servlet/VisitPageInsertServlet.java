package com.inc.visit.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.VisitDao;
import com.inc.vo.VisitVo;

@WebServlet("/mypage/visit/insert")
public class VisitPageInsertServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String content = request.getParameter("content");
		String id = (String) request.getSession().getAttribute("id");

		VisitVo vvo = new VisitVo();
		
		vvo.setU_id(id);
		vvo.setContent(content);
		
		System.out.println("visit content : "+content);
		System.out.println(" u_id : "+(String)request.getSession().getAttribute("id"));
		
		VisitDao.getInstance().visitInsert(vvo);
		
		response.sendRedirect(request.getContextPath()+"/mypage/visit/list");
		
	}
}
