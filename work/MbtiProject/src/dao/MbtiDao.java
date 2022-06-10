package dao;

import java.sql.*;
import java.util.ArrayList;

public class MbtiDao {
	//	궁합 셀렉트
	public ArrayList<String> getChemiList(String mbti) {
		ArrayList<String> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from mbti_match where mbti_1=?";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mbti);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString("mbti_2"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	//	회원 매칭 셀렉트
	public ArrayList<String> getMatchingList() {
		ArrayList<String> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		엠비티아이가 매칭에 있는 users 회원들만 셀렉트
		String sql = "";  
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString("mbti_2"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("------------------------힝히잏ㅇ");
			
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		System.out.println("------------------------예ㅖㅖㅖ");
		return list;
	}
	
	
	
	
	//	멤버 셀렉트
	public ArrayList<String> getMemberList() {
		ArrayList<String> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select userid from member";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString("userid"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	//	멤버 인서트
	public int insertMember(String userId, String userPwd) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into member values(?,?)";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JdbcUtil.close(conn, pstmt);
		}
		
		return n;
	}

	//	멤버 업데이트
//	여기서 id는 세션에 로그인상태인 아이디를 넣어줘야 함
	public int updateMember(String name, String mbti, String id) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update users set name=?, mbti=? where id=?";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, mbti);
			pstmt.setString(3, id);
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JdbcUtil.close(conn, pstmt);
		}
		
		return n;
	}
	
	// 로그인 입력정보 확인
	public boolean getMemberPwd(String id, String pwd) {
		boolean result = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select userpwd from member where userid=?";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if ( pwd.equals(rs.getString("userpwd")) )
					result = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
}
