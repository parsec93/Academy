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

}
