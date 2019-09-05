package svc.lecture;

import java.sql.Connection;

import dao.LectureDAO;
import vo.LectureBean;
import static db.JdbcUtil.*;

public class LectureUpdateService {
	
	public boolean updateArticle(LectureBean article) {
		Connection con = getConnection();
		LectureDAO lectureDAO =LectureDAO.getInstance();
		lectureDAO.setConnection(con);
		
		boolean isUpdateSuccess = false;
		int updateCount = lectureDAO.isUpdateArticle(article);
		if(updateCount ==1) {
			commit(con);
			isUpdateSuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
		return isUpdateSuccess;
	
		
	}

}
