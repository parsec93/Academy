package svc.member;


import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;

public class TeacherDeleteService {
	public boolean isTeacher(int member_idx, String member_id) throws Exception{
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		boolean isTeacher = false;
		
		isTeacher = memberDAO.isTeacher(member_idx, member_id);
		
		close(con);
		return isTeacher;
	}
	
	public boolean remove(int member_idx) throws Exception {
		boolean isremoveSuccess = false;
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		int deleteCount  = memberDAO.deleteTeacher(member_idx);
		
		if(deleteCount > 0) {
			commit(con);
			isremoveSuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
		return isremoveSuccess;
	}
}
