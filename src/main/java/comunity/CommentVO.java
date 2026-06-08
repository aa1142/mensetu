package comunity;

public class CommentVO {
    private int c_num, board_num;
    private String memid, c_content, reg_date;

    public int getC_num() { return c_num; }
    public void setC_num(int c_num) { this.c_num = c_num; }
    public int getBoard_num() { return board_num; }
    public void setBoard_num(int board_num) { this.board_num = board_num; }
    public String getMemid() { return memid; }
    public void setMemid(String memid) { this.memid = memid; }
    public String getC_content() { return c_content; }
    public void setC_content(String c_content) { this.c_content = c_content; }
    public String getReg_date() { return reg_date; }
    public void setReg_date(String reg_date) { this.reg_date = reg_date; }
}