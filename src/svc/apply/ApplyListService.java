package svc.apply;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ApplyDAO;

import static db.JdbcUtil.*;

import vo.ApplyBean;

public class ApplyListService {
	
	
	public ArrayList<ApplyBean> getApplyList(int page, int limit){
		System.out.println("ApplyListService");
		ArrayList<ApplyBean> applyList = null;
		Connection con = getConnection();
		
		ApplyDAO applyDAO = ApplyDAO.getInstance();
		
		applyDAO.setConnection(con);
		
		applyList = applyDAO.selectApplyList(page, limit);
		
		close(con);
		
		return applyList;
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
