package svc.lecture;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.List;

import dao.LectureDAO;
import vo.LectureBean;

public class LectureInsertService {

	public List<LectureBean> lectureInsertList(String lecture_room) {
		
		LectureDAO ldao = LectureDAO.getInstance();
		Connection con = getConnection();
		ldao.setConnection(con);
		
		List<LectureBean> list = ldao.lectureInsertList(lecture_room);
		close(con);
		
		return list;
	}
	public int[] lectureCount(String lecture_room) {
		
		LectureDAO ldao = LectureDAO.getInstance();
		Connection con = getConnection();
		ldao.setConnection(con);
		
		int[] lecture_counts = ldao.lectureCount(lecture_room);
		close(con);
		
		return lecture_counts;
	}
	
}
