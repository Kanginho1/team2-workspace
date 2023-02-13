package com.kh.community.model.vo;

public class SpeechBubble {
	
	// 필드부 생성
	private int bublleNo;
	private String productBrand;
	private String productName;
	private String productSize;
	private int productPrice;
	private String link;
	private int comNo;
	private int brandNo;
	private int categoryNo;
	
	// 기본 생성자
	public SpeechBubble() {}

	// 매개변수 생성자
	public SpeechBubble(int bublleNo, String productBrand, String productName, String productSize, int productPrice,
			String link, int comNo, int brandNo, int categoryNo) {
		super();
		this.bublleNo = bublleNo;
		this.productBrand = productBrand;
		this.productName = productName;
		this.productSize = productSize;
		this.productPrice = productPrice;
		this.link = link;
		this.comNo = comNo;
		this.brandNo = brandNo;
		this.categoryNo = categoryNo;
	}

	// setter/getter
	public int getBublleNo() {
		return bublleNo;
	}

	public void setBublleNo(int bublleNo) {
		this.bublleNo = bublleNo;
	}

	public String getProductBrand() {
		return productBrand;
	}

	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductSize() {
		return productSize;
	}

	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public int getBrandNo() {
		return brandNo;
	}

	public void setBrandNo(int brandNo) {
		this.brandNo = brandNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	// toString
	@Override
	public String toString() {
		return "SpeechBubble [bublleNo=" + bublleNo + ", productBrand=" + productBrand + ", productName=" + productName
				+ ", productSize=" + productSize + ", productPrice=" + productPrice + ", link=" + link + ", comNo="
				+ comNo + ", brandNo=" + brandNo + ", categoryNo=" + categoryNo + "]";
	}
	
}
