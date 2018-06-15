package com.inc.photo.serlvet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.PhotoDao;

@WebServlet("/mypage/photo/gnb")
public class PhotoGoodAndBadServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String check = request.getParameter("check");
		
		if(check.equals("good")) {
			PhotoDao.getInstance().photoGood(id);
		}else {
			PhotoDao.getInstance().photoBad(id);
		}
		
		response.getWriter().print('y');
	}

}
