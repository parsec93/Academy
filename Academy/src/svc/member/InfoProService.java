package svc.member;

import vo.MemberBean;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;

public class InfoProService {
	
	public MemberBean getInfo(String member_id) {
		System.out.println("getInfo");
		Connection con =getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		MemberBean memberBean = memberDAO.selectInfo(member_id);
		close(con);
		return memberBean;
	
	}

}
