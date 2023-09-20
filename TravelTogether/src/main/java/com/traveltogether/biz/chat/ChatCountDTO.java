package com.traveltogether.biz.chat;

import java.sql.Timestamp;
import java.util.Date;

public class ChatCountDTO {
	
	private int chatNumber;
	private String chatTitle;
	private String memberId;
	private Timestamp chatCreateDate;
	private int count;

	public int getChatNumber() {
		return chatNumber;
	}
	public void setChatNumber(int chatNumber) {
		this.chatNumber = chatNumber;
	}
	public String getChatTitle() {
		return chatTitle;
	}
	public void setChatTitle(String chatTitle) {
		this.chatTitle = chatTitle;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Timestamp getChatCreateDate() {
		return chatCreateDate;
	}
	public void setChatCreateDate(Timestamp chatCreateDate) {
		this.chatCreateDate = chatCreateDate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}

	