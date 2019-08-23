package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.NoticeDAO;
import vo.NoticeBean;

import static db.JdbcUtil.*;
public class EventListService {
	public ArrayList<NoticeBean> getEventList() {
		System.out.println("EventListService!");
		Connection con  = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstacne();
		noticeDAO.setConnection(con);
		
		ArrayList<NoticeBean> eventList = noticeDAO.getEventList();
		
		close(con);
		return eventList;
		
	}
}
