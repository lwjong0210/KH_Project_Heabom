package com.heabom.place.model.vo;

import java.sql.Date;

public class Review {
	private String reviwNo;
	private String placeNo;
	private String reviewWriter;
	private Date reviewDate;
	private String reviewContent;
	
	public Review () {}

	public Review(String reviwNo, String placeNo, String reviewWriter, Date reviewDate, String reviewContent) {
		super();
		this.reviwNo = reviwNo;
		this.placeNo = placeNo;
		this.reviewWriter = reviewWriter;
		this.reviewDate = reviewDate;
		this.reviewContent = reviewContent;
	}

	public String getReviwNo() {
		return reviwNo;
	}

	public void setReviwNo(String reviwNo) {
		this.reviwNo = reviwNo;
	}

	public String getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(String placeNo) {
		this.placeNo = placeNo;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	@Override
	public String toString() {
		return "Review [reviwNo=" + reviwNo + ", placeNo=" + placeNo + ", reviewWriter=" + reviewWriter
				+ ", reviewDate=" + reviewDate + ", reviewContent=" + reviewContent + "]";
	}
	
	
}
