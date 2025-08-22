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
		}return sqlResult;
			
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
					sqlResult = 0;
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
				sqlResult =1;
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
}
