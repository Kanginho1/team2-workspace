package com.kh.member.model.vo;

import java.sql.Date;

public class Member {
	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String email;
	private String phone;
	private Date enrollDate;
	private String adCheck;
	private String gender;
	private String birthday;
	private String instaId;
	private String actYn;
	private int mileage;
	
	public Member() {}
	
	public Member(int memNo, String memId, String memPwd, String memName, String email, String phone, Date enrollDate,
			String adCheck, String gender, String birthday, String instaId, String actYn, int mileage) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.email = email;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.adCheck = adCheck;
		this.gender = gender;
		this.birthday = birthday;
		this.instaId = instaId;
		this.actYn = actYn;
		this.mileage = mileage;
	}

	public Member(String memId, String memPwd, String memName, String email, String phone, String adCheck) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.email = email;
		this.phone = phone;
		this.adCheck = adCheck;
	}

	public Member(String memId, String gender, String birthday, String phone,
			String email, String instaId ,String adCheck ) {
		super();
		this.memId = memId;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.email = email;
		this.instaId = instaId;
		this.adCheck = adCheck;
		
	}

	public Member(int memNo, String memId, String memName, Date enrollDate) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memName = memName;
		this.enrollDate = enrollDate;
	}

	public Member(int memNo, String memName, String email, String phone, String adCheck, String gender, String birthday,
			String instaId) {
		super();
		this.memNo = memNo;
		this.memName = memName;
		this.email = email;
		this.phone = phone;
		this.adCheck = adCheck;
		this.gender = gender;
		this.birthday = birthday;
		this.instaId = instaId;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getAdCheck() {
		return adCheck;
	}

	public void setAdCheck(String adCheck) {
		this.adCheck = adCheck;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getInstaId() {
		return instaId;
	}

	public void setInstaId(String instaId) {
		this.instaId = instaId;
	}

	public String getActYn() {
		return actYn;
	}

	public void setActYn(String actYn) {
		this.actYn = actYn;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", email=" + email + ", phone=" + phone + ", enrollDate=" + enrollDate + ", adCheck=" + adCheck
				+ ", gender=" + gender + ", birthday=" + birthday + ", instaId=" + instaId + ", actYn=" + actYn
				+ ", mileage=" + mileage + "]";
	}

}