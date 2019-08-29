package svc.notice;

import java.sql.Connection;

import dao.NoticeDAO;
import vo.NoticeBean;
import static db.JdbcUtil.*;
public class NoticeUpdateProService {
	public boolean noticeUpdate(NoticeBean noticeBean) throws Exception{
		System.out.println("NoticeUpdateProService()");
		Connection con = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstacne();
		noticeDAO.setConnection(con);
		
		boolean isNoticeUpdate = false;
		
		int updateCount = noticeDAO.isNoticeUpdate(noticeBean);
		
		if(updateCount == 1) {
			commit(con);
			isNoticeUpdate = true;
		}else {
			rollback(con);
		}
		
		
		
		
		
		
		
		close(con);
		return isNoticeUpdate;
	}
}
