package com.kh.community.model.vo;

public class Instagram {
	
	// 필드부 선언
	private int comNo;
	private String comContent;
	private String comTag;
	private String instaId;
	private int imgNo;
	private String delYn;
	private int memNo;
	
	// 기본 생성자
	public Instagram() {}

	// 매개변수 생성자
	public Instagram(int comNo, String comContent, String comTag, String instaId, int imgNo, String delYn, int memNo) {
		super();
		this.comNo = comNo;
		this.comContent = comContent;
		this.comTag = comTag;
		this.instaId = instaId;
		this.imgNo = imgNo;
		this.delYn = delYn;
		this.memNo = memNo;
	}

	// setter/getter
	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public String getComContent() {
		return comContent;
	}

	public void setComContent(String comContent) {
		this.comContent = comContent;
	}

	public String getComTag() {
		return comTag;
	}

	public void setComTag(String comTag) {
		this.comTag = comTag;
	}

	public String getInstaId() {
		return instaId;
	}

	public void setInstaId(String instaId) {
		this.instaId = instaId;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	// toString
	@Override
	public String toString() {
		return "Instagram [comNo=" + comNo + ", comContent=" + comContent + ", comTag=" + comTag + ", instaId="
				+ instaId + ", imgNo=" + imgNo + ", delYn=" + delYn + ", memNo=" + memNo + "]";
	}
	
}
