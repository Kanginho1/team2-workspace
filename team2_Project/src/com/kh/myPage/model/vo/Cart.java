package com.kh.myPage.model.vo;

public class Cart {
	private int cartNo;
	private int cartQnt;
	private int productNo;
	private int memNo;
	
	public Cart() {
		
	}

	public Cart(int cartNo, int cartQnt, int productNo, int memNo) {
		super();
		this.cartNo = cartNo;
		this.cartQnt = cartQnt;
		this.productNo = productNo;
		this.memNo = memNo;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getCartQnt() {
		return cartQnt;
	}

	public void setCartQnt(int cartQnt) {
		this.cartQnt = cartQnt;
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

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", cartQnt=" + cartQnt + ", productNo=" + productNo + ", memNo=" + memNo
				+ "]";
	}
	
	
}
