package svc.lecture;

import java.sql.Connection;
import static db.JdbcUtil.*;
import java.util.ArrayList;

import dao.LectureDAO;
import vo.LectureBean;

public class LectureListService {
	
	public ArrayList<LectureBean> getLectureList(int page, int limit){
		System.out.println("LectureListService");
		ArrayList<LectureBean> lectureList = null;
		Connection con = getConnection();
		
		LectureDAO lectureDAO = LectureDAO.getInstance();	
		
		lectureDAO.setConnection(con);
		
		lectureList = lectureDAO.selectLectureList(page,limit);
		
		close(con);
		
		return lectureList;
	}
	
	public int getLectureListCount() {
		
		int listCount = 0;
		Connection con =getConnection();
		
		LectureDAO lectureDAO = LectureDAO.getInstance();
		lectureDAO.setConnection(con);
		
		listCount = lectureDAO.selectLectureListCount();
		close(con);
		return listCount;
		
		
	}

}
