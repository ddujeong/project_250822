package com.ddu.dto;

import java.sql.Date;
import java.sql.Time;

public class ReservationDto {
	private int rnum;
	private String member_id;
	private Date rdate;
	private Time rtime;
	private String createtime;
	public ReservationDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationDto(int rnum, String member_id, Date rdate, Time rtime, String createtime) {
		super();
		this.rnum = rnum;
		this.member_id = member_id;
		this.rdate = rdate;
		this.rtime = rtime;
		this.createtime = createtime;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public Time getRtime() {
		return rtime;
	}
	public void setRtime(Time rtime) {
		this.rtime = rtime;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

}

