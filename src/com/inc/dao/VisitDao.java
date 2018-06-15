package com.inc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.inc.util.MyBatisConnector;
import com.inc.vo.VisitVo;

public class VisitDao {
	private static VisitDao single;
	private SqlSessionFactory factory;
	
	private VisitDao() {
		factory = MyBatisConnector.getInstance().getConnector();
	}
	
	public static VisitDao getInstance() {
		if(single == null) {
			single = new VisitDao();
		}
		return single;
	}
	
	public List<VisitVo> visitSelectList(){
		SqlSession session = factory.openSession();
		
		List<VisitVo> visitList = session.selectList("visit.visitSelectList");
		session.close();
		
		return visitList;
	}
	
	public void visitInsert(VisitVo vvo) {
		SqlSession session = factory.openSession(true);
		
		session.insert("visit.visitInsert",vvo);
		session.close();
	}
	
	public void visitDelete(int id) {
		SqlSession session = factory.openSession(true);
		
		session.delete("visit.visitDelete",id);
		session.close();
	}
}
