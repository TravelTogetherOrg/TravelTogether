package com.traveltogether.biz.member;


import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Table(name="MEMBER")
@Entity
public class MemberVO {
	
	@Id
	//@GeneratedValue
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_nickname;
	private String member_gender;
	
	@Temporal(TemporalType.DATE)
	private Date member_birthday;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Timestamp member_create_date;
	private String member_profile_image;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
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
	public String getMember_profile_image() {
		return member_profile_image;
	}
	public void setMember_profile_image(String member_profile_image) {
		this.member_profile_image = member_profile_image;
	}
}
