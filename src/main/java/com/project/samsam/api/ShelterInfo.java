package com.project.samsam.api;

public class ShelterInfo {
	private String careRecNo;	// 보호소 번호
	private String careNm;
	private String careAddr;
	private String careTel;
	private String dataStdDt;
	private String divisionNm;
	private String jibunAddr;
	private String orgNm; 
	private String rnum; 
	
	public String getCareRecNo() {
		return careRecNo;
	}
	public void setCareRecNo(String careRecNo) {
		this.careRecNo = careRecNo;
	}
	public String getCareNm() {
		return careNm;
	}
	public void setCareNm(String careNm) {
		this.careNm = careNm;
	}
	public String getCareAddr() {
		return careAddr;
	}
	public void setCareAddr(String careAddr) {
		this.careAddr = careAddr;
	}
	public String getCareTel() {
		return careTel;
	}
	public void setCareTel(String careTel) {
		this.careTel = careTel;
	}
	public String getDataStdDt() {
		return dataStdDt;
	}
	public void setDataStdDt(String dataStdDt) {
		this.dataStdDt = dataStdDt;
	}
	public String getDivisionNm() {
		return divisionNm;
	}
	public void setDivisionNm(String divisionNm) {
		this.divisionNm = divisionNm;
	}
	public String getJibunAddr() {
		return jibunAddr;
	}
	public void setJibunAddr(String jibunAddr) {
		this.jibunAddr = jibunAddr;
	}
	public String getOrgNm() {
		return orgNm;
	}
	public void setOrgNm(String orgNm) {
		this.orgNm = orgNm;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	@Override
	public String toString() {
		return "ShelterInfo [careRecNo=" + careRecNo + ", careNm=" + careNm + ", careAddr=" + careAddr + ", careTel="
				+ careTel + ", dataStdDt=" + dataStdDt + ", divisionNm=" + divisionNm + ", jibunAddr=" + jibunAddr
				+ ", orgNm=" + orgNm + "]";
	}

	
	
}
