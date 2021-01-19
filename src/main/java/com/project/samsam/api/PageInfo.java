package com.project.samsam.api;

public class PageInfo {

	private int pageNo;
	private int numOfRows;
	private int totalCount;
	
	// 시작번호, 끝번호, 
	private int startNo;
	private int endNo;
	
	// 가장 마지막 번호
	private int maxNo;
	
	// 생성자
	public PageInfo() {
		this(1,1,1);
	}
	
	
	public PageInfo(int pageNo, int numOfRows, int totalCount) {
		this.pageNo = pageNo;
		this.numOfRows = numOfRows;
		this.totalCount = totalCount;
	}


	public int getMaxNo() {
		return maxNo;
	}
	public void setMaxNo(int maxNo) {
		this.maxNo = maxNo;
	}
	
	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(int numOfRows) {
		this.numOfRows = numOfRows;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	@Override
	public String toString() {
		return "PageInfo [pageNo=" + pageNo + ", numOfRows=" + numOfRows + ", totalCount=" + totalCount + "]";
	}
	
	
		
}
