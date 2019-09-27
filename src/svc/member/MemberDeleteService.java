package svc.member;

import java.sql.Connection;

import dao.MemberDAO;

import static db.JdbcUtil.*;
public class MemberDeleteService {
	public boolean isMember(int member_idx, String member_id){
		Connection con = null;
		con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		boolean isMember = false;
		isMember = memberDAO.isMember(member_idx,member_id);
		
		close(con);
		return isMember;
	}
	
	public boolean remove(String member_id, String member_pass) {
		boolean isDeleteSuccess = false;
		Connection con = null;
		con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		int deleteCount = memberDAO.deleteMember(member_id,member_pass);
		
		if(deleteCount > 0) {
			commit(con);
			isDeleteSuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return isDeleteSuccess;
	}
	
	
	
	
}
