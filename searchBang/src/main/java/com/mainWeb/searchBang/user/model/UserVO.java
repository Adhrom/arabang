package com.mainWeb.searchBang.user.model;

import java.sql.Date;

public class UserVO {

	private String memberMail;
	private String memberPw;
	private String memberNickname;
	private String memberPhone;
	private Date memberReg;

	public String getMemberMail() {
		return memberMail;
	}
	public void setMemberMail(String memberMail) {
		this.memberMail = memberMail;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public Date getMemberReg() {
		return memberReg;
	}
	public void setMemberReg(Date memberReg) {
		this.memberReg = memberReg;
	}
}
