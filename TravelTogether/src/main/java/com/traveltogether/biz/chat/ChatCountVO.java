package com.traveltogether.biz.chat;

import java.sql.Timestamp;
import java.util.Date;

public class ChatCountVO {
	
	private int chat_number;
	private String chat_title;
	private String member_id;
	private Timestamp chat_create_date;
	private int count;

	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Timestamp getChat_create_date() {
		return chat_create_date;
	}
	public void setChat_create_date(Timestamp chat_create_date) {
		this.chat_create_date = chat_create_date;
	}
	public int getChat_number() {
		return chat_number;
	}
	public void setChat_number(int chat_number) {
		this.chat_number = chat_number;
	}
	public String getChat_title() {
		return chat_title;
	}
	public void setChat_title(String chat_title) {
		this.chat_title = chat_title;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	


	
	
	
}
