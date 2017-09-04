package com.mainWeb.searchBang.user.model;

import java.sql.Date;

public class UserInfoVO {
	private String memberEmail;
	private String memberPw;
	private String memberNickname;
	private String memberPhone;
	private Date memberReg;
	private int point;

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

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

	public Date getMemberReg() {
		return memberReg;
	}

	public void setMemberReg(Date memberReg) {
		this.memberReg = memberReg;
	}

	@Override
	public String toString() {
		return "UserInfoVO [memberEmail=" + memberEmail + ", memberPw=" + memberPw + ", memberNickname="
				+ memberNickname + ", memberPhone=" + memberPhone + ", memberReg=" + memberReg + ", point=" + point
				+ "]";
	}

}
