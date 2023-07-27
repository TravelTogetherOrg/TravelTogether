package com.traveltogether.biz.board;


public class CommentVO {

	private int comment_number;
	private int board_number;
	//private String member_id;
	private String comment_content;
	private int comment_group;
	private int comment_depth;
	private String comment_write_date;
	private String comment_update_date;
	
	private String member_nickname;
	
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	//댓글 수
	private int count;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	//댓글 작성자 프로필 이미지
	private String member_profile_url;
	
	public String getMember_profile_url() {
		return member_profile_url;
	}
	public void setMember_profile_url(String member_profile_url) {
		this.member_profile_url = member_profile_url;
	}
	
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
	/*
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	*/
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public int getComment_group() {
		return comment_group;
	}
	public void setComment_group(int comment_group) {
		this.comment_group = comment_group;
	}
	public int getComment_depth() {
		return comment_depth;
	}
	public void setComment_depth(int comment_depth) {
		this.comment_depth = comment_depth;
	}
	public String getComment_write_date() {
		return comment_write_date.substring(0, 19);
	}
	public void setComment_write_date(String comment_write_date) {
		this.comment_write_date = comment_write_date;
	}
	public String getComment_update_date() {
		return comment_update_date.substring(0, 19);
	}
	public void setComment_update_date(String comment_update_date) {
		this.comment_update_date = comment_update_date;
	}
	
	@Override
	public String toString() {
		return "CommentVO [comment_number=" + comment_number + ", board_number=" + board_number + ", comment_content="
				+ comment_content + ", comment_group=" + comment_group + ", comment_depth=" + comment_depth
				+ ", comment_write_date=" + comment_write_date + ", comment_update_date=" + comment_update_date
				+ ", member_nickname=" + member_nickname + "]";
	}
	
}
