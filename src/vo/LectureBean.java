package vo;

import java.sql.Date;

public class LectureBean {
	private int lecture_idx;
	private String lecture_subject;
	private String lecture_course;
	private String lecture_teacher;
	private Date lecture_start_day;
	private Date lecture_end_day;
	private String lecture_week_day;
	private String lecture_content;
	private int lecture_fee;
	private String lecture_time;
	private String lecture_room;
	private int lecture_count;
	private String lecture_image;
	private	String lecture_teacher_code;
	
	public String getLecture_image() {
		return lecture_image;
	}
	public void setLecture_image(String lecture_image) {
		this.lecture_image = lecture_image;
	}
	public int getLecture_count() {
		return lecture_count;
	}
	public void setLecture_count(int lecture_count) {
		this.lecture_count = lecture_count;
	}
	public int getLecture_idx() {
		return lecture_idx;
	}
	public void setLecture_idx(int lecture_idx) {
		this.lecture_idx = lecture_idx;
	}
	public String getLecture_subject() {
		return lecture_subject;
	}
	public void setLecture_subject(String lecture_subject) {
		this.lecture_subject = lecture_subject;
	}
	public String getLecture_course() {
		return lecture_course;
	}
	public void setLecture_course(String lecture_course) {
		this.lecture_course = lecture_course;
	}
	public String getLecture_teacher() {
		return lecture_teacher;
	}
	public void setLecture_teacher(String lecture_teacher) {
		this.lecture_teacher = lecture_teacher;
	}
	public Date getLecture_start_day() {
		return lecture_start_day;
	}
	public void setLecture_start_day(Date lecture_start_day) {
		this.lecture_start_day = lecture_start_day;
	}
	public Date getLecture_end_day() {
		return lecture_end_day;
	}
	public void setLecture_end_day(Date lecture_end_day) {
		this.lecture_end_day = lecture_end_day;
	}
	public String getLecture_week_day() {
		return lecture_week_day;
	}
	public void setLecture_week_day(String lecture_week_day) {
		this.lecture_week_day = lecture_week_day;
	}
	public String getLecture_content() {
		return lecture_content;
	}
	public void setLecture_content(String lecture_content) {
		this.lecture_content = lecture_content;
	}
	public int getLecture_fee() {
		return lecture_fee;
	}
	public void setLecture_fee(int lecture_fee) {
		this.lecture_fee = lecture_fee;
	}
	public String getLecture_time() {
		return lecture_time;
	}
	public void setLecture_time(String lecture_time) {
		this.lecture_time = lecture_time;
	}
	public String getLecture_room() {
		return lecture_room;
	}
	public void setLecture_room(String lecture_room) {
		this.lecture_room = lecture_room;
	}
	public String getLecture_teacher_code() {
		return lecture_teacher_code;
	}
	public void setLecture_teacher_code(String lecture_teacher_code) {
		this.lecture_teacher_code = lecture_teacher_code;
	}
	
	
	
	
	
	
}
