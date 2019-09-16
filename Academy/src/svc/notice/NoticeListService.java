package svc.notice;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.NoticeDAO;
import vo.NoticeBean;

public class NoticeListService {
	
	// 전체 게시물 목록을 조회하여 리턴 
	public ArrayList<NoticeBean> getNoticeList(int page, int limit, int nt_ev) throws Exception{
		System.out.println("NoticeListService의 getNoticeList() 메서드 ");
		
		ArrayList<NoticeBean> noticeList = null;
		
		Connection con = getConnection();
		
		NoticeDAO noticeDAO = NoticeDAO.getInstacne();
		
		noticeDAO.setConnection(con);
		
		noticeList = noticeDAO.selectNoticeList(page, limit, nt_ev);
		
		close(con);
		
		return noticeList;
	
	}
	
	// 전체 게시물 개수를 조회하여 리턴하는 getNoticeListCount()
	public int getNoticeListCount(int isNotice) throws Exception {
		int listCount = 0; // 전체 게시물 수를 저장하는 변수 
		
		Connection con = getConnection();
		
		NoticeDAO noticeDAO = NoticeDAO.getInstacne();
		
		noticeDAO.setConnection(con);
		
		// selectNoticeListCount() 메서드를 호출하여 전체 게시물 수를 조회하여 listCount 변수에 저장 
		listCount = noticeDAO.selectNoticeListCount(isNotice);
		
		close(con);
		
		return listCount;
		
		
	}
	
	
	
	
}
