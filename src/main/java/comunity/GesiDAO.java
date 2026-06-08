package comunity;
import java.sql.*;
import java.util.*;

public class GesiDAO {
	
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

	public ArrayList<GesiVO> getGesiList(){
		ArrayList<GesiVO> list = new ArrayList<>();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			String sql = "SELECT BOARD_NUM, MEMID, TITLE, CONTENT, REG_DATE FROM gesi ORDER BY BOARD_NUM DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GesiVO vo = new GesiVO();
				vo.setBoardNum(rs.getInt("BOARD_NUM"));
				vo.setMemid(rs.getString("MEMID"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setContent(rs.getString("CONTENT"));
				vo.setRegDate(rs.getTimestamp("REG_DATE"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs!=null)rs.close(); if (pstmt != null) pstmt.close(); if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}
	
	public boolean insertGesi (String title, String content, String memid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			con = getConnection();
			String sql = "INSERT INTO gesi (BOARD_NUM, MEMID, TITLE, CONTENT, REG_DATE) values (board_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memid);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			
			int count = pstmt.executeUpdate();
			if(count > 0) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close(); if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return flag;
	}
	
	public GesiVO getdetail(int board_num) {
		GesiVO vo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from gesi where Board_NUM = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new GesiVO();
				vo.setBoardNum(rs.getInt("BOARD_NUM"));
				vo.setMemid(rs.getString("MEMID"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setContent(rs.getString("CONTENT"));
				vo.setRegDate(rs.getTimestamp("REG_DATE"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs!=null)rs.close(); if (pstmt != null) pstmt.close(); if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return vo;
	}

	public String getBoardWriter(int board_num) {
		String writer = "";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT MEMID FROM gesi WHERE BOARD_NUM = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			if (rs.next()) writer = rs.getString("MEMID");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close(); if (pstmt != null) pstmt.close(); if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return writer;
	}

	public void deleteBoard(int board_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM gesi WHERE BOARD_NUM = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close(); if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}