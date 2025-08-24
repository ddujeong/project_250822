package com.ddu.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ddu.dto.MemberDto;

public class MemberDao {
	private String driverName = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/projectdb";
	private String username = "root";
	private String password = "12345";
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_JOIN_FAIL = 0;	
	public static final int MEMBER_ID_EXISTENT = 1;
	public static final int MEMBER_ID_NONEXISTENT = 0;
	public static final int LOGIN_SUCCESS = 1;
	public static final int LOGIN_FAIL = 0;
	int sqlResult =0;
			
	public int joinMember(MemberDto memberDto) {
		String sql = "INSERT INTO members VALUES(?,?,?,?)";

		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);	
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setString(1,memberDto.getMember_id());
			pstmt.setString(2,memberDto.getMember_pw());
			pstmt.setString(3,memberDto.getMember_name());
			pstmt.setString(4,memberDto.getMember_email());
			
			sqlResult = pstmt.executeUpdate();
			
		} catch(Exception e) {	
			System.out.println("회원가입 실패");
			e.printStackTrace();
		} finally { 
			try {
				if(pstmt != null){
				pstmt.close();
				}
				if(conn != null){ 	
				conn.close();
				} 
			} catch(Exception e) {
				e.printStackTrace();
			}	
		}if (sqlResult == 1) {
			return MEMBER_JOIN_SUCCESS; //1
		} else {
			return MEMBER_JOIN_FAIL; //0
		}
			
		}
	 public int confirmId (String member_id) {
		  String sql ="SELECT member_id FROM members WHERE member_id=?";
		  int sqlResult = 0;
		  try {
				Class.forName(driverName);
				conn = DriverManager.getConnection(url, username, password);	
				pstmt = conn.prepareStatement(sql); 
				
				pstmt.setString(1, member_id);

				rs = pstmt.executeQuery(); 
				
				if (rs.next()) { // 로그인 실패
					sqlResult = MEMBER_ID_EXISTENT;
				} else {
					sqlResult =MEMBER_ID_NONEXISTENT;
				}
				
			} catch(Exception e) {	
				System.out.println("아이디 체크 실패");
				e.printStackTrace();
			} finally { 
				try {
					if (rs != null) {
					rs.close();
					}
					if(pstmt != null){
					pstmt.close();
					}
					if(conn != null){ 	
					conn.close();
					} 
				} catch(Exception e) {
					e.printStackTrace();
				}	
	  }return sqlResult;
	 }
	public int loginCheck(String member_id, String member_pw) {
		String sql ="SELECT * FROM members WHERE member_id=? AND member_pw=?";
		int sqlResult =0;
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);	
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setString(1, member_id);
			pstmt.setString(2, member_pw);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				sqlResult =LOGIN_SUCCESS;
			} else {
				sqlResult =LOGIN_FAIL;
			}
			
		} catch(Exception e) {	
			System.out.println("로그인 체크 실패");
			e.printStackTrace();
		} finally { 
			try {
				if (rs != null) {
				rs.close();
				}
				if(pstmt != null){
				pstmt.close();
				}
				if(conn != null){ 	
				conn.close();
				} 
			} catch(Exception e) {
				e.printStackTrace();
			}
		}return sqlResult; // 로그인 성공시 1 실패시 0
	}
	public MemberDto memberInfo(String user_id) { // 게시판의 글 목록에서 유저가 클릭한 글 번호의 글 dto 반환 메서드
		String sql ="SELECT * FROM members WHERE member_id=?";
		MemberDto mDto =null;
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);	
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			 if (rs.next()) {
				
				mDto =new MemberDto();
				mDto.setMember_id(rs.getString("member_id"));
				mDto.setMember_pw(rs.getString("member_pw"));
				mDto.setMember_name(rs.getString("member_name"));
				mDto.setMember_email(rs.getString("member_email"));
			 }
		} catch(Exception e) {	
			System.out.println("아이디 조회 실패");
			e.printStackTrace();
		} finally { 
			try {
				if (rs != null) {
				rs.close();
				}
				if(pstmt != null){
				pstmt.close();
				}
				if(conn != null){ 	
				conn.close();
				} 
			} catch(Exception e) {
				e.printStackTrace();
			}	
		}return mDto; // 글(bDto) 담긴 bDto 를 반환
	}
	public void memberModify(String user_pw, String user_name,String user_email, String user_id) {
		String sql = "UPDATE members SET member_pw=?,member_name=?,member_email=?  WHERE member_id=?";
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);	
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setString(1,user_pw);
			pstmt.setString(2,user_name);
			pstmt.setString(3,user_email);
			pstmt.setString(4, user_id);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {	
			System.out.println("글 수정 실패");
			e.printStackTrace();
		} finally { 
			try {
				if(pstmt != null){
				pstmt.close();
				}
				if(conn != null){ 	
				conn.close();
				} 
			} catch(Exception e) {
				e.printStackTrace();
			}	
		}
	}
	public void memberDelete(String member_id ) {
		String sql = "DELETE FROM members WHERE member_id=?";
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);	
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setString(1,member_id);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {	
			System.out.println("회원 삭제 실패");
			e.printStackTrace();
		} finally { 
			try {
				if(pstmt != null){
				pstmt.close();
				}
				if(conn != null){ 	
				conn.close();
				} 
			} catch(Exception e) {
				e.printStackTrace();
			}	
		}
	}
}
