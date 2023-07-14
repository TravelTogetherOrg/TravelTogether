package com.traveltogether.biz.board;

public class BoardPageCreate {
	
	private Criteria criteria;
	private int totalCount;
	private int endPage;
	private int beginPage;
	private boolean prev;
	private boolean next;
	
	private final int buttonNumber = 5;
	
	private void calcDataOfPage() {
		
		endPage = (int) (Math.ceil(criteria.getPageNumber() / (double) buttonNumber) * buttonNumber);
		beginPage = (endPage - buttonNumber)+1;
		prev = (beginPage == 1)? false : true;
		next = totalCount <= (endPage * criteria.getAmount()) ? false : true;
		
		if(!next) {
			endPage = (int)Math.ceil(totalCount / (double)criteria.getAmount());
		}
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcDataOfPage();
	}

	public Criteria getCriteria() {
		return criteria;
	}

	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getButtonNumber() {
		return buttonNumber;
	}

	@Override
	public String toString() {
		return "BoardPageCreate [criteria=" + criteria + ", totalCount=" + totalCount + ", endPage=" + endPage
				+ ", beginPage=" + beginPage + ", prev=" + prev + ", next=" + next + ", buttonNumber=" + buttonNumber
				+ "]";
	}
	
	
	
	
	
	
}
