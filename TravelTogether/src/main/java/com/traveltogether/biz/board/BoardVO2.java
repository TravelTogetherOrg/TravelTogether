package com.traveltogether.biz.board;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;


@Entity
@Table(name="boardtest")
public class BoardVO2 {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long board_number;
	
	@Column(name = "festival_name", length = 100)
	private String festival_name;
	
	//@ManyToOne
	@Column(name="member_id", length = 50)
	private String memberId; //BoardRepository에서 언더바가 안먹혀서 바꿈
	
	@Column(name="board_total_people")
	private int boardTotalPeople;
	
	@Column(name="board_write_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date board_write_date;
	
	@Column(name = "board_title", length = 50)
	private String board_title;
	
	@Column(name="board_content", columnDefinition = "TEXT")
	private String boardContent;
	
	@Column(nullable=true, columnDefinition = "integer default 0")
	private int board_view_count;
	
	@Column(nullable=true)
	@Temporal(TemporalType.TIMESTAMP)
	private Date board_update_date;
	
	//파일업로드
	@Transient
	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
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
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String member_id) {
		this.memberId = member_id;
	}
	public int getBoardTotalPeople() {
		return boardTotalPeople;
	}
	public void setBoardTotalPeople(int boardTotalPeople) {
		this.boardTotalPeople = boardTotalPeople;
	}
	public Date getBoard_write_date() {
		return board_write_date;
	}
	public void setBoard_write_date(Date board_write_date) {
		this.board_write_date = board_write_date;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getboardContent() {
		return boardContent;
	}
	public void setboardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoard_view_count() {
		return board_view_count;
	}
	public void setBoard_view_count(int board_view_count) {
		this.board_view_count = board_view_count;
	}
	public Date getBoard_update_date() {
		return board_update_date;
	}
	public void setBoard_update_date(Date board_update_date) {
		this.board_update_date = board_update_date;
	}
	
	
	@Override
	public String toString() {
		return "BoardVO [board_number=" + board_number + ", festival_name=" + festival_name + ", memberId=" + memberId
				+ ", boardTotalPeople=" + boardTotalPeople + ", board_write_date=" + board_write_date
				+ ", board_title=" + board_title + ", boardContent=" + boardContent + ", board_view_count="
				+ board_view_count + ", board_update_date=" + board_update_date + ", uploadFile=" + uploadFile + "]";
	}
	
	
	
	
}
