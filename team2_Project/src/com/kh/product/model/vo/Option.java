package com.kh.product.model.vo;

public class Option {
	private int optionNo;
	private String optionSize;
	private int stock;
    private int productNo;
    
    public Option() {}

	public Option(int optionNo, String optionSize, int stock, int productNo) {
		super();
		this.optionNo = optionNo;
		this.optionSize = optionSize;
		this.stock = stock;
		this.productNo = productNo;
	}

	public int getOptionNo() {
		return optionNo;
	}

	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}

	public String getOptionSize() {
		return optionSize;
	}

	public void setOptionSize(String optionSize) {
		this.optionSize = optionSize;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	@Override
	public String toString() {
		return "Option [optionNo=" + optionNo + ", optionSize=" + optionSize + ", stock=" + stock + ", productNo="
				+ productNo + "]";
	}
    
    
}
