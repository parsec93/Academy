package vo;

import java.sql.Date;

public class NoticeBean {
	private int notice_idx;
	private String notice_subject;
	private String notice_content;
	private String notice_file;
	private Date notice_date;
	private Date event_start_day;
	private Date event_end_day;
	private int isNotice;
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_file() {
		return notice_file;
	}
	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public Date getEvent_start_day() {
		return event_start_day;
	}
	public void setEvent_start_day(Date event_start_day) {
		this.event_start_day = event_start_day;
	}
	public Date getEvent_end_day() {
		return event_end_day;
	}
	public void setEvent_end_day(Date event_end_day) {
		this.event_end_day = event_end_day;
	}
	public int getIsNotice() {
		return isNotice;
	}
	public void setIsNotice(int isNotice) {
		this.isNotice = isNotice;
	}
}
 