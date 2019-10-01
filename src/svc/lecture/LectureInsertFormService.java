package svc.lecture;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.LectureDAO;
import vo.MemberBean;

public class LectureInsertFormService {
	

	public ArrayList<MemberBean> getTeatureCode() {
		ArrayList<MemberBean> tc = new ArrayList<>();
		LectureDAO ldao = LectureDAO.getInstance();
		Connection con = getConnection();
		ldao.setConnection(con);
		
		tc = ldao.selectTeatureCode();
		close(con);
		return tc;
	}
	
}
