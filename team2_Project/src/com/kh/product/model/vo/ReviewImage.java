package com.kh.product.model.vo;

public class ReviewImage {
	private int reviewImgNo;
	private String reviewImgName;
	private String reviewImgSrc;
	private int reviewNo;
	
	public ReviewImage() {}

	public ReviewImage(int reviewImgNo, String reviewImgName, String reviewImgSrc, int reviewNo) {
		super();
		this.reviewImgNo = reviewImgNo;
		this.reviewImgName = reviewImgName;
		this.reviewImgSrc = reviewImgSrc;
		this.reviewNo = reviewNo;
	}

	public int getReviewImgNo() {
		return reviewImgNo;
	}

	public void setReviewImgNo(int reviewImgNo) {
		this.reviewImgNo = reviewImgNo;
	}

	public String getReviewImgName() {
		return reviewImgName;
	}

	public void setReviewImgName(String reviewImgName) {
		this.reviewImgName = reviewImgName;
	}

	public String getReviewImgSrc() {
		return reviewImgSrc;
	}

	public void setReviewImgSrc(String reviewImgSrc) {
		this.reviewImgSrc = reviewImgSrc;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	@Override
	public String toString() {
		return "ReviewImage [reviewImgNo=" + reviewImgNo + ", reviewImgName=" + reviewImgName + ", reviewImgSrc="
				+ reviewImgSrc + ", reviewNo=" + reviewNo + "]";
	}
	
	
}
