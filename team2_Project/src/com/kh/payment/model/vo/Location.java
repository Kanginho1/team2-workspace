package com.kh.payment.model.vo;

public class Location {
	private int locNo;
	private int memNo;
	private String locAddressName;
	private String locName;
	private String locPhone;
	private String locAddress;
	private String locAddressDtl;
	private String locPostCode;
	private String delYn;
	private String locYn;
	
	public Location() {}

	public Location(int locNo, int memNo, String locAddressName, String locName, String locPhone, String locAddress,
			String locAddressDtl, String locPostCode, String delYn, String locYn) {
		super();
		this.locNo = locNo;
		this.memNo = memNo;
		this.locAddressName = locAddressName;
		this.locName = locName;
		this.locPhone = locPhone;
		this.locAddress = locAddress;
		this.locAddressDtl = locAddressDtl;
		this.locPostCode = locPostCode;
		this.delYn = delYn;
		this.locYn = locYn;
	}

	public int getLocNo() {
		return locNo;
	}

	public void setLocNo(int locNo) {
		this.locNo = locNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getLocAddressName() {
		return locAddressName;
	}

	public void setLocAddressName(String locAddressName) {
		this.locAddressName = locAddressName;
	}

	public String getLocName() {
		return locName;
	}

	public void setLocName(String locName) {
		this.locName = locName;
	}

	public String getLocPhone() {
		return locPhone;
	}

	public void setLocPhone(String locPhone) {
		this.locPhone = locPhone;
	}

	public String getLocAddress() {
		return locAddress;
	}

	public void setLocAddress(String locAddress) {
		this.locAddress = locAddress;
	}

	public String getLocAddressDtl() {
		return locAddressDtl;
	}

	public void setLocAddressDtl(String locAddressDtl) {
		this.locAddressDtl = locAddressDtl;
	}

	public String getLocPostCode() {
		return locPostCode;
	}

	public void setLocPostCode(String locPostCode) {
		this.locPostCode = locPostCode;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public String getLocYn() {
		return locYn;
	}

	public void setLocYn(String locYn) {
		this.locYn = locYn;
	}

	@Override
	public String toString() {
		return "Location [locNo=" + locNo + ", memNo=" + memNo + ", locAddressName=" + locAddressName + ", locName="
				+ locName + ", locPhone=" + locPhone + ", locAddress=" + locAddress + ", locAddressDtl=" + locAddressDtl
				+ ", locPostCode=" + locPostCode + ", delYn=" + delYn + ", locYn=" + locYn + "]";
	}
	
	
}
