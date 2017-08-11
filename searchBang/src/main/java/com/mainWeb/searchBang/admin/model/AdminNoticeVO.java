package com.mainWeb.searchBang.admin.model;

public class AdminNoticeVO {
	private String subject;
	private String content;
	private String noticeType;
	private int notice_no;

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}

	public String getSubject() {
		return subject;
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

	@Override
	public String toString() {
		return "AdminNoticeVO [subject=" + subject + ", content=" + content + ", noticeType=" + noticeType
				+ ", notice_no=" + notice_no + "]";
	}



}
