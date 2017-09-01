package com.mainWeb.searchBang.user.model;

public class ReservationVO {
	private int reservation_no;
	private String memberEmail;
	private int accom_no;
	private int room_no;
	private String checkIn;
	private String checkOut;
	private String reviewCheck;
	private int price;

	public int getReservation_no() {
		return reservation_no;
	}

	public void setReservation_no(int reservation_no) {
		this.reservation_no = reservation_no;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public int getAccom_no() {
		return accom_no;
	}

	public void setAccom_no(int accom_no) {
		this.accom_no = accom_no;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public String getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	public String getReviewCheck() {
		return reviewCheck;
	}

	public void setReviewCheck(String reviewCheck) {
		this.reviewCheck = reviewCheck;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "ReservationVO [reservation_no=" + reservation_no + ", memberEmail=" + memberEmail + ", accom_no="
				+ accom_no + ", room_no=" + room_no + ", checkIn=" + checkIn + ", checkOut=" + checkOut
				+ ", reviewCheck=" + reviewCheck + ", price=" + price + "]";
	}

}
