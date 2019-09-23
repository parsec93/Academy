package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ApplyBean;
import vo.LectureBean;

public class ApplyDAO {
	private static ApplyDAO instance = null;
	private ApplyDAO() {}
	public static ApplyDAO getInstance() {
		if(instance == null) {
			instance = new ApplyDAO();
		}
		return instance;
	}
	
	Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public ArrayList<LectureBean> selectApplyList(int page, int limit, String sId){
		ArrayList<LectureBean> applyList = new ArrayList<LectureBean>();
		int startRow = (page-1)*10;
		int num =0;
		
		String sql = "SELECT apply_lecture_idx FROM apply WHERE apply_member_id =? ";
		try {
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1,sId);
			rs =pstmt.executeQuery();
			
			while(rs.next()) {
				num = rs.getInt("apply_lecture_idx");
				
		
				sql ="SELECT * from lecture where lecture_idx=? ORDER BY lecture_idx DESC LIMIT ?,? ";
				pstmt.setInt(1, num);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, limit);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					LectureBean lectureBean = new LectureBean();
					lectureBean.setLecture_subject(rs.getString("lecture_subject"));
					lectureBean.setLecture_course(rs.getString("lecture_course"));
					lectureBean.setLecture_teacher(rs.getString("lecture_teacher"));
					lectureBean.setLecture_start_day(rs.getDate("lecture_start_day"));
					lectureBean.setLecture_end_day(rs.getDate("lecture_end_day"));
					lectureBean.setLecture_week_day(rs.getString("lecture_week_day"));
					applyList.add(lectureBean);
				
				}
			}
			
			
		} catch (SQLException e) {
			System.out.println("selectApplyList() 에러" + e.getMessage());
		}
		finally {
			close(rs);
			close(pstmt);
		}
		
		return applyList;
	
		
		
		
	}
	
	
	public int selectApplyListCount() {
		int listCount = 0;
		
		String sql = "SELECT COUNT(*) FROM apply";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount =rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("selectApplyListCount() 에러" + e.getMessage());			
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
		
	}
	

}
