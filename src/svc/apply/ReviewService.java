package svc.apply;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ApplyDAO;
import vo.ApplyBean;
import vo.LectureBean;

public class ReviewService {
public ArrayList<LectureBean> selectLecture(String lecture) {
	Connection con = getConnection();
	ApplyDAO applyDAO = ApplyDAO.getInstance();
	applyDAO.setConnection(con);
	
	ArrayList<LectureBean> applyBean = new ArrayList<>();
		applyBean = applyDAO.selectLecture(lecture);
	
	
	
	close(con);
	return applyBean;
}
}
