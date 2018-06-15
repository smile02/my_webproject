package com.inc.photo.serlvet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.PhotoDao;

@WebServlet("/mypage/photo/delete")
public class PhotoPageDeleteServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String uri = request.getParameter("uri");
		
		String realPath = request.getServletContext().getRealPath("/mypage/upload");
		
		realPath += uri;
		File file = new File(realPath);
		file.delete();
		
		PhotoDao.getInstance().photoDelete(id);
		
		response.getWriter().print('y');
//		response.sendRedirect(request.getContextPath()+"/mypage/photo/list");
	}
}
