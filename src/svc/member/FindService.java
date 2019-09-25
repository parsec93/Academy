package svc.member;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;
public class FindService {
	public String FindIdService(String name, String email) {
		System.out.println("FindService");
		
		String id = null;
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		id = memberDAO.findId(name, email);
		
		close(con);
		return id;
	}
	
	public String FindPassService(String id, String email) {
		System.out.println("FindService");
		
		String pass = null;
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		pass = memberDAO.findId(id, email);
		
		close(con);
		return pass;
	}
}
