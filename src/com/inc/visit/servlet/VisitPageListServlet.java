package com.inc.visit.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.VisitDao;
import com.inc.vo.VisitVo;

@WebServlet("/mypage/visit/list")
public class VisitPageListServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
 		List<VisitVo> visitList = VisitDao.getInstance().visitSelectList();
		
		request.setAttribute("visitList", visitList);
		
	
		request.getRequestDispatcher("/mypage/visit/visit_list.jsp")
				.forward(request, response);
				
		
	}
	
}
