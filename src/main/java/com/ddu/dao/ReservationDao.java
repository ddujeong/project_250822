package com.ddu.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import com.ddu.dto.BoardDto;
import com.ddu.dto.MemberDto;
import com.ddu.dto.ReservationDto;

public class ReservationDao {
	private String driverName = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/projectdb";
	private String username = "root";
	private String password = "12345";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void reserve(String member_id, Date rdate, Time rtime, String seat ) {
		String sql ="INSERT INTO reservation (member_id, rdate, rtime, seat) VALUES (?, ?, ?, ?)";
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);	
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setString(1,member_id);
			pstmt.setDate(2,rdate);
			pstmt.setTime(3,rtime);
			pstmt.setString(4, seat);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {	
			System.out.println("예약 실패");
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
	}public List<ReservationDto> reserveCheck(String member_id) {
		String sql ="SELECT r.rnum, m.member_id, r.rdate, r.rtime, r.seat, r.createtime "
				+ "FROM reservation as r inner join members as m on r.member_id = m.member_id "
				+ "WHERE m.member_id=?";
		List<ReservationDto> rDtos = new ArrayList<ReservationDto>();
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);	
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setString(1, member_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int rnum = rs.getInt("rnum");
				String user_id = rs.getString("member_id");
				Date rdate = Date.valueOf( rs.getString("rdate"));
				Time rtime = Time.valueOf(rs.getString("rtime")) ;
				String seat = rs.getString("seat");
				String creattime = rs.getString("createtime");
				ReservationDto rDto = new ReservationDto();
				
				rDto = new ReservationDto(rnum, user_id, rdate, rtime, seat, creattime);
				rDtos.add(rDto);
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
		}return rDtos; // 로그인 성공시 1 실패시 0
	}public void reservationDelete(int rnum ) {
		String sql = "DELETE FROM reservation WHERE rnum=?";
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);	
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setInt(1,rnum);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {	
			System.out.println("예약 삭제 실패");
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
