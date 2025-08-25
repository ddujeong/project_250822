package com.ddu.dto;

public class CommentDto {
	private int cnum;
	private int bnum;
	private String member_id;
	private String comment;
	private String cdate;
	public CommentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentDto(int cnum, int bnum, String member_id, String comment, String cdate) {
		super();
		this.cnum = cnum;
		this.bnum = bnum;
		this.member_id = member_id;
		this.comment = comment;
		this.cdate = cdate;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
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
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	
	
}
