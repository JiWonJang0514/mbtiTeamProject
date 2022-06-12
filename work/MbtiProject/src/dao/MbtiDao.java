package dao;

import java.sql.*;
import java.util.ArrayList;

public class MbtiDao {
	//  ■ 핵심기능 ■ 
	//	궁합 셀렉트
	//	궁합을 찾고싶은 엠비티아이를 파라미터로 넣어서 호출하면 그 엠비티아이 기준으로 궁합 2개를 반환함.
	public ArrayList<String> getChemiList(String mbti) {
		ArrayList<String> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// mbti_match 테이블: 궁합이 좋은 엠비티아이가 두개씩 짝지어서 구성되어있음.
		// 					한 엠비티아이 유형 당 2개의 궁합이 있어서 셀렉트 결과는 2개 행이 나옴.
		String sql = "select * from mbti_match where mbti_1=?";
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mbti);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 배열 형태로 리턴값 만들기				
				list.add(rs.getString("mbti_2"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	
	//  ■ 핵심기능 ■
	//	회원 매칭 셀렉트
	//  로그인한 사용자의 엠비티아이를 파라미터로 넣어서 호출해야 함.
	//  파라미터로 받은 엠비티아이를 이용해 궁합 테이블에서 궁합을 알아낸 뒤, 알아낸 엠비티아이를 가진 유저 리스트를 반환함. 
	public ArrayList<String> getMatchingList(String mbti) {
		ArrayList<String> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//	엠비티아이가 매칭에 있는 users 회원들만 셀렉트
		//  1. 서브쿼리 사용해서 우선 mbti_match 테이블에서 맞는 궁합의 엠비티아이가 뭔지 찾음.
		//  2. 그리고 서브쿼리 결과 테이블을 b라고 별명 붙이고 b와 users를 조인하면 궁합이 좋은 유형과 같은 엠비티아이인 회원만 가져오게 됨.
		String sql = "select a.* from users a inner join (select * from mbti_match where mbti_1=?) b on a.mbti=b.mbti_2";  
		
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mbti);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//  유저들의 정보를 하나하나씩 배열 형태로 주르륵 넣음.
				// 	참고: 유저 한명씩 정보를 묶어서 넘길 수 있었다면 더 편리했겠지만, 기한대비 완성도를 따져봤을때 당장 할 수 있는 방법으로 구현하기로 함. 
				list.add(rs.getString("mbti"));
				list.add(rs.getString("name"));
				list.add(rs.getString("id"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("------------------------getMatchingList실패");
			
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	
	//	멤버 셀렉트 (파라미터로 받은 아이디를 가진 회원의 정보를 반환)
	//  주로 세션에 등록된 회원 정보 가져올 때 사용.
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
	
	
	//	멤버 인서트 (회원가입에서 사용)
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
	//  회원 이름, 엠비티아이 수정하는 메소드.
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
