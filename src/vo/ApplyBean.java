package vo;

import java.sql.Date;

public class ApplyBean {
	
	private int apply_idx;
	private String apply_member_id;
	private int apply_lecture_idx;
	private Date apply_purchase_date;
	private String apply_ischeck;
	
	public int getApply_idx() {
		return apply_idx;
	}
	public void setApply_idx(int apply_idx) {
		this.apply_idx = apply_idx;
	}
	public String getApply_member_id() {
		return apply_member_id;
	}
	public void setApply_member_id(String apply_member_id) {
		this.apply_member_id = apply_member_id;
	}
	public int getApply_lecture_idx() {
		return apply_lecture_idx;
	}
	public void setApply_lecture_idx(int apply_lecture_idx) {
		this.apply_lecture_idx = apply_lecture_idx;
	}
	public Date getApply_purchase_date() {
		return apply_purchase_date;
	}
	public void setApply_purchase_date(Date apply_purchase_date) {
		this.apply_purchase_date = apply_purchase_date;
	}
	public String getApply_ischeck() {
		return apply_ischeck;
	}
	public void setApply_ischeck(String apply_ischeck) {
		this.apply_ischeck = apply_ischeck;
	}
	
	
	

}
