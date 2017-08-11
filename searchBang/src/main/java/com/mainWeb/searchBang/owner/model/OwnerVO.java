package com.mainWeb.searchBang.owner.model;

public class OwnerVO {
	private String ownerName;
	private String ownerPw;
	private String ownerPhone;
	private String ownerEmail;
	private boolean approve;

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public String getOwnerPw() {
		return ownerPw;
	}

	public void setOwnerPw(String ownerPw) {
		this.ownerPw = ownerPw;
	}

	public String getOwnerPhone() {
		return ownerPhone;
	}

	public void setOwnerPhone(String ownerPhone) {
		this.ownerPhone = ownerPhone;
	}

	public String getOwnerEmail() {
		return ownerEmail;
	}

	public void setOwnerEmail(String ownerEmail) {
		this.ownerEmail = ownerEmail;
	}

	public boolean isApprove() {
		return approve;
	}

	public void setApprove(boolean approve) {
		this.approve = approve;
	}

	@Override
	public String toString() {
		return "OwnerVO [ownerName=" + ownerName + ", ownerPw=" + ownerPw + ", ownerPhone=" + ownerPhone
				+ ", ownerEmail=" + ownerEmail + ", approve=" + approve + "]";
	}

}
