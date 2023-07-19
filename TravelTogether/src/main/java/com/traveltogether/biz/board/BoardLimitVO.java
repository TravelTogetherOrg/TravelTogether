package com.traveltogether.biz.board;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

//@Entity
//@Table(name="board_limit")
public class BoardLimitVO {
	
	//@Id
	private int board_limit_number;
	private String festival_name;
	private String member_id;
	private int board_limit_count;
	
	public int getBoard_limit_number() {
		return board_limit_number;
	}
	public void setBoard_limit_number(int board_limit_number) {
		this.board_limit_number = board_limit_number;
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
	public int getBoard_limit_count() {
		return board_limit_count;
	}
	public void setBoard_limit_count(int board_limit_count) {
		this.board_limit_count = board_limit_count;
	}
	@Override
	public String toString() {
		return "BoardLimitVO [board_limit_number=" + board_limit_number + ", festival_name=" + festival_name
				+ ", member_id=" + member_id + ", board_limit_count=" + board_limit_count + "]";
	}
	
	
	
}
