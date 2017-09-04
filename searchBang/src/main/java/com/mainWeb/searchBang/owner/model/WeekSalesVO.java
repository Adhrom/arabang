package com.mainWeb.searchBang.owner.model;

public class WeekSalesVO {
	private String country;
	private int visits;

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getVisits() {
		return visits;
	}

	public void setVisits(int visits) {
		this.visits = visits;
	}

	@Override
	public String toString() {
		return "WeekSalesVO [country=" + country + ", visits=" + visits + "]";
	}

}
