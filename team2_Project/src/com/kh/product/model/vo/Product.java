package com.kh.product.model.vo;

import java.sql.Date;

public class Product {
	private int productNo;
	private String productName;
	private String productDesc;
	private int productPrice;
	private Date productEnrollDate;
	private int productViewCount;
	private String delYn;
	private int categoryNo;
	private int brandNo;
	
	public Product() {}
	
	public Product(int productNo, String productName, String productDesc, int productPrice, Date productEnrollDate,
			int productViewCount, String delYn, int categoryNo, int brandNo) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productDesc = productDesc;
		this.productPrice = productPrice;
		this.productEnrollDate = productEnrollDate;
		this.productViewCount = productViewCount;
		this.delYn = delYn;
		this.categoryNo = categoryNo;
		this.brandNo = brandNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public Date getProductEnrollDate() {
		return productEnrollDate;
	}

	public void setProductEnrollDate(Date productEnrollDate) {
		this.productEnrollDate = productEnrollDate;
	}

	public int getProductViewCount() {
		return productViewCount;
	}

	public void setProductViewCount(int productViewCount) {
		this.productViewCount = productViewCount;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getBrandNo() {
		return brandNo;
	}

	public void setBrandNo(int brandNo) {
		this.brandNo = brandNo;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productDesc=" + productDesc
				+ ", productPrice=" + productPrice + ", productEnrollDate=" + productEnrollDate + ", productViewCount="
				+ productViewCount + ", delYn=" + delYn + ", categoryNo=" + categoryNo + ", brandNo=" + brandNo + "]";
	}
	
	
	
}
