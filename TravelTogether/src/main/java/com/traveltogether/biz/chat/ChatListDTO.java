package com.traveltogether.biz.chat;

import java.util.Date;

public class ChatListDTO {
	private int chat_number;
	private String chat_title;
	private String chat_create_name;
	private String member_id;
	private Date chat_create_date;
	
	
	
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
	public String getChat_create_name() {
		return chat_create_name;
	}
	public void setChat_create_name(String chat_create_name) {
		this.chat_create_name = chat_create_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getChat_create_date() {
		return chat_create_date;
	}
	public void setChat_create_date(Date chat_create_date) {
		this.chat_create_date = chat_create_date;
	}

}
