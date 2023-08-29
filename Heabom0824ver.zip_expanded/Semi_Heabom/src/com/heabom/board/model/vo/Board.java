package com.heabom.board.model.vo;

public class Board {

	private String boardNo;
	private String boardTitle;
	private String writer;
	private String boardContent;
	private int boardCount;
	private String createDate;
	private String boardStatus;
	private String boardCategory;
	private String boardup;
	
	public Board() {}
	
	public Board(String boardNo, String boardTitle, String writer, String boardContent, int boardCount,
			String createDate, String boardStatus, String boardCategory, String boardup, int countReply) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.writer = writer;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.createDate = createDate;
		this.boardStatus = boardStatus;
		this.boardCategory = boardCategory;
		this.boardup = boardup;
		this.countReply = countReply;
	}


	public Board(String boardNo, String boardTitle, String writer, int boardCount, String createDate,
			String boardCategory, int countReply) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.writer = writer;
		this.boardCount = boardCount;
		this.createDate = createDate;
		this.boardCategory = boardCategory;
		this.countReply = countReply;
	}
	
	private int countReply;

	public int getCountReply() {
		return countReply;
	}

	public void setCountReply(int countReply) {
		this.countReply = countReply;
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

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
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

	public String getBoardup() {
		return boardup;
	}

	public void setBoardup(String boardup) {
		this.boardup = boardup;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", writer=" + writer + ", boardContent="
				+ boardContent + ", boardCount=" + boardCount + ", createDate=" + createDate + ", boardStatus="
				+ boardStatus + ", boardCategory=" + boardCategory + ", boardup=" + boardup + ", countReply="
				+ countReply + "]";
	}

}
