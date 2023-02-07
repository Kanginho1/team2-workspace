package com.kh.payment.model.vo;

import java.sql.Date;

public class Order {
	private int orderNo;
	private int memNo;
	private int productNo;
	private int orderQnt;
	private Date orderDate;
	private String orderStatus;
	private String rcpAddressName;
	private String rcpName;
	private String rcpPhone;
	private String rcpAddress;
	private String rcpAddressDtl;
	private String rcpPostCode;
	private String rcpMsg;
	
	public Order() {}
	
	public Order(int orderNo, int memNo, int productNo, int orderQnt, Date orderDate, String orderStatus,
			String rcpAddressName, String rcpName, String rcpPhone, String rcpAddress, String rcpAddressDtl,
			String rcpPostCode, String rcpMsg) {
		super();
		this.orderNo = orderNo;
		this.memNo = memNo;
		this.productNo = productNo;
		this.orderQnt = orderQnt;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.rcpAddressName = rcpAddressName;
		this.rcpName = rcpName;
		this.rcpPhone = rcpPhone;
		this.rcpAddress = rcpAddress;
		this.rcpAddressDtl = rcpAddressDtl;
		this.rcpPostCode = rcpPostCode;
		this.rcpMsg = rcpMsg;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getOrderQnt() {
		return orderQnt;
	}

	public void setOrderQnt(int orderQnt) {
		this.orderQnt = orderQnt;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getRcpAddressName() {
		return rcpAddressName;
	}

	public void setRcpAddressName(String rcpAddressName) {
		this.rcpAddressName = rcpAddressName;
	}

	public String getRcpName() {
		return rcpName;
	}

	public void setRcpName(String rcpName) {
		this.rcpName = rcpName;
	}

	public String getRcpPhone() {
		return rcpPhone;
	}

	public void setRcpPhone(String rcpPhone) {
		this.rcpPhone = rcpPhone;
	}

	public String getRcpAddress() {
		return rcpAddress;
	}

	public void setRcpAddress(String rcpAddress) {
		this.rcpAddress = rcpAddress;
	}

	public String getRcpAddressDtl() {
		return rcpAddressDtl;
	}

	public void setRcpAddressDtl(String rcpAddressDtl) {
		this.rcpAddressDtl = rcpAddressDtl;
	}

	public String getRcpPostCode() {
		return rcpPostCode;
	}

	public void setRcpPostCode(String rcpPostCode) {
		this.rcpPostCode = rcpPostCode;
	}

	public String getRcpMsg() {
		return rcpMsg;
	}

	public void setRcpMsg(String rcpMsg) {
		this.rcpMsg = rcpMsg;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", memNo=" + memNo + ", productNo=" + productNo + ", orderQnt=" + orderQnt
				+ ", orderDate=" + orderDate + ", orderStatus=" + orderStatus + ", rcpAddressName=" + rcpAddressName
				+ ", rcpName=" + rcpName + ", rcpPhone=" + rcpPhone + ", rcpAddress=" + rcpAddress + ", rcpAddressDtl="
				+ rcpAddressDtl + ", rcpPostCode=" + rcpPostCode + ", rcpMsg=" + rcpMsg + "]";
	}
	
	
	
}
