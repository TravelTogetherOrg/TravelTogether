package com.traveltogether.biz.board;

public class CommentVO {

	private int comment_number;
	private int board_number;
	private String member_id;
	private String comment_content;
	private int comment_class;
	private String comment_write_date;
	private String comment_update_date;
	
	public int getComment_number() {
		return comment_number;
	}
	public void setComment_number(int comment_number) {
		this.comment_number = comment_number;
	}
	public int getBoard_number() {
		return board_number;
	}
	public void setBoard_number(int board_number) {
		this.board_number = board_number;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public int getComment_class() {
		return comment_class;
	}
	public void setComment_class(int comment_class) {
		this.comment_class = comment_class;
	}
	public String getComment_write_date() {
		return comment_write_date;
	}
	public void setComment_write_date(String comment_write_date) {
		this.comment_write_date = comment_write_date;
	}
	public String getComment_update_date() {
		return comment_update_date;
	}
	public void setComment_update_date(String comment_update_date) {
		this.comment_update_date = comment_update_date;
	}
	
	@Override
	public String toString() {
		return "CommentVO [comment_number=" + comment_number + ", board_number=" + board_number + ", member_id="
				+ member_id + ", comment_content=" + comment_content + ", comment_class=" + comment_class
				+ ", comment_write_date=" + comment_write_date + ", comment_update_date=" + comment_update_date + "]";
	}
	
}
