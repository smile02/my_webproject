package com.inc.vo;

import java.util.List;

public class PhotoVo {
	/*id number primary key,
    u_id varchar2(40) references users(id) on delete cascade,
    content clob,
    uri varchar2(30) not null,
    regdate timestamp
    */
	private int id, good, bad;
	private String u_id, content, uri, regdate;
	private SignupVo svo;
	
	public SignupVo getSvo() {
		return svo;
	}
	public void setSvo(SignupVo svo) {
		this.svo = svo;
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
	public String getUri() {
		return uri;
	}
	public void setUri(String uri) {
		this.uri = uri;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	
	
}
