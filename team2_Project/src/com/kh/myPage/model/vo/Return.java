package com.kh.myPage.model.vo;

public class Return {
	
	
	private int returnNo;
	private String returnStatus;
	private String returnReason;
	private int memNo;
	private int orderNo;
	
	public Return() {
		
	}

	public Return(int returnNo, String returnStatus, String returnReason, int memNo, int orderNo) {
		super();
		this.returnNo = returnNo;
		this.returnStatus = returnStatus;
		this.returnReason = returnReason;
		this.memNo = memNo;
		this.orderNo = orderNo;
	}

	public int getReturnNo() {
		return returnNo;
	}

	public void setReturnNo(int returnNo) {
		this.returnNo = returnNo;
	}

	public String getReturnStatus() {
		return returnStatus;
	}

	public void setReturnStatus(String returnStatus) {
		this.returnStatus = returnStatus;
	}

	public String getReturnReason() {
		return returnReason;
	}

	public void setReturnReason(String returnReason) {
		this.returnReason = returnReason;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	@Override
	public String toString() {
		return "Return [returnNo=" + returnNo + ", returnStatus=" + returnStatus + ", returnReason=" + returnReason
				+ ", memNo=" + memNo + ", orderNo=" + orderNo + "]";
	}
	
	
}
