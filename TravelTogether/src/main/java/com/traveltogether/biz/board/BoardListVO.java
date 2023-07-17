package com.traveltogether.biz.board;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;


public class BoardListVO {
	
	private Long board_number;
	private String festival_name;
	private String member_id;
	private String board_start_date;
	private String board_end_date;
	private String board_title;
	private String board_content;
	private int board_view_count;
	
	private String festival_startdate;
	private String festival_enddate;
	
	private String member_nickname;
	private String member_gender;
	private Date member_birthday;
	private String member_profile_image;
	
	private int member_age;
	public int getMember_age() {
		return member_age;
	}
	public void setMember_age(Date member_birthday) {
		//Date->LocalDate
		LocalDate localDate = member_birthday.toInstant()   // Date -> Instant
                .atZone(ZoneId.systemDefault())  // Instant -> ZonedDateTime
                .toLocalDate();
		LocalDate now = LocalDate.now();
		int member_age = now.minusYears(localDate.getYear()).getYear();
		if (localDate.plusYears(member_age).isAfter(now)) { 
			member_age = member_age -1;
		}
		// 00대로 출력해야해서 /10
		this.member_age = member_age/10;
	}
	
	private String board_image_file;
	private String board_image_file_path;
	
	public Long getBoard_number() {
		return board_number;
	}
	public void setBoard_number(Long board_number) {
		this.board_number = board_number;
	}
	public String getFestival_name() {
		return festival_name;
	}
	public void setFestival_name(String festival_name) {
		this.festival_name = festival_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBoard_start_date() {
		return board_start_date;
	}
	public void setBoard_start_date(String board_start_date) {
		this.board_start_date = board_start_date;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
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
		setMember_age(member_birthday);
		this.member_birthday = member_birthday;
	}
	public String getMember_profile_image() {
		return member_profile_image;
	}
	public void setMember_profile_image(String member_profile_image) {
		this.member_profile_image = member_profile_image;
	}
	public String getBoard_image_file() {
		return board_image_file;
	}
	public void setBoard_image_file(String board_image_file) {
		this.board_image_file = board_image_file;
	}
	public String getBoard_image_file_path() {
		return board_image_file_path;
	}
	public void setBoard_image_file_path(String board_image_file_path) {
		this.board_image_file_path = board_image_file_path;
	}
	
	public String getBoard_end_date() {
		return board_end_date;
	}
	public void setBoard_end_date(String board_end_date) {
		this.board_end_date = board_end_date;
	}
	public String getFestival_startdate() {
		return festival_startdate;
	}
	public void setFestival_startdate(String festival_startdate) throws Exception {
		
		this.festival_startdate = festival_startdate.substring(0,4)+"-"+festival_startdate.substring(4,6)+"-"+festival_startdate.substring(6);
	}
	public String getFestival_enddate() {
		return festival_enddate;
	}
	public void setFestival_enddate(String festival_enddate) {
		this.festival_enddate = festival_enddate.substring(0,4)+"-"+festival_enddate.substring(4,6)+"-"+festival_enddate.substring(6);;
	}
	
	@Override
	public String toString() {
		return "BoardListVO [board_number=" + board_number + ", festival_name=" + festival_name + ", member_id="
				+ member_id + ", board_start_date=" + board_start_date + ", board_end_date=" + board_end_date
				+ ", board_title=" + board_title + ", board_content=" + board_content + ", board_view_count="
				+ board_view_count + ", festival_startdate=" + festival_startdate + ", festival_enddate="
				+ festival_enddate + ", member_nickname=" + member_nickname + ", member_gender=" + member_gender
				+ ", member_birthday=" + member_birthday + ", member_profile_image=" + member_profile_image
				+ ", member_age=" + member_age + ", board_image_file=" + board_image_file + ", board_image_file_path="
				+ board_image_file_path + "]";
	}
	
	
}
