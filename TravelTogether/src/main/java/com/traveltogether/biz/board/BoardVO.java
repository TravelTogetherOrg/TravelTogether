package com.traveltogether.biz.board;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.traveltogether.biz.member.MemberVO;

//@Entity //jpa어노테이션은 Not a managed type 오류떠서 추가함
//@Table(name = "board")
public class BoardVO {
	
	//@Id
	private int board_number;
	private String festival_name;
	private String member_id;
	private int board_total_people;
	private String board_start_date;
	private String board_end_date;
	private String board_write_date; //Date
	private String board_title;
	private String board_content;
	private int board_view_count;
	private String board_update_date;
	
	//파일업로드
	//@Transient
	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public int getBoard_number() {
		return board_number;
	}
	public void setBoard_number(int board_number) {
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
	public int getBoard_total_people() {
		return board_total_people;
	}
	public void setBoard_total_people(int board_total_people) {
		this.board_total_people = board_total_people;
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
	public String getBoard_write_date() {
		return board_write_date.substring(0, 19);
	}
	public void setBoard_write_date(String board_write_date) {
		this.board_write_date = board_write_date;
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
	public String getBoard_update_date() {
		return board_update_date.substring(0, 19);
	}
	public void setBoard_update_date(String board_update_date) {
		this.board_update_date = board_update_date;
	}
	@Override
	public String toString() {
		return "BoardVO [board_number=" + board_number + ", festival_name=" + festival_name + ", member_id=" + member_id
				+ ", board_total_people=" + board_total_people + ", board_start_date=" + board_start_date
				+ ", board_end_date=" + board_end_date + ", board_write_date=" + board_write_date + ", board_title="
				+ board_title + ", board_content=" + board_content + ", board_view_count=" + board_view_count
				+ ", board_update_date=" + board_update_date + ", uploadFile=" + uploadFile + "]";
	}
	
	
	
	
	
	
	
	
}
