package vo;

import java.sql.Date;

public class BoardBean {
    private int board_num;
    private String board_subject;
    private String board_content;
    private String board_file;
    private int board_re_ref;
    private int board_re_lev;
    private int board_re_seq;
    private int board_readcount;
    private Date board_date;
    private String comment;
	private int comment_num;
    
    public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getBoard_num() {
        return board_num;
    }
    public void setBoard_num(int board_num) {
        this.board_num = board_num;
    }
    public String getBoard_subject() {
        return board_subject;
    }
    public void setBoard_subject(String board_subject) {
        this.board_subject = board_subject;
    }
    public String getBoard_content() {
        return board_content;
    }
    public void setBoard_content(String board_content) {
        this.board_content = board_content;
    }
    public String getBoard_file() {
        return board_file;
    }
    public void setBoard_file(String board_file) {
        this.board_file = board_file;
    }
    public int getBoard_re_ref() {
        return board_re_ref;
    }
    public void setBoard_re_ref(int board_re_ref) {
        this.board_re_ref = board_re_ref;
    }
    public int getBoard_re_lev() {
        return board_re_lev;
    }
    public void setBoard_re_lev(int board_re_lev) {
        this.board_re_lev = board_re_lev;
    }
    public int getBoard_re_seq() {
        return board_re_seq;
    }
    public void setBoard_re_seq(int board_re_seq) {
        this.board_re_seq = board_re_seq;
    }
    public int getBoard_readcount() {
        return board_readcount;
    }
    public void setBoard_readcount(int board_readcount) {
        this.board_readcount = board_readcount;
    }
    public Date getBoard_date() {
        return board_date;
    }
    public void setBoard_date(Date board_date) {
        this.board_date = board_date;
    }
}
