package dao;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.NoticeBean;

public class NoticeDAO {
	// DAO 인스턴스 생성 관리를 위한 싱글톤 디자인 패턴 
	private static NoticeDAO instance;
	private NoticeDAO() {}
	
	public static NoticeDAO getInstacne() {
		// 기존의 NoticeDAO 인스턴스가 없을 경우에만 인스턴스를 새로 생성 
		if( instance == null) {
			instance = new NoticeDAO();
		}
		
		return instance;
	}
	
	//-----------------------------------------------
	
	Connection con;
	
	// Service 클래스로부터 Connection 객체 전달받는 메서드 
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	
	//공지사항 글 작성 요청을 처리하는 insertNotice() 메서드 
	public int insertNotice(NoticeBean notice) throws Exception{
		System.out.println("NoticeDAO의 insertNotice 메서드()");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int insertCount = 0; // 공지 등록 성공 여부를 저장할 변수 (성공 = 1, 실패 = 0);
		
		try {
			// 현재 공지/이벤트 번호 중 가장 큰 번호 조회 
			String sql = "SELECT MAX(notice_idx) FROM notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int num = 1; // 게시물 번호 저장할 변수 (기본값 = 1);
			
			if(rs.next()) {
				// 기존 게시물이 존재할 경우(가장 큰 번호를 조회했을 경우)
				 num = rs.getInt(1) + 1; // 가장 큰 번호 + 1 값( 새로운 공지 글 번호)을 저장 
			}
			
			// 공지 글 등록 구문 작성(notice_date 컬럼은 DB 현재 시각 정보 사용)
			sql = "INSERT INTO notice VALUES( ?,?,?,?,now(),?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, notice.getNotice_subject());
			pstmt.setString(3, notice.getNotice_content());
			pstmt.setString(4, notice.getNotice_file());
			pstmt.setDate(5, null);
			pstmt.setDate(6, null);
			pstmt.setInt(7, 1);
			
			insertCount = pstmt.executeUpdate(); // 글 등록 처리 결과를 int형 값으로 리턴 받음
			
		} catch (Exception e) {
			System.out.println("insertArticle() 에러!"+e.getMessage());
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return insertCount;
			
	}
	
	
	//Notice(공지사항) 게시판 출력 
	public ArrayList<NoticeBean> selectNoticeList(int page, int limit){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<NoticeBean> noticeList = new ArrayList<NoticeBean>();
		
		int startRow = (page -1 ) * 10; // 읽어올 목록의 첫 레코드 번호
		
		
		try {
			String sql = "SELECT * FROM notice ORDER BY notice_idx DESC  LIMIT ?,? ";
			//전체 게시판 목록 조회
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			
			//ResultSet 객체 내의 모든 레코드를 각각 레코드별로 NoticeBean 에 담아서 ArrayList 객체에 저장 
			
			while(rs.next()) {
				NoticeBean noticeBean = new NoticeBean();
				
				noticeBean.setNotice_idx(rs.getInt("notice_idx"));
				noticeBean.setNotice_subject(rs.getString("notice_subject"));
				noticeBean.setNotice_date(rs.getDate("notice_date"));
				
				noticeList.add(noticeBean);
				
			}
		} catch (Exception e) {
			System.out.println("selectArticleList() 에러 " + e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		return noticeList;
	}
	
	// 전체 게시물 수를 조회하여 리턴 
	public int selectNoticeListCount() {
		int listCount = 0; // 게시물 개수를 저장하느니 변수 
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) FROM notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("selectListCount() 에러" + e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	
	//이벤트 목록 가져오기
	public ArrayList<NoticeBean> getEventList(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<NoticeBean> eventList = null;
		String sql = "SELECT * FROM notice WHERE isNotice=2 AND event_end_day >= now() ORDER BY notice_idx DESC,event_end_day DESC";
		
		try {	
			//이벤트 게시판 목록 가져오기
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			eventList = new ArrayList<NoticeBean>();
			
			while(rs.next()) {
				NoticeBean noticeBean = new NoticeBean();
				noticeBean.setNotice_idx(rs.getInt("notice_idx"));
				noticeBean.setNotice_file(rs.getString("notice_file"));
				noticeBean.setEvent_start_day(rs.getDate("event_start_day"));
				noticeBean.setNotice_date(rs.getDate("notice_date"));
				noticeBean.setEvent_end_day(rs.getDate("event_end_day"));
				noticeBean.setNotice_subject(rs.getString("notice_subject"));
				eventList.add(noticeBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return eventList;
	}//이벤트 리스트 처리
	
	public NoticeBean selectArticle(int notice_idx) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		NoticeBean noticeBean=null;
		String sql = "select * from notice where notice_idx=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				noticeBean = new NoticeBean();
				noticeBean.setNotice_idx(rs.getInt("notice_idx"));
				noticeBean.setNotice_file(rs.getString("notice_file"));
				noticeBean.setEvent_start_day(rs.getDate("event_start_day"));
				noticeBean.setNotice_date(rs.getDate("notice_date"));
				noticeBean.setEvent_end_day(rs.getDate("event_end_day"));
				noticeBean.setNotice_subject(rs.getString("notice_subject"));
				noticeBean.setNotice_content(rs.getString("notice_content"));
				noticeBean.setIsNotice(rs.getInt("isNotice"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return noticeBean;
	}//NoticeView 처리(이벤트/공지 같이 사용)
	
}
