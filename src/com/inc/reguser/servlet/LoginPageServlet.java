package com.inc.reguser.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.LoginDao;
import com.inc.encrypt.SHA256Encryptor;
import com.inc.vo.SignupVo;

@WebServlet("/mypage/reguser/login")
public class LoginPageServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/mypage/reguser/mypage_login.jsp")
				.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		request.getSession().setMaxInactiveInterval(60*10); //사용자가 이용하고 있는 세션을 가져옴 10분동안 유지
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		password = SHA256Encryptor.shaEncrypt(password);
		
		SignupVo svo = new SignupVo();
		svo.setId(id);
		svo.setPassword(password);
				
		SignupVo getSvo =  LoginDao.getInstance().userCheck(svo); //로그인을 시도한 유저의 아이디가 DB에 있는지
		
		//데이터는 다 불러옴
		
		Map<String, Object> lFailCount = new HashMap<>();
		lFailCount.put("id", id);
		lFailCount.put("cnt", 4);
		//DB검색해서 로그인을 시도한 사람의 로그인실패횟수 검사 3번인지 아닌지
		
		//5번 틀려서 계정이 잠겼을 경우
		if(LoginDao.getInstance().getLoginCheck(id) == 5) { //count가 5인경우
			//5분이 지났다면
			if(LoginDao.getInstance().getLoginTime(id) == null ) {		
				System.out.println("들어옴");
				response.getWriter().print(LoginDao.getInstance().getLoginCheck(id));
				return;
			}else {
				if(	LoginDao.getInstance().userCheck(svo) != null) {
					LoginDao.getInstance().setLogin_Fail_Count(lFailCount); //카운트를 4로 변경
					response.getWriter().print('y');					
				}
			}
		}		

		//사용자가 로그인에 실패했을 때
		if(getSvo == null) {
			LoginDao.getInstance().setLogin_Fail_Count_Add(id); //로그인실패횟수 1 증가
			LoginDao.getInstance().setLogin_Fail_Time(id); //로그인실패시간 설정
			response.getWriter().print('n');
			return;
		}else {
			request.getSession().setAttribute("id", getSvo.getId());
			request.getSession().setAttribute("name", getSvo.getName());
			lFailCount.remove("cnt");
			lFailCount.put("cnt", 0);
			LoginDao.getInstance().setLogin_Fail_Count(lFailCount); //카운트를 0으로 변경
			response.getWriter().print('y');
		}
	}

}
