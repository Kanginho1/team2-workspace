package com.kh.myPage.model.vo;

public class MileageHistory {
	private int mileageNo;
	private String mileageHistory;
	private int memNo;
		
	public MileageHistory() {
		
	}

	public MileageHistory(int mileageNo, String mileageHistory, int memNo) {
		super();
		this.mileageNo = mileageNo;
		this.mileageHistory = mileageHistory;
		this.memNo = memNo;
	}

	public int getMileageNo() {
		return mileageNo;
	}

	public void setMileageNo(int mileageNo) {
		this.mileageNo = mileageNo;
	}

	public String getMileageHistory() {
		return mileageHistory;
	}

	public void setMileageHistory(String mileageHistory) {
		this.mileageHistory = mileageHistory;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	@Override
	public String toString() {
		return "MileageHistory [mileageNo=" + mileageNo + ", mileageHistory=" + mileageHistory + ", memNo=" + memNo
				+ "]";
	}
	
	
}
