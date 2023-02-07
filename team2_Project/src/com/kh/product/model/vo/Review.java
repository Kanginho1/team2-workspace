package com.kh.product.model.vo;

import java.sql.Date;

public class Review {
	private int reviewNo;
	private String reviewContent;
	private int reviewStar;
	private Date reviewDate;
	private String reiviewAnsContent;
	private Date reviewAnsDate;
	private String delYn;
	private int productNo;
	private int memNo;
	private int managerNo;
	
	public Review() {}

	public Review(int reviewNo, String reviewContent, int reviewStar, Date reviewDate, String reiviewAnsContent,
			Date reviewAnsDate, String delYn, int productNo, int memNo, int managerNo) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.reviewStar = reviewStar;
		this.reviewDate = reviewDate;
		this.reiviewAnsContent = reiviewAnsContent;
		this.reviewAnsDate = reviewAnsDate;
		this.delYn = delYn;
		this.productNo = productNo;
		this.memNo = memNo;
		this.managerNo = managerNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReiviewAnsContent() {
		return reiviewAnsContent;
	}

	public void setReiviewAnsContent(String reiviewAnsContent) {
		this.reiviewAnsContent = reiviewAnsContent;
	}

	public Date getReviewAnsDate() {
		return reviewAnsDate;
	}

	public void setReviewAnsDate(Date reviewAnsDate) {
		this.reviewAnsDate = reviewAnsDate;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", reviewStar=" + reviewStar
				+ ", reviewDate=" + reviewDate + ", reiviewAnsContent=" + reiviewAnsContent + ", reviewAnsDate="
				+ reviewAnsDate + ", delYn=" + delYn + ", productNo=" + productNo + ", memNo=" + memNo + ", managerNo="
				+ managerNo + "]";
	}
	
	
}
