package svc.lecture;

import java.sql.Connection;

import dao.LectureDAO;

import static db.JdbcUtil.*;
public class LectureDeleteService {

	// 강의 번호를 전달받아서 등록된 강의 삭제
	public boolean deleteLecture(int lecutre_idx) {
		boolean isDeleteSuccess = false;
		
		Connection con = getConnection();
		LectureDAO lectureDAO = LectureDAO.getInstance();
		lectureDAO.setConnection(con);
		
		int deleteCount = lectureDAO.deleteLecture(lecutre_idx);
		
		if(deleteCount > 0) { // 삭제 성공했을 경우
            commit(con);
            isDeleteSuccess = true;
        } else { // 삭제 실패했을 경우
            rollback(con);
        }
		
		close(con);
		
		return isDeleteSuccess;
		
	}
	
}
