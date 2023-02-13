package com.kh.community.model.vo;

public class InstaImage {
	
	// 필드부 생성
	private int instaImgNo;
	private String instaImgName;
	private String instaImgSrc;
	private int comNo;
	
	// 기본 생성자
	public InstaImage() {}

	// 매개변수 생성자
	public InstaImage(int instaImgNo, String instaImgName, String instaImgSrc, int comNo) {
		super();
		this.instaImgNo = instaImgNo;
		this.instaImgName = instaImgName;
		this.instaImgSrc = instaImgSrc;
		this.comNo = comNo;
	}

	// setter/getter
	public int getInstaImgNo() {
		return instaImgNo;
	}

	public void setInstaImgNo(int instaImgNo) {
		this.instaImgNo = instaImgNo;
	}

	public String getInstaImgName() {
		return instaImgName;
	}

	public void setInstaImgName(String instaImgName) {
		this.instaImgName = instaImgName;
	}

	public String getInstaImgSrc() {
		return instaImgSrc;
	}

	public void setInstaImgSrc(String instaImgSrc) {
		this.instaImgSrc = instaImgSrc;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	// toString
	@Override
	public String toString() {
		return "InstaImage [instaImgNo=" + instaImgNo + ", instaImgName=" + instaImgName + ", instaImgSrc="
				+ instaImgSrc + ", comNo=" + comNo + "]";
	}
	
}
