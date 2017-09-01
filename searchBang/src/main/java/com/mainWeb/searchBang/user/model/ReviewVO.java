package com.mainWeb.searchBang.user.model;

public class ReviewVO {
	private int review_no;
	private String memberEmail;
	private int accom_no;
	private int reviewGrade;
	private String content; 
	private String reviewDate;
	private String decalration;



	public String getDecalration() {
		return decalration;
	}

	public void setDecalration(String decalration) {
		this.decalration = decalration;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
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

	public int getReviewGrade() {
		return reviewGrade;
	}

	public void setReviewGrade(int reviewGrade) {
		this.reviewGrade = reviewGrade;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	@Override
	public String toString() {
		return "ReviewVO [review_no=" + review_no + ", memberEmail=" + memberEmail + ", accom_no=" + accom_no
				+ ", reviewGrade=" + reviewGrade + ", content=" + content + ", reviewDate=" + reviewDate + "]";
	}

}
