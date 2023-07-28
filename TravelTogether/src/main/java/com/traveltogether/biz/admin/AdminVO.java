package com.traveltogether.biz.admin;

import java.sql.Date;
import java.sql.Timestamp;



public class AdminVO {
	
	private char AdminDeleteMember;
	private String AdminMemberList;
	
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_nickname;
	private String member_gender;
	private Date member_birthday;
	private Timestamp member_create_date;
	private String member_profile_url;
	private String member_phone_number;	
	
	
	private char AdminDeleteFestival;
	private String AdminFestivalList;
	
	
	
	private char AdminDeleteBoard;
	private String AdminBoardList;
	
	
	
	
	
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public Date getMember_birthday() {
		return member_birthday;
	}
	public void setMember_birthday(Date member_birthday) {
		this.member_birthday = member_birthday;
	}
	public Timestamp getMember_create_date() {
		return member_create_date;
	}
	public void setMember_create_date(Timestamp member_create_date) {
		this.member_create_date = member_create_date;
	}
	public String getMember_profile_url() {
		return member_profile_url;
	}
	public void setMember_profile_url(String member_profile_url) {
		this.member_profile_url = member_profile_url;
	}
	public String getMember_phone_number() {
		return member_phone_number;
	}
	public void setMember_phone_number(String member_phone_number) {
		this.member_phone_number = member_phone_number;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public char getAdminDeleteMember() {
		return AdminDeleteMember;
	}
	public void setAdminDeleteMember(char adminDeleteMember) {
		AdminDeleteMember = adminDeleteMember;
	}
	public char getAdminDeleteFestival() {
		return AdminDeleteFestival;
	}
	public void setAdminDeleteFestival(char adminDeleteFestival) {
		AdminDeleteFestival = adminDeleteFestival;
	}
	public char getAdminDeleteBoard() {
		return AdminDeleteBoard;
	}
	public void setAdminDeleteBoard(char adminDeleteBoard) {
		AdminDeleteBoard = adminDeleteBoard;
	}
	public String getAdminMemberList() {
		return AdminMemberList;
	}
	public void setAdminMemberList(String adminMemberList) {
		AdminMemberList = adminMemberList;
	}
	public String getAdminFestivalList() {
		return AdminFestivalList;
	}
	public void setAdminFestivalList(String adminFestivalList) {
		AdminFestivalList = adminFestivalList;
	}
	public String getAdminBoardList() {
		return AdminBoardList;
	}
	public void setAdminBoardList(String adminBoardList) {
		AdminBoardList = adminBoardList;
	}
	@Override
	public String toString() {
		return "AdminVO [AdminDeleteMember=" + AdminDeleteMember + ", AdminMemberList=" + AdminMemberList
				+ ", member_id=" + member_id + ", member_password=" + member_password + ", member_name=" + member_name
				+ ", member_nickname=" + member_nickname + ", member_gender=" + member_gender + ", member_birthday="
				+ member_birthday + ", member_create_date=" + member_create_date + ", member_profile_url="
				+ member_profile_url + ", member_phone_number=" + member_phone_number + ", AdminDeleteFestival="
				+ AdminDeleteFestival + ", AdminFestivalList=" + AdminFestivalList + ", AdminDeleteBoard="
				+ AdminDeleteBoard + ", AdminBoardList=" + AdminBoardList + "]";
	}
	



}
