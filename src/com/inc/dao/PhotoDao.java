package com.inc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.inc.util.MyBatisConnector;
import com.inc.vo.PhotoVo;

public class PhotoDao {
	private static PhotoDao single;
	private SqlSessionFactory factory;
	
	private PhotoDao() {
		factory = MyBatisConnector.getInstance().getConnector();
	}
	
	public static PhotoDao getInstance() {
		if(single == null) {
			single = new PhotoDao();
		}
		return single;
	}
	
	public List<PhotoVo> photoSeletList(){
		SqlSession session = factory.openSession();
		
		List<PhotoVo> photoList = session.selectList("photo.photoSelectList");
		session.close();
		
		return photoList;
	}
	
	public void photoInsert(PhotoVo pvo) {
		SqlSession session = factory.openSession(true);
		
		session.insert("photo.photoInsert",pvo);
		session.close();		
	}
	
	public void photoDelete(int id) {
		SqlSession session = factory.openSession(true);
		
		session.delete("photo.photoDelete",id);
		session.close();
	}
	
	public PhotoVo getName() {
		SqlSession session = factory.openSession();
		
		PhotoVo name = session.selectOne("photo.getName");
		session.close();
		
		return name;
	}

	public void photoGood(int id) {
		SqlSession session = factory.openSession(true);
		
		session.update("photo.good",id);
		session.close();
	}

	public void photoBad(int id) {
		SqlSession session = factory.openSession(true);
		
		session.update("photo.bad",id);
		session.close();
		
	}
}
