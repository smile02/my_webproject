package com.inc.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.inc.util.MyBatisConnector;
import com.inc.vo.SignupVo;

public class LoginDao {
	private static LoginDao single;
	private SqlSessionFactory factory;
	
	private LoginDao() {
		factory = MyBatisConnector.getInstance().getConnector();
	}
	
	public static LoginDao getInstance() {
		if(single == null) {
			single = new LoginDao();
		}
		return single;
	}
	
	public SignupVo userCheck(SignupVo svo) {
		SqlSession session = factory.openSession();
		
		SignupVo getSvo = session.selectOne("login.userCheck",svo);
		session.close();
		
		return getSvo;
	}
	

	public void setLogin_Fail_Count_Add(String id) {
		SqlSession session = factory.openSession(true);
		
		session.update("login.setLogin_Fail_Count_Add",id);
		session.close();
	}

	public void setLogin_Fail_Time(String id) {
		SqlSession session = factory.openSession(true);
		
		session.update("login.setLogin_Fail_Time",id);
		session.close();		
	}

	public int getLoginCheck(String id) {
		SqlSession session = factory.openSession();
		
		int loginCheck = session.selectOne("login.getLoginCheck",id);
		session.close();
		
		return loginCheck;
	}

	public SignupVo getLoginTime(String id) {
		SqlSession session = factory.openSession();
		SignupVo timeCheck = session.selectOne("login.getLoginTime",id);
		session.close();
		
		return timeCheck;
	}

	public void setLogin_Fail_Count(Map<String,Object> check) {
		SqlSession session = factory.openSession(true);
		session.update("login.setLogin_Fail_Count",check);
		session.close();		
	}
}
