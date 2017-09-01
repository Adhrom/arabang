package com.mainWeb.searchBang.owner.model;

public class SalesVO {
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
		return "Salse [date=" + date + ", value=" + value + "]";
	}

}
