package vo;

public class AttendBean {
	private int attend_idx;  
	private String attend_member_id ;
	private int attend_lecture_idx ;
	private String attend_check;
	private int attend_today;
	
	public int getAttend_idx() {
		return attend_idx;
	}
	public void setAttend_idx(int attend_idx) {
		this.attend_idx = attend_idx;
	}
	public String getAttend_member_id() {
		return attend_member_id;
	}
	public void setAttend_member_id(String attend_member_id) {
		this.attend_member_id = attend_member_id;
	}
	public int getAttend_lecture_idx() {
		return attend_lecture_idx;
	}
	public void setAttend_lecture_idx(int attend_lecture_idx) {
		this.attend_lecture_idx = attend_lecture_idx;
	}
	public String getAttend_check() {
		return attend_check;
	}
	public void setAttend_check(String attend_check) {
		this.attend_check = attend_check;
	}
	public int getAttend_today() {
		return attend_today;
	}
	public void setAttend_today(int attend_today) {
		this.attend_today = attend_today;
	}

}
