package svc.member;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import vo.MemberBean;

public class MemberListService {
	
	//전체 회원 목록을 조회하여 리턴 
	public ArrayList<MemberBean> getMemberList(int page, int limit) throws Exception {
		System.out.println("MemberListService 의 getMemberList() 메서드");
		
		ArrayList<MemberBean> memberList = null;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		memberList = memberDAO.selectMemberList(page, limit);
		
		close(con);
		
		return memberList;
		
	}
	
	//전체 회원 목록 수를 조회하여 리턴하는 getMemberListCount()
	public int getMemberListCount() throws Exception{
		int listCount = 0; // 회원 수를 저장하는 변수 
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		// selectMemberListCount() 메서드를 호출하여 전체 회원 수를 조회하여 listCount 변수에 저장
		listCount = memberDAO.selectMembertListCount();
		
		close(con);
		
		return listCount;
	}

}
