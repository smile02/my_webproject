package com.inc.photo.serlvet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/photo/download")
public class PhotoPageDownLoadServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String uri = request.getParameter("uri");
		String realPath = request.getServletContext().getRealPath("/mypage/upload/");
		realPath += uri;

		String charset = request.getCharacterEncoding();
		File file = new File(realPath);

		//브라우저에 따라 코드가 다름 (또, 브라우저와 버전에 따라 다름)
		//우선, 지금은 크롬이라고 생각
		String value = 
				"attachment; filename="+
						new String(uri.getBytes(charset), "ISO-8859-1"); //"ISO-8859-1" 웹브라우저에서 통신하는 인코딩방법
		//filename.getBytes(charset) 파일명을 바이트로 가져와서 utf-8로 변환 후 다시 iso-8859-1로 변환

		response.setContentType("Pragma: no-cache");
		//전송 데이터가 stream처리가 되도록 문자셋 변경
		response.setContentType(
				"applicaion/octet-stream;charset=8859_1;");

		//다운로드 창이 열리게 설정
		response.setHeader("Content-Disposition",value);

		//전송타입 : 파일을 binary (클라이언트 -> 서버로 올릴 때)
		response.setHeader("Content-Transfer-Encoding", "binary");

		BufferedInputStream bis = new BufferedInputStream(
				new FileInputStream(file));
		//실제경로에 있는 file을 불러와서 bis에 저장

		BufferedOutputStream bos = new BufferedOutputStream(
				response.getOutputStream());

		int i = 0;
		while((i = bis.read()) != -1) {
			bos.write(i);			
		}
		bos.close();
		bis.close();
	}
}