package com.inc.vo;

import java.util.List;

public class VisitVo {
	/*
	 *  id number primary key,
    u_id varchar2(40) references users(id) on delete cascade,
    content clob,
    regdate timestamp
	 */
	private int id;
	private String u_id, content, regdate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
