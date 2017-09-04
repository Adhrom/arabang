package com.mainWeb.searchBang.owner.model;

public class ReviewCountVO {
	private String title;
	private int value;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "ReviewCountVO [title=" + title + ", value=" + value + "]";
	}

}
