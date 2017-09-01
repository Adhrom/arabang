package com.mainWeb.searchBang.user.model;

public class UserVO {

	private String memberEmail;
	private String memberPw;
	private String memberNickname;
	private String memberPhone;

	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
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
	@Override
	public String toString() {
		return "UserVO [memberEmail=" + memberEmail + ", memberPw=" + memberPw + ", memberNickname=" + memberNickname
				+ ", memberPhone=" + memberPhone + "]";
	}
}
