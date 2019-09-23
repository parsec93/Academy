package svc.apply;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ApplyDAO;

import static db.JdbcUtil.*;

import vo.ApplyBean;
import vo.LectureBean;

public class ApplyListService {
	
	
	public ArrayList<LectureBean> getApplyList(int page, int limit, String sId){
		System.out.println("ApplyListService");
		ArrayList<LectureBean> applyList = null;
		Connection con = getConnection();
		
		ApplyDAO applyDAO = ApplyDAO.getInstance();
		
		applyDAO.setConnection(con);
		
		applyList = applyDAO.selectApplyList(page, limit, sId);
		
		close(con);
		
		return applyList;
	}
	public ArrayList<ApplyBean> getApplyList2(int page, int limit, String sId){
		System.out.println("ApplyListService");
		ArrayList<ApplyBean> applyList2 = null;
		Connection con = getConnection();
		
		ApplyDAO applyDAO = ApplyDAO.getInstance();
		
		applyDAO.setConnection(con);
		
		applyList2 = applyDAO.selectApplyList2(page, limit, sId);
		
		close(con);
		
		return applyList2;
	}
	
	public int getApplyListCount() {
		int listCount=0;
		Connection con = getConnection();
		
		ApplyDAO applyDAO = ApplyDAO.getInstance();
		applyDAO.setConnection(con);
		
		listCount = applyDAO.selectApplyListCount();
		close(con);
		return listCount;
		
	}
}
