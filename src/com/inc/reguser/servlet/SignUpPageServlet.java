package com.inc.reguser.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.SignUpDao;
import com.inc.encrypt.SHA256Encryptor;
import com.inc.util.Verify;
import com.inc.vo.SignupVo;

@WebServlet("/mypage/reguser/signup")
public class SignUpPageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/mypage/reguser/mypage_signup.jsp")
				.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//id:id,password:password,name:name,birth:birth,hobby:hobby,email:email,phone:phone
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String hobby = request.getParameter("hobby");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		if(!Verify.idVeriFy(id) || !Verify.passwordVerify(password)
				|| !Verify.nameVerify(name)) {
			request.setAttribute("msg", "잘못된 요청입니다.");
			request.setAttribute("url", request.getContextPath()+"/mypage/reguser/signup");
			request.getRequestDispatcher("/mypage/mypage_error.jsp")
					.forward(request, response);
			return;
		}
		
		password = SHA256Encryptor.shaEncrypt(password);
		
		SignupVo svo = new SignupVo();
		svo.setId(id);
		svo.setPassword(password);
		svo.setName(name);
		svo.setGender(gender);
		svo.setBirth(birth);
		svo.setHobby(hobby);
		svo.setEmail(email);
		svo.setPhone(phone);
		
		SignUpDao.getInstance().signUpInsert(svo);
		
		response.sendRedirect(request.getContextPath()+"/mypage/main");
		
	}
	/*
	 * id varchar2(40) primary key,
    password varchar2(30) not null,
    name varchar2(18) not null,
    gender char(1) check (gender in ('m','f')),
    birth date not null,
    hobby varchar2(30),
    email varchar2(50),
    phone varchar2(20),
    regdate date
	 */

}
