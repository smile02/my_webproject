package com.inc.photo.serlvet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.PhotoDao;
import com.inc.vo.PhotoVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/mypage/photo/insert")
public class PhotoPageInsertServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String webPath = "/mypage/upload";
		
		String realPath = request.getServletContext().getRealPath(webPath);
		MultipartRequest mr = new MultipartRequest(request, realPath,
					300*1024*1024,
					"utf-8",
					new DefaultFileRenamePolicy());
		
		String content = mr.getParameter("content");
		File file = mr.getFile("file");
		
		if(file == null) {
			request.setAttribute("msg", "사진을 선택해주세요.");
			request.setAttribute("url", request.getContextPath()+"/mypage/photo/list");
			request.getRequestDispatcher("/mypage/mypage_error.jsp")
					.forward(request, response);
			return;
		}
		
		String fileName = file.getName();
		if(!fileName.endsWith(".jpg") && !fileName.endsWith(".JPG")
				&& !fileName.endsWith(".png") && !fileName.endsWith(".PNG")
				&& !fileName.endsWith(".gif") && !fileName.endsWith(".GIF")){
					
				file.delete();
				request.setAttribute("msg", "이미지 이외의 파일은 올릴 수 없습니다.");
				request.setAttribute("url", request.getContextPath()+"/mypage/photo/list");
				request.getRequestDispatcher("/mypage/mypage_error.jsp")
						.forward(request, response);
				return;
			}
		
		content = content.replaceAll("\\\"", "&quot");
		content = content.replaceAll("eval\\((.*)\\)", "");
		content = content.replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt;");
		content = content.replaceAll("\\(", "&#40;");
		content = content.replaceAll("\\)", "&#41;");
		content = content.replaceAll("'", "&#39;");		
		content = content.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
		content = content.replaceAll("script", "");
		
		
		System.out.println("photo content : "+content);
		System.out.println("fileName : "+fileName);
		System.out.println(" u_id : "+(String)request.getSession().getAttribute("id"));
		
		PhotoVo pvo = new PhotoVo();
		pvo.setContent(content);
		pvo.setUri(fileName);
		pvo.setU_id((String)request.getSession().getAttribute("id"));
		
		PhotoDao.getInstance().photoInsert(pvo);
		
		response.sendRedirect(request.getContextPath()+"/mypage/photo/list");
	}
}
