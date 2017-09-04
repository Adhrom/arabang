package com.mainWeb.searchBang.admin.model;

public class OwnerCountVO {
	private String date;
	private int visits;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getVisits() {
		return visits;
	}

	public void setVisits(int visits) {
		this.visits = visits;
	}

	@Override
	public String toString() {
		return "OwnerCountVO [date=" + date + ", visits=" + visits + "]";
	}

}
