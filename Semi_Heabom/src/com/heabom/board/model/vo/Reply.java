package com.heabom.board.model.vo;

public class Reply {
	
	private String replyNo;
	private String replyWriter;
	private String boardNo;
	private String replyContent;
	private String replyDate;
	private String replyStatus;
	private String nickname;
	private String filePath;
	private String changeName;
	private String grade;
	private String medal;
	private boolean isLiked;
	private int countLike;
	
	public Reply() {}
	
	public Reply(String replyNo, String replyWriter, String boardNo, String replyContent, String replyDate,
			String replyStatus, String nickname, String filePath, String changeName, String grade, String medal,
			boolean isLiked, int countLike) {
		super();
		this.replyNo = replyNo;
		this.replyWriter = replyWriter;
		this.boardNo = boardNo;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.replyStatus = replyStatus;
		this.nickname = nickname;
		this.filePath = filePath;
		this.changeName = changeName;
		this.grade = grade;
		this.medal = medal;
		this.isLiked = isLiked;
		this.countLike = countLike;
	}



	public String getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getMedal() {
		return medal;
	}

	public void setMedal(String medal) {
		this.medal = medal;
	}

	public boolean isLiked() {
		return isLiked;
	}

	public void setLiked(boolean isLiked) {
		this.isLiked = isLiked;
	}

	public int getCountLike() {
		return countLike;
	}

	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyWriter=" + replyWriter + ", boardNo=" + boardNo + ", replyContent="
				+ replyContent + ", replyDate=" + replyDate + ", replyStatus=" + replyStatus + ", nickname=" + nickname
				+ ", filePath=" + filePath + ", changeName=" + changeName + ", grade=" + grade + ", medal=" + medal
				+ ", isLiked=" + isLiked + ", countLike=" + countLike + "]";
	}

	
}
