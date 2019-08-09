package dao;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
	
	
	
	
}
