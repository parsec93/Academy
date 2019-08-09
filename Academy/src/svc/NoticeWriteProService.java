package svc;

import java.sql.Connection;

import dao.NoticeDAO;
import db.JdbcUtil;
import vo.NoticeBean;
import static db.JdbcUtil.*;

public class NoticeWriteProService {

	public boolean registNotice(NoticeBean noticeBean) throws Exception{
		System.out.println("NoticeWriteProService!");
		
		boolean isWriteSuccess = false; // 공지사항 쓰기 성공 / 실패 여부 저장 변수 
		
		Connection con = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstacne();
		noticeDAO.setConnection(con); // DAO 객체에 Connection 객체 전달 
		
		// DAO 객체의 insertNotice() 메서드를 호출하여 NoticeBean 객체 전달 => 결과값 정수 리턴 받기
		int insertCount = noticeDAO.insertNotice(noticeBean);
		
		 // insertCount 가 1 이면 글 등록 성공이므로 commit() 실행 및 isWriteSuccess 를 true 로 설정
        // 아니면 rollback() 실행
        if(insertCount == 1) {
            con.commit();
            isWriteSuccess = true;
        } else {
            con.rollback();
        }
        
        // Connection 객체 반환
        close(con);
        
        return isWriteSuccess;
		
		
		
	}
}
