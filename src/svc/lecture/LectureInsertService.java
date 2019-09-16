package svc.lecture;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.LectureDAO;
import vo.LectureBean;

public class LectureInsertService {
	public boolean lectureInsert(LectureBean lb) {
		
		LectureDAO ldao = LectureDAO.getInstance();
		Connection con = getConnection();
		ldao.setConnection(con);
		boolean isSuccess = false;
		
		if(ldao.lectureInsert(lb) > 0) {
			isSuccess = true;
			commit(con);
		}else {
			rollback(con);
		}
		
		return isSuccess;
	}
}
