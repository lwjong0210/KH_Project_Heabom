package com.heabom.common.model.vo;

public class Like {

	private String memNo;
	private String boardNo;
	
	public Like() {
		
	}

	public Like(String memNo, String boardNo) {
		super();
		this.memNo = memNo;
		this.boardNo = boardNo;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Like [memNo=" + memNo + ", boardNo=" + boardNo + "]";
	}
	
}
