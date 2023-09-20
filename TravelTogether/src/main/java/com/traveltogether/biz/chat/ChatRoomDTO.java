package com.traveltogether.biz.chat;

import java.sql.Timestamp;
import java.util.Date;

public class ChatRoomDTO {
	
	private int chatNumber;
	private String chatTitle;
	private String memberId;
	private Timestamp chatCreateDate;
	private String chatPassword;
	private String chatRegion;
	
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
	public String getChatPassword() {
		return chatPassword;
	}
	public void setChatPassword(String chatPassword) {
		this.chatPassword = chatPassword;
	}
	public String getChatRegion() {
		return chatRegion;
	}
	public void setChatRegion(String chatRegion) {
		this.chatRegion = chatRegion;
	}
}
