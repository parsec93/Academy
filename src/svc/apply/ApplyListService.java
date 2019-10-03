package svc.apply;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ApplyDAO;
import dao.AttendDAO;

import static db.JdbcUtil.*;

import vo.ApplyBean;
import vo.AttendBean;
import vo.LectureBean;

public class ApplyListService {
	
	
	public ArrayList<LectureBean> getApplyList(int page, int limit, String sId, String listType){
		System.out.println("ApplyListService");
		ArrayList<LectureBean> applyList = null;
		Connection con = getConnection();
		
		ApplyDAO applyDAO = ApplyDAO.getInstance();
		
		applyDAO.setConnection(con);
		
		applyList = applyDAO.selectApplyList(page, limit, sId, listType);
		
		close(con);
		
		return applyList;
	}
	public ArrayList<ApplyBean> getApplyList2(int page, int limit, String sId, String listType){
		System.out.println("ApplyListService");
		ArrayList<ApplyBean> applyList2 = null;
		Connection con = getConnection();
		
		ApplyDAO applyDAO = ApplyDAO.getInstance();
		
		applyDAO.setConnection(con);
		
		applyList2 = applyDAO.selectApplyList2(page, limit, sId, listType);
		
		close(con);
		
		return applyList2;
	}
	//출석체크 현황을 가져온다
	public ArrayList<AttendBean> getApplyAttendList(int page, int limit,String sId) {
		System.out.println("ApplyListService/getApplyList3");
		ArrayList<AttendBean> applyList3 = null;
		Connection con = getConnection();
		AttendDAO attendDAO = AttendDAO.getInstance();
		attendDAO.setConnection(con);
		applyList3 = attendDAO.selectApplyAttendList(page, limit,sId);
		close(con);
		return applyList3;
	}
	public int getApplyListCount(String sId, String listType) {
		int listCount=0;
		Connection con = getConnection();
		
		ApplyDAO applyDAO = ApplyDAO.getInstance();
		applyDAO.setConnection(con);
		
		listCount = applyDAO.selectApplyListCount(sId, listType);
		close(con);
		return listCount;
		
	}
	
}
