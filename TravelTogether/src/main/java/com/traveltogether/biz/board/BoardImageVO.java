package com.traveltogether.biz.board;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

//@Entity
//@Table(name="board_image")
public class BoardImageVO {
	
	//@Id
	private int board_number;
	private String board_image_file;
	private String board_image_file_path;
	
	public int getBoard_number() {
		return board_number;
	}
	public void setBoard_number(int board_number) {
		this.board_number = board_number;
	}
	public String getBoard_image_file() {
		return board_image_file;
	}
	public void setBoard_image_file(String board_image_file) throws IOException {
		//URLEncoder.encode(board_image_file,"utf-8")
		this.board_image_file = board_image_file;
	}
	public String getBoard_image_file_path() {
		return board_image_file_path;
	}
	public void setBoard_image_file_path(String board_image_file_path) {
		this.board_image_file_path = board_image_file_path;
	}
	
	@Override
	public String toString() {
		return "BoardImageVO [board_number=" + board_number + ", board_image_file=" + board_image_file
				+ ", board_image_file_path=" + board_image_file_path + "]";
	}
	
}
