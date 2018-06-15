package com.inc.photo.serlvet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.PhotoDao;
import com.inc.vo.PhotoVo;

@WebServlet("/mypage/photo/list")
public class PhotoPageListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
	
		List<PhotoVo> photoList = PhotoDao.getInstance().photoSeletList();
				
		request.setAttribute("photoList", photoList);
		
		request.getRequestDispatcher("/mypage/photo/photo_list.jsp")
				.forward(request, response);
	}
}
