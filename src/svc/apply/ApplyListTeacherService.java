package svc.apply;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ApplyDAO;

import static db.JdbcUtil.*;

import vo.ApplyBean;
import vo.LectureBean;

public class ApplyListTeacherService {
	
	
	public ArrayList<LectureBean> getListTeacher(int page, int limit, String sId, String listType){
		System.out.println("ApplyListService");
		ArrayList<LectureBean> applyList = null;
		Connection con = getConnection();
		
		ApplyDAO applyDAO = ApplyDAO.getInstance();
		
		applyDAO.setConnection(con);
		
		applyList = applyDAO.selectListTeacher(page, limit, sId, listType);
		
		close(con);
		
		return applyList;
	}

	
	public int getListCountTeacher(String sId,String listType) {
		int listCount=0;
		Connection con = getConnection();
		
		ApplyDAO applyDAO = ApplyDAO.getInstance();
		applyDAO.setConnection(con);
		
		listCount = applyDAO.selectListCountTeacher(sId, listType);
		close(con);
		return listCount;
		
	}
}
