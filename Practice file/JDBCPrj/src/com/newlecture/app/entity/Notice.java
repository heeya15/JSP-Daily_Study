package com.newlecture.app.entity;

import java.util.Date;

public class Notice {
  
	//구조가 노출되지 않도록 하기위해 private 접근 제어이용.
	private int id1;
	private String title ; 
	private String writer_id ;
	private String content ;
	private Date regdate;
	private int hit ;
	public Notice() {
		// TODO Auto-generated constructor stub
	}
	
	public Notice(int id1, String title, String writer_id, String content, Date regdate, int hit) {
		
		this.id1 = id1;
		this.title = title;
		this.writer_id = writer_id;
		this.content = content;
		this.regdate = regdate;
		this.hit = hit;
	}

	public int getId1() {
		return id1;
	}
	public void setId1(int id1) {
		this.id1 = id1;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}	
	
}
