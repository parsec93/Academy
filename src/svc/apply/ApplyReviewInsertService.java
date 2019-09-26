package svc.apply;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ApplyDAO;
import vo.ApplyBean;

public class ApplyReviewInsertService {

	public boolean reviewInsert(ApplyBean ab) {
		System.out.println("ApplyReviewInsertService");	
		boolean isInsertSuccess = false;
		
		Connection con = getConnection();
		ApplyDAO adao = ApplyDAO.getInstance();
		adao.setConnection(con);
		
		if(adao.reviewInsert(ab)>0) {
			isInsertSuccess = true;
			commit(con);
		}else {
			rollback(con);
		}
		
		return isInsertSuccess;
	}

}
