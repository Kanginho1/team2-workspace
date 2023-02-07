package com.kh.product.model.vo;

public class Brand {
	private int brandNo;
	private String brandName;
	
	public Brand() {}

	public Brand(int brandNo, String brandName) {
		super();
		this.brandNo = brandNo;
		this.brandName = brandName;
	}

	public int getBrandNo() {
		return brandNo;
	}

	public void setBrandNo(int brandNo) {
		this.brandNo = brandNo;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	@Override
	public String toString() {
		return "Brand [brandNo=" + brandNo + ", brandName=" + brandName + "]";
	}
	
	
}
