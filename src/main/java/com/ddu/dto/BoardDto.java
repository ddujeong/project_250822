package com.ddu.dto;

public class BoardDto {
	private int bno;
	private int bnum;
	private String btitle;
	private String bcontent;
	private String member_id;
	private String bdate;
	private int bhit;
	private MemberDto memberDto;
	private String category;
	
	public BoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardDto(int bno, int bnum, String btitle, String bcontent, String member_id, String bdate, int bhit,
			MemberDto memberDto) {
		super();
		this.bno = bno;
		this.bnum = bnum;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.member_id = member_id;
		this.bdate = bdate;
		this.bhit = bhit;
		this.memberDto = memberDto;
	}
	public BoardDto(int bnum, String btitle, String bcontent, String member_id, String bdate,
			int bhit) {
		super();
		this.bnum = bnum;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.member_id = member_id;
		this.bdate = bdate;
		this.bhit = bhit;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public int getBhit() {
		return bhit;
	}

	public void setBhit(int bhit) {
		this.bhit = bhit;
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public MemberDto getMemberDto() {
		return memberDto;
	}


	public void setMemberDto(MemberDto memberDto) {
		this.memberDto = memberDto;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
}
