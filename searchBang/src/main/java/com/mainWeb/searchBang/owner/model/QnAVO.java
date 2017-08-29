package com.mainWeb.searchBang.owner.model;

public class QnAVO {
	private int qna_no;
	private String subject;
	private String content;
	private String reply;
	private String ownerEmail;

	public String getSubject() {
		return subject;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getOwnerEmail() {
		return ownerEmail;
	}

	public void setOwnerEmail(String ownerEmail) {
		this.ownerEmail = ownerEmail;
	}

	@Override
	public String toString() {
		return "QnAVO [qna_no=" + qna_no + ", subject=" + subject + ", content=" + content + ", reply=" + reply
				+ ", ownerEmail=" + ownerEmail + "]";
	}

}
