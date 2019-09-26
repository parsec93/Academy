package svc.apply;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ApplyDAO;

import static db.JdbcUtil.*;

import vo.ApplyBean;
import vo.LectureBean;
import vo.MemberBean;

public class ApplyMemberListService {
	
	
	public ArrayList<MemberBean> getApplyMemberList(String lecture_idx){
		System.out.println("ApplyMemberListService");
		ArrayList<MemberBean> applyMemberList = null;
		Connection con = getConnection();
		
		ApplyDAO applyDAO = ApplyDAO.getInstance();
		
		applyDAO.setConnection(con);
		
		applyMemberList = applyDAO.selectApplyMemberList(lecture_idx);
		
		close(con);
		
		return applyMemberList;
	}


}
