package com.kh.community.model.vo;

public class Like {
	
	// 필드부 생성
	private int likeNo;
	private int memNo;
	private int comNo;
	
	// 기본 생성자
	public Like() {}

	// 매개변수 생성자
	public Like(int likeNo, int memNo, int comNo) {
		super();
		this.likeNo = likeNo;
		this.memNo = memNo;
		this.comNo = comNo;
	}
	
	// setter/getter
	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
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
		return "Like [likeNo=" + likeNo + ", memNo=" + memNo + ", comNo=" + comNo + "]";
	}
}
