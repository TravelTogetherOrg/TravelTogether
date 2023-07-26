package com.traveltogether.biz.board;

public class Criteria {
	private int pageNumber;
	private int amount;
	
	public Criteria() {
		this(1,16);
	}

	public Criteria(int pageNumber, int amount) {
		this.pageNumber = pageNumber;
		this.amount = amount;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	private String festival_name;

	public String getFestival_name() {
		return festival_name;
	}
	
	public void setFestival_name(String festival_name) {
		this.festival_name = festival_name;
	}
}
