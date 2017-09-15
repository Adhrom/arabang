package com.mainWeb.searchBang.user.model;

public class ViewReservation {
	private int reservation_no;
	private String accomName;
	private String accomAddress;
	private String accomPhone;
	private String roomType;
	private String checkIn;
	private String checkOut;
	private int price;
	private int accom_no;

	public int getAccom_no() {
		return accom_no;
	}

	public void setAccom_no(int accom_no) {
		this.accom_no = accom_no;
	}

	public int getReservation_no() {
		return reservation_no;
	}

	public void setReservation_no(int reservation_no) {
		this.reservation_no = reservation_no;
	}

	public String getAccomName() {
		return accomName;
	}

	public void setAccomName(String accomName) {
		this.accomName = accomName;
	}

	public String getAccomAddress() {
		return accomAddress;
	}

	public void setAccomAddress(String accomAddress) {
		this.accomAddress = accomAddress;
	}

	public String getAccomPhone() {
		return accomPhone;
	}

	public void setAccomPhone(String accomPhone) {
		this.accomPhone = accomPhone;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "ViewReservation [reservation_no=" + reservation_no + ", accomName=" + accomName + ", accomAddress="
				+ accomAddress + ", accomPhone=" + accomPhone + ", roomType=" + roomType + ", checkIn=" + checkIn
				+ ", checkOut=" + checkOut + ", price=" + price + ", accom_no=" + accom_no + "]";
	}

}
