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
	public ArrayList<String> getMatchingList(String mbti) {
		ArrayList<String> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		엠비티아이가 매칭에 있는 users 회원들만 셀렉트
		String sql = "select a.* from users a inner join (select * from mbti_match where mbti_1=?) b on a.mbti=b.mbti_2";  
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mbti);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString("mbti"));
				list.add(rs.getString("name"));
				list.add(rs.getString("id"));
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
	public ArrayList<String> getMember(String id) {
		ArrayList<String> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from users where id=?";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString("id"));
				list.add(rs.getString("pw"));
				list.add(rs.getString("name"));
				list.add(rs.getString("mbti"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	//	멤버 인서트
	public int insertMember(String id, String pw, String name, String mbti) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into users values(?, ?, ?, ?)";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, mbti);
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			JdbcUtil.close(conn, pstmt);
		}
		
		return n;
	}

	//	멤버 업데이트
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
		String sql = "select pw from users where id=?";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if ( pwd.equals(rs.getString("pw")) )
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
