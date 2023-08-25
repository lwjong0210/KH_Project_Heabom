package com.heabom.place.model.vo;

import java.sql.Date;

public class Place {
	private String placeNo;
	private int categoryNo;
	private String writer;
	private int locationNo;
	private Date makeDate;
	private String status;
	private String phone;
	private String address;
	private String placeContent;
	private String startTime;
	private String endTime;
	private int starPoint;
	private String placeUrl;
	private int viewCount;
	private int useTime;
	private int usePrice;
	private String bestStatus;
	
	public Place() {}

	public Place(String placeNo, int categoryNo, String writer, int locationNo, Date makeDate, String status,
			String phone, String address, String placeContent, String startTime, String endTime, int starPoint,
			String placeUrl, int viewCount, int useTime, int usePrice, String bestStatus) {
		super();
		this.placeNo = placeNo;
		this.categoryNo = categoryNo;
		this.writer = writer;
		this.locationNo = locationNo;
		this.makeDate = makeDate;
		this.status = status;
		this.phone = phone;
		this.address = address;
		this.placeContent = placeContent;
		this.startTime = startTime;
		this.endTime = endTime;
		this.starPoint = starPoint;
		this.placeUrl = placeUrl;
		this.viewCount = viewCount;
		this.useTime = useTime;
		this.usePrice = usePrice;
		this.bestStatus = bestStatus;
	}

	public String getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(String placeNo) {
		this.placeNo = placeNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	public Date getMakeDate() {
		return makeDate;
	}

	public void setMakeDate(Date makeDate) {
		this.makeDate = makeDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPlaceContent() {
		return placeContent;
	}

	public void setPlaceContent(String placeContent) {
		this.placeContent = placeContent;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getStarPoint() {
		return starPoint;
	}

	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}

	public String getPlaceUrl() {
		return placeUrl;
	}

	public void setPlaceUrl(String placeUrl) {
		this.placeUrl = placeUrl;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getUseTime() {
		return useTime;
	}

	public void setUseTime(int useTime) {
		this.useTime = useTime;
	}

	public int getUsePrice() {
		return usePrice;
	}

	public void setUsePrice(int usePrice) {
		this.usePrice = usePrice;
	}

	public String getBestStatus() {
		return bestStatus;
	}

	public void setBestStatus(String bestStatus) {
		this.bestStatus = bestStatus;
	}

	@Override
	public String toString() {
		return "Place [placeNo=" + placeNo + ", categoryNo=" + categoryNo + ", writer=" + writer + ", locationNo="
				+ locationNo + ", makeDate=" + makeDate + ", status=" + status + ", phone=" + phone + ", address="
				+ address + ", placeContent=" + placeContent + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", starPoint=" + starPoint + ", placeUrl=" + placeUrl + ", viewCount=" + viewCount + ", useTime="
				+ useTime + ", usePrice=" + usePrice + ", bestStatus=" + bestStatus + "]";
	}
	
	
}
