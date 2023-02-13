package com.kh.myPage.model.vo;

public class Follow {
	private int followNo;
	private int followingId;
	private int followerId;
	
	public Follow() {
		
	}

	public Follow(int followNo, int followingId, int followerId) {
		super();
		this.followNo = followNo;
		this.followingId = followingId;
		this.followerId = followerId;
	}

	public int getFollowNo() {
		return followNo;
	}

	public void setFollowNo(int followNo) {
		this.followNo = followNo;
	}

	public int getFollowingId() {
		return followingId;
	}

	public void setFollowingId(int followingId) {
		this.followingId = followingId;
	}

	public int getFollowerId() {
		return followerId;
	}

	public void setFollowerId(int followerId) {
		this.followerId = followerId;
	}

	@Override
	public String toString() {
		return "Follow [followNo=" + followNo + ", followingId=" + followingId + ", followerId=" + followerId + "]";
	}
	
	
	
	}
