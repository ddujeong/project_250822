package com.ddu.dto;

public class CommentDto {
	private int rnum;
	private int bnum;
	private String member_id;
	private String comment;
	private String rdate;
	public CommentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentDto(int rnum, int bnum, String member_id, String comment, String rdate) {
		super();
		this.rnum = rnum;
		this.bnum = bnum;
		this.member_id = member_id;
		this.comment = comment;
		this.rdate = rdate;
	}
	
	public CommentDto(int bnum, String member_id, String comment, String rdate) {
		super();
		this.bnum = bnum;
		this.member_id = member_id;
		this.comment = comment;
		this.rdate = rdate;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	
}
