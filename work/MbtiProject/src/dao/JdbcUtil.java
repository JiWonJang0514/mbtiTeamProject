package dao;

import java.sql.*;

public class JdbcUtil {
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			
		} catch (Exception e) {
			System.out.println("***********************DB연결실패");
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static void close(Connection conn, PreparedStatement pstmt) {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				System.out.println("*************************conn.close() 실패");
				e.printStackTrace();
			}
		}
	}
	
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				System.out.println("*************************rs.close() 실패");
				e.printStackTrace();
			}
		}
		close(conn, pstmt);
	}
}
