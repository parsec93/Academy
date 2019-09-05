package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.LectureBean;

public class LectureDAO {
	private static LectureDAO instance = null;
	private LectureDAO() {}
	public static LectureDAO getInstance() {
		if(instance == null) {
			instance = new LectureDAO();
		}
		return instance;
	}
	
	Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public ArrayList<LectureBean> selectLectureList(int page, int limit){
		ArrayList<LectureBean> lectureList = new ArrayList<LectureBean>();
		int startRow = (page-1) *10;
		String sql = "SELECT * FROM lecture ORDER BY lecture_idx DESC LIMIT ?,?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				LectureBean lectureBean = new LectureBean();
				lectureBean.setLecture_idx(rs.getInt("lecture_idx"));
				lectureBean.setLecture_subject(rs.getString("lecture_subject"));
				lectureBean.setLecture_course(rs.getString("lecture_course"));
				lectureBean.setLecture_teacher(rs.getString("lecture_teacher"));
				lectureBean.setLecture_start_day(rs.getDate("lecture_start_day"));
				lectureBean.setLecture_end_day(rs.getDate("lecture_end_day"));
				lectureList.add(lectureBean);
			}
		} catch (SQLException e) {
			System.out.println("selectLectureList() 에러 " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return lectureList;
	}
	public int selectLectureListCount() {
		int listCount =0 ;
		
		String sql = "SELECT COUNT(*) FROM lecture";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount =rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("selectLectureListCount() 에러" + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
		
	}
	public LectureBean selectArticle(int lecture_idx) {
		LectureBean lectureBean = new LectureBean();
		String sql = "SELECT * FROM lecture WHERE lecture_idx =?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, lecture_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				lectureBean.setLecture_idx(lecture_idx);
				lectureBean.setLecture_subject(rs.getString("lecture_subject"));
				lectureBean.setLecture_course(rs.getString("lecture_course"));
				lectureBean.setLecture_teacher(rs.getString("lecture_teacher"));
				lectureBean.setLecture_start_day(rs.getDate("lecture_start_day"));
				lectureBean.setLecture_end_day(rs.getDate("lecture_end_day"));
				lectureBean.setLecture_week_day(rs.getString("lecture_week_day"));
				lectureBean.setLecture_content(rs.getString("lecture_content"));
				lectureBean.setLecture_fee(rs.getInt("lecture_fee"));
				
	
			}
		} catch (SQLException e) {
            System.out.println("selectArticle() 에러 - " + e.getMessage());
			e.printStackTrace();
		} finally {
            close(rs);
            close(pstmt);
        }
        
        return lectureBean;
        
			
	}
	public int isUpdateArticle(LectureBean article) {
		int updateCount = 0;
		
		String sql = "UPDATE lecture SET lecture_subject=?,lecture_course=?,lecture_teacher=?,lecture_start_day=?,"
				+ "lecture_end_day=?,lecture_week_day=?,lecture_content=?,lecture_fee=? WHERE lecture_idx=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getLecture_subject());
			pstmt.setString(2, article.getLecture_course());
			pstmt.setString(3, article.getLecture_teacher());
			pstmt.setDate(4, article.getLecture_start_day());
			pstmt.setDate(5, article.getLecture_end_day());
			pstmt.setString(6, article.getLecture_week_day());
			pstmt.setString(7, article.getLecture_content());
			pstmt.setInt(8, article.getLecture_fee());
			pstmt.setInt(9, article.getLecture_idx());
			updateCount = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
            close(pstmt);
        }
        
        return updateCount;
		
		
	}

	
	public int deleteLecture(int lecture_idx) {
		PreparedStatement pstmt = null;
		
		int deleteCount = 0;
		
		try {
			String sql = "DELETE FROM LECTURE WHERE lecture_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, lecture_idx);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception e) {
			
		} finally {
			close(pstmt);
		}
		
		return deleteCount;
	}
	public int lectureInsert(LectureBean lb) {
		int isSuccess = 0;
		String sql = "insert into lecture values(null,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,lb.getLecture_subject());
			pstmt.setString(2, lb.getLecture_course());
			pstmt.setString(3, lb.getLecture_teacher());
			pstmt.setDate(4, lb.getLecture_start_day());
			pstmt.setDate(5, lb.getLecture_end_day());
			pstmt.setString(6, lb.getLecture_week_day());
			pstmt.setString(7, lb.getLecture_content());
			pstmt.setInt(8, lb.getLecture_fee());
			
			isSuccess = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("lectureInsert() 에러" + e.getMessage());
		}finally {
			close(pstmt);
		}
		
		return isSuccess;
	}
	
}
