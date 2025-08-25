package com.ddu.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ddu.dto.BoardDto;
import com.ddu.dto.CommentDto;
import com.ddu.dto.MemberDto;

public class CommentDao {
	private String driverName = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/projectdb";
	private String username = "root";
	private String password = "12345";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void commentWrite(int bnum, String member_id, String comment ) {
		String sql ="INSERT INTO comment (bnum,member_id,comment) values(?,?,?)";
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);	
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setInt(1,bnum);
			pstmt.setString(2,member_id);
			pstmt.setString(3,comment);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {	
			System.out.println("글 생성 실패");
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
	public List<CommentDto> commentList(int bnum) {
		String sql ="SELECT c.cnum,c.member_id, c.comment, c.cdate "
				+ "From comment AS c inner join board AS b ON b.bnum = c.bnum "
				+ "WHERE b.bnum=?";
		List<CommentDto> cDtos = new ArrayList<CommentDto>();
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);	
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, bnum);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int cnum = rs.getInt("cnum");
				String member_id = rs.getString("member_id");
				String comment = rs.getString("comment");
				String cdate = rs.getString("cdate");
				
				CommentDto cDto =new CommentDto(cnum, bnum, member_id, comment, cdate);
				
				cDtos.add(cDto);
				
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
		}return cDtos;
	}
	public void commentModify(String comment, int cnum) {
		String sql = "UPDATE comment AS c "
				+ "INNER JOIN board AS b ON b.bnum = c.bnum "
				+ "SET c.comment=? "
				+ "WHERE c.cnum=? ";
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);	
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setString(1,comment);
			pstmt.setInt(2,cnum);
			
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
}