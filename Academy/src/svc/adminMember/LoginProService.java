package svc.adminMember;

import java.sql.Connection;

import dao.MemberDAO;

import static db.JdbcUtil.*;

public class LoginProService {
	
	public boolean isLoginMember(String id,String password) {
		System.out.println("LoginProService");
		System.out.println(id + password);
		boolean isLoginMember = false;
		
		Connection con =getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		isLoginMember = memberDAO.selectLogin(id,password);
	
		close(con);
		return isLoginMember; 
	}

}
