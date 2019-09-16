package svc.notice;

import dao.NoticeDAO;
import vo.NoticeBean;
import static db.JdbcUtil.*;

import java.sql.Connection;

public class NoticeViewService {
	public NoticeBean getArticle(int notice_idx) {
		System.out.println("NoticeViewService ");
		Connection con = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstacne();
		noticeDAO.setConnection(con);
		
		NoticeBean noticeBean = noticeDAO.selectArticle(notice_idx);
		
		
		
		close(con);
		return noticeBean;
	}
}
