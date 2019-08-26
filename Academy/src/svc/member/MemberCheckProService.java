package svc.member;

import dao.MemberDAO;
import static db.JdbcUtil.*;

import java.sql.Connection;

public class MemberCheckProService {
	public int idCheck(String id) {
		
		int check = 1;
		
		Connection con = getConnection();
		MemberDAO mdao = MemberDAO.getInstance();
		mdao.setConnection(con);
		
		check = mdao.idCheck(id);
		
		close(con);
		
		return check;
	}
}
