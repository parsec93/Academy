package svc.member;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;
import static db.JdbcUtil.*;

public class MemberJoinProService {
	public boolean insertMember(MemberBean mb) {
		
		boolean isInsertSuccess = false;
		
		Connection con = getConnection();
		MemberDAO mdao = MemberDAO.getInstance();
		mdao.setConnection(con);
		System.out.println("나는서비수");
		
		if(mdao.insertMember(mb)>0) {
			isInsertSuccess = true;
			commit(con);
		}else {
			rollback(con);
		}
		
		
		close(con);
		
		return isInsertSuccess;
	}
}
