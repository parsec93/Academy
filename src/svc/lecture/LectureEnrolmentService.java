package svc.lecture;

import java.sql.Connection;


import java.util.ArrayList;
import java.util.List;

import dao.LectureDAO;
import vo.LectureBean;

import static db.JdbcUtil.*;
public class LectureEnrolmentService {


	public List<LectureBean> enrolmentLecture(String category_subject,String category_day,String category_time,String sId) {

		System.out.println("LectureEnrolmentService");
		String subject = "";
		String day = category_day;
		String time = "";

		if(category_subject.equals("0")) {
			subject="전체";
		}
		else if(category_subject.equals("1")) {
			
			subject="java";
		}else if(category_subject.equals("2")) {
			
			subject="oracle";
		}else if(category_subject.equals("3")) {
			
			subject="jsp";
		}
		
		
		if(category_time.equals("0")) {
			
			time="전체";
		}
		else if(category_time.equals("1")) {
			
			time="오전";
		}else if(category_time.equals("2")) {
			
			time="오후";
		}else if(category_time.equals("3")) {
			
			time="저녁";
		}
		
		if(category_day.equals("0")) {
			day="3";
		}else if(category_day.equals("1")) {
			
			day="0";
		}else if(category_day.equals("2")) {
			
			day="1";
		}
		
		System.out.println(subject);
		System.out.println(time);
		System.out.println(day);
		
		Connection con = getConnection();
		LectureDAO lectureDAO = LectureDAO.getInstance();
		lectureDAO.setConnection(con);
		List<LectureBean> lectureList=new ArrayList<LectureBean>();
		
		lectureList = lectureDAO.getLectureList(subject,day,time,sId);
		
	
		
		close(con);
		
		return lectureList;
		
	}
	
}
