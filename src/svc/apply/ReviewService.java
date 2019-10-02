package svc.apply;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ApplyDAO;
import dao.BoardDAO;
import vo.ApplyBean;
import vo.LectureBean;

public class ReviewService {
	public int getReviewListCount(String lecture) {
		int listCount = 0; // 전체 게시물 수 저장하는 변수
        
        // Connection 객체 가져오기
        // static import 를 사용하여 JdbcUtil 클래스를 지정했으므로
        // JdbcUtil.getConnection(); 코드 대신 getConnection() 메서드 호출 코드만 작성하면 된다!
        Connection con = getConnection();  
        

    	ApplyDAO applyDAO = ApplyDAO.getInstance();
    	applyDAO.setConnection(con);
        // selectListCount() 메서드 호출하여 전체 게시물 수 조회하여 listCount 변수에 저장
        listCount = applyDAO.selectListCount(lecture);
        System.out.println(listCount);
        // Connection 객체 반환
        close(con);
        
        return listCount;
	}
	
	
public ArrayList<LectureBean> selectLecture(int page, int limit, String lecture) {
	Connection con = getConnection();
	ApplyDAO applyDAO = ApplyDAO.getInstance();
	applyDAO.setConnection(con);
	
	ArrayList<LectureBean> applyBean = new ArrayList<>();
		applyBean = applyDAO.selectLecture(page, limit, lecture);
	
	
	
	close(con);
	return applyBean;
}
}
