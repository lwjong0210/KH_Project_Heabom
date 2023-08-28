package com.heabom.board.model.vo;

import java.sql.Date;

public class Question {
	private int questionNo;
	private String questionComment;
	private Date questionDate;
	private String qeustionSecret;
	private String status;
	private String questionWriter;
	
	public Question() {}

	public Question(int questionNo, String questionComment, Date questionDate, String qeustionSecret, String status,
			String questionWriter) {
		super();
		this.questionNo = questionNo;
		this.questionComment = questionComment;
		this.questionDate = questionDate;
		this.qeustionSecret = qeustionSecret;
		this.status = status;
		this.questionWriter = questionWriter;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public String getQuestionComment() {
		return questionComment;
	}

	public void setQuestionComment(String questionComment) {
		this.questionComment = questionComment;
	}

	public Date getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
	}

	public String getQeustionSecret() {
		return qeustionSecret;
	}

	public void setQeustionSecret(String qeustionSecret) {
		this.qeustionSecret = qeustionSecret;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getQuestionWriter() {
		return questionWriter;
	}

	public void setQuestionWriter(String questionWriter) {
		this.questionWriter = questionWriter;
	}

	@Override
	public String toString() {
		return "QuestionDao [questionNo=" + questionNo + ", questionComment=" + questionComment + ", questionDate="
				+ questionDate + ", qeustionSecret=" + qeustionSecret + ", status=" + status + ", questionWriter="
				+ questionWriter + "]";
	}
}
