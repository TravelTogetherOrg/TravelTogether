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
	
	private String festival_name;
	private String festival_startdate;
	private String festival_enddate;
	private String festival_address;
	private String festival_detail_information;
	private String festival_showaddress;
	private String festival_number;
	
	
	
	private char AdminDeleteBoard;
	private String AdminMemberBoardList;
	
	private String board_title;
	private String board_start_date;
	private String board_end_date;
	private int board_total_people;
	private Timestamp board_write_date;
	private String board_content;
	private int board_view_count;
	private Timestamp board_update_date;
	private int board_number;
	

	
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

	
	public String getFestival_name() {
		return festival_name;
	}
	public void setFestival_name(String festival_name) {
		this.festival_name = festival_name;
	}
	public String getFestival_startdate() {
		return festival_startdate;
	}
	public void setFestival_startdate(String festival_startdate) {
		this.festival_startdate = festival_startdate;
	}
	public String getFestival_enddate() {
		return festival_enddate;
	}
	public void setFestival_enddate(String festival_enddate) {
		this.festival_enddate = festival_enddate;
	}
	public String getFestival_address() {
		return festival_address;
	}
	public void setFestival_address(String festival_address) {
		this.festival_address = festival_address;
	}
	public String getFestival_detail_information() {
		return festival_detail_information;
	}
	public void setFestival_detail_information(String festival_detail_information) {
		this.festival_detail_information = festival_detail_information;
	}
	public String getFestival_showaddress() {
		return festival_showaddress;
	}
	public void setFestival_showaddress(String festival_showaddress) {
		this.festival_showaddress = festival_showaddress;
	}
	public String getFestival_number() {
		return festival_number;
	}
	public void setFestival_number(String festival_number) {
		this.festival_number = festival_number;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_start_date() {
		return board_start_date;
	}
	public void setBoard_start_date(String board_start_date) {
		this.board_start_date = board_start_date;
	}
	public String getBoard_end_date() {
		return board_end_date;
	}
	public void setBoard_end_date(String board_end_date) {
		this.board_end_date = board_end_date;
	}
	public int getBoard_total_people() {
		return board_total_people;
	}
	public void setBoard_total_people(int board_total_people) {
		this.board_total_people = board_total_people;
	}
	public Timestamp getBoard_write_date() {
		return board_write_date;
	}
	public void setBoard_write_date(Timestamp board_write_date) {
		this.board_write_date = board_write_date;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getBoard_view_count() {
		return board_view_count;
	}
	public void setBoard_view_count(int board_view_count) {
		this.board_view_count = board_view_count;
	}
	public Timestamp getBoard_update_date() {
		return board_update_date;
	}
	public void setBoard_update_date(Timestamp board_update_date) {
		this.board_update_date = board_update_date;
	}
	public int getBoard_number() {
		return board_number;
	}
	public void setBoard_number(int board_number) {
		this.board_number = board_number;
	}
	public String getAdminMemberBoardList() {
		return AdminMemberBoardList;
	}
	public void setAdminMemberBoardList(String adminMemberBoardList) {
		AdminMemberBoardList = adminMemberBoardList;
	}
	



}

