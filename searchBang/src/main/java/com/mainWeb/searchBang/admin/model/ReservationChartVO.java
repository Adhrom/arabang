package com.mainWeb.searchBang.admin.model;

public class ReservationChartVO {
	private String date;
	private int value;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "ReservationChartVO [date=" + date + ", value=" + value + "]";
	}

}
