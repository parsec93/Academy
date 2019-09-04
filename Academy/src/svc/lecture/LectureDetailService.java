package svc.lecture;

import java.sql.Connection;

import dao.LectureDAO;
import vo.LectureBean;
import static db.JdbcUtil.*;

public class LectureDetailService {
	
	public LectureBean getArticle(int lecture_idx) {
		Connection con =getConnection();
		LectureDAO lectureDAO = LectureDAO.getInstance();
		lectureDAO.setConnection(con);
		
		LectureBean article = lectureDAO.selectArticle(lecture_idx);
		close(con);
		return article;
	}

}
