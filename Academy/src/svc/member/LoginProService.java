package svc.member;

import java.sql.Connection;

import dao.MemberDAO;

import static db.JdbcUtil.*;

public class LoginProService {
	
	public boolean isLoginMember(String id,String password) {
		System.out.println("LoginProService");
		System.out.println(id + password);
		Connection con =getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		boolean isLoginMember = memberDAO.selectLogin(id,password);
		
		close(con);
		return isLoginMember; 
	}

}
