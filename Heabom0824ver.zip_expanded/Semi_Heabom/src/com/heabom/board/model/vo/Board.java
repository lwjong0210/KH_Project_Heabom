package com.heabom.board.model.dao;

import java.sql.Date;

public class Board {
	private String boardNo;
	private String boardTitle;
	private String writer;
	private String boardContent;
	private int boardCount;
	private Date createDate;
	private String boardStatus;
	private String boardCategory;
	
	public Board () {}

	public Board(String boardNo, String boardTitle, String writer, String boardContent, int boardCount, Date createDate,
			String boardStatus, String boardCategory) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.writer = writer;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.createDate = createDate;
		this.boardStatus = boardStatus;
		this.boardCategory = boardCategory;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", writer=" + writer + ", boardContent="
				+ boardContent + ", boardCount=" + boardCount + ", createDate=" + createDate + ", boardStatus="
				+ boardStatus + ", boardCategory=" + boardCategory + "]";
	}
	
	
}
