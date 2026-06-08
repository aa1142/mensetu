package comunity;

import java.sql.*;

public class MemDAO {
	
	public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "scott";
			String password = "tiger";
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public boolean checkId(String memid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isExist = false;
		
		try {
			con = getConnection();
			String sql = "SELECT memid FROM MEM WHERE memid = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				isExist = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return isExist;
	}

	public boolean MemberInsert(String memid, String pass, String name, String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			con = getConnection();
			String sql = "INSERT INTO MEM (MEMID, PASS, NAME, EMAIL, REG_DATE) VALUES (?, ?, ?, ?, SYSDATE)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memid);
			pstmt.setString(2, pass);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			int count = pstmt.executeUpdate();
			if (count > 0) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return flag;
	}

	public int loginCheck(String memid, String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;
		
		try {
			con = getConnection();
			String sql = "SELECT pass FROM MEM WHERE memid = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String dbPass = rs.getString("pass");
				if (pass.equals(dbPass)) {
					check = 1;
				} else {
					check = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return check;
	}
}