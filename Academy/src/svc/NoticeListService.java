package svc;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.NoticeDAO;
import vo.NoticeBean;

public class NoticeListService {
	
	public ArrayList<NoticeBean> getNoticeList(){
		System.out.println("NoticeListService의 getNoticeList() 메서드 ");
		Connection con = getConnection();
		
		NoticeDAO noticeDAO = NoticeDAO.getInstacne();
		noticeDAO.setConnection(con);
		
		ArrayList<NoticeBean> noticeList = noticeDAO.getNoticeList();
		
		close(con);
		
		return noticeList;
	
				
	}
}
