package com.inc.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.inc.util.MyBatisConnector;
import com.inc.vo.SignupVo;

public class SignUpDao {
	private static SignUpDao single;
	private SqlSessionFactory factory;
	
	private SignUpDao() {
		factory = MyBatisConnector.getInstance().getConnector();
	}
	
	public static SignUpDao getInstance() {
		if(single == null) {
			single = new SignUpDao();
		}
		return single;
	}
	
	public void signUpInsert(SignupVo svo) {
		SqlSession session = factory.openSession(true);
		
		session.insert("signUp.signUpInsert",svo);
		session.close();
	}
	
	public String getIdCheck(String id) {
		SqlSession session = factory.openSession();
		
		String getId = session.selectOne("signUp.getIdCheck",id);
		session.close();
		
		return getId;
	}

	
	
}
