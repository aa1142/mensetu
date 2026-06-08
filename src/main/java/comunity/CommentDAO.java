package comunity;

import java.sql.*;
import java.util.*;

public class CommentDAO {
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;

    public CommentDAO() {
        try {
            String url = "jdbc:oracle:thin:@localhost:1521:orcl";
            String user = "scott";
            String password = "tiger";
            Class.forName("oracle.jdbc.driver.OracleDriver");
            this.conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertComment(int board_num, String memid, String content) {
        String sql = "INSERT INTO comments (c_num, board_num, memid, c_content, reg_date) VALUES (comment_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, board_num);
            pstmt.setString(2, memid);
            pstmt.setString(3, content);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public String getCommentWriter(int c_num) {
        String writer = "";
        String sql = "SELECT memid FROM comments WHERE c_num = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, c_num);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                writer = rs.getString("memid");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return writer;
    }
    
    public List<CommentVO> getComments(int board_num) {
        List<CommentVO> list = new ArrayList<>();
        String sql = "SELECT c_num, memid, c_content, TO_CHAR(reg_date, 'YYYY-MM-DD HH24:MI') as reg_date FROM comments WHERE board_num = ? ORDER BY c_num DESC";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, board_num);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                CommentVO vo = new CommentVO();
                vo.setC_num(rs.getInt("c_num"));
                vo.setMemid(rs.getString("memid"));
                vo.setC_content(rs.getString("c_content"));
                vo.setReg_date(rs.getString("reg_date"));
                list.add(vo);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void deleteComment(int c_num) {
        String sql = "DELETE FROM comments WHERE c_num = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, c_num);
            pstmt.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}