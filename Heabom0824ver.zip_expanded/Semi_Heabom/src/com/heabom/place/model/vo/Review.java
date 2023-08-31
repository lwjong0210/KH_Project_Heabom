package com.heabom.place.model.vo;

import java.sql.Date;

public class Review {
	private String reNo;
	private String reRefNo;
	private String reWriter;
	private String reContent;
	private int reLikeStar;
	private Date reDate;
	private String reStatus;
	private int reRefStar;
	
	public Review () {}

	

	public Review(String reNo, String reRefNo, String reWriter, String reContent, int reLikeStar, Date reDate,
			String reStatus, int reRefStar) {
		super();
		this.reNo = reNo;
		this.reRefNo = reRefNo;
		this.reWriter = reWriter;
		this.reContent = reContent;
		this.reLikeStar = reLikeStar;
		this.reDate = reDate;
		this.reStatus = reStatus;
		this.reRefStar = reRefStar;
	}



	public int getReRefStar() {
		return reRefStar;
	}

	public void setReRefStar(int reRefStar) {
		this.reRefStar = reRefStar;
	}

	public String getReNo() {
		return reNo;
	}

	public void setReNo(String reNo) {
		this.reNo = reNo;
	}

	public String getReRefNo() {
		return reRefNo;
	}

	public void setReRefNo(String reRefNo) {
		this.reRefNo = reRefNo;
	}

	public String getReWriter() {
		return reWriter;
	}

	public void setReWriter(String reWriter) {
		this.reWriter = reWriter;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
	}

	public int getReLikeStar() {
		return reLikeStar;
	}

	public void setReLikeStar(int reLikeStar) {
		this.reLikeStar = reLikeStar;
	}

	public Date getReDate() {
		return reDate;
	}

	public void setReDate(Date reDate) {
		this.reDate = reDate;
	}

	public String getReStatus() {
		return reStatus;
	}

	public void setReStatus(String reStatus) {
		this.reStatus = reStatus;
	}

	@Override
	public String toString() {
		return "Review [reNo=" + reNo + ", reRefNo=" + reRefNo + ", reWriter=" + reWriter + ", reContent=" + reContent
				+ ", reLikeStar=" + reLikeStar + ", reDate=" + reDate + ", reStatus=" + reStatus + ", reRefStar="
				+ reRefStar + "]";
	}

	
}
