package main.java.com.kh.board.model.vo;

public class Board {
	  int boardNo;
	private String writer;
	private String boardContent;
	private int boardCount;
	private String boardDate;
	private String boardStatus;

	public Board() {}

	public Board(int boardNo, String writer, String boardContent, int boardCount, String boardDate,
			String boardStatus) {
		super();
		this.boardNo = boardNo;
		this.writer = writer;
		this.boardContent = boardContent;
		this.boardCount = boardCount;
		this.boardDate = boardDate;
		this.boardStatus = boardStatus;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", writer=" + writer + ", boardContent=" + boardContent + ", boardCount="
				+ boardCount + ", boardDate=" + boardDate + ", boardStatus=" + boardStatus + "]";
	};
	
}
