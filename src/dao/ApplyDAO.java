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
	
	public ArrayList<LectureBean> selectApplyList(int page, int limit, String sId, String listType){
		ArrayList<LectureBean> applyList = new ArrayList<LectureBean>();
		
		int startRow = (page-1)*10;
		
//		String sql = "SELECT apply_lecture_idx FROM apply WHERE apply_member_id =? ORDER BY apply_purchase_date DESC LIMIT ?,?";

		String sql = ""; 
		if(listType.equals("")||listType.equals("now")) {
			sql = "select l.lecture_subject, l.lecture_start_day, l.lecture_end_day, l.lecture_course "
		+ "from lecture l join apply a on (l.lecture_idx = a.apply_lecture_idx) where a.apply_member_id = ? AND a.apply_ischeck = ?"
		+ "AND l.lecture_start_day <=now() and l.lecture_end_day >=now() "
		+ "ORDER BY l.lecture_idx DESC LIMIT ?,?";
		}else if(listType.equals("end")) {
			sql = "select l.lecture_subject, l.lecture_start_day, l.lecture_end_day, l.lecture_course "
		+ "from lecture l join apply a on (l.lecture_idx = a.apply_lecture_idx) where a.apply_member_id = ? AND a.apply_ischeck = ?"
		+ "AND l.lecture_end_day < now() "
		+ "ORDER BY l.lecture_idx DESC LIMIT ?,?";	
		}else {
			sql = "select l.lecture_subject, l.lecture_start_day, l.lecture_end_day, l.lecture_course "
		+ "from lecture l join apply a on (l.lecture_idx = a.apply_lecture_idx) where a.apply_member_id = ? AND a.apply_ischeck = ?"
		+ "ORDER BY l.lecture_idx DESC LIMIT ?,?";	
			
		}
		try {
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1,sId);
			pstmt.setString(2, "1");
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, limit);
			rs =pstmt.executeQuery();
			
			while(rs.next()) {
				LectureBean lb = new LectureBean();
				lb.setLecture_subject(rs.getString("lecture_subject"));
				lb.setLecture_course(rs.getString("lecture_course"));
				lb.setLecture_start_day(rs.getDate("lecture_start_day"));
				lb.setLecture_end_day(rs.getDate("lecture_end_day"));
				
				applyList.add(lb);
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
	public ArrayList<ApplyBean> selectApplyList2(int page, int limit, String sId, String listType) {
		ArrayList<ApplyBean> applyList2 = new ArrayList<ApplyBean>();
		int startRow = (page-1)*10;
		String sql = "";
				if(listType.equals("")||listType.equals("now")) {
					sql ="select a.apply_purchase_date "
				+ "from lecture l join apply a on (l.lecture_idx = a.apply_lecture_idx) where a.apply_member_id =? AND a.apply_ischeck = ?" 
                + "AND l.lecture_start_day <=now() and l.lecture_end_day >=now() "
				+ "ORDER BY l.lecture_idx DESC LIMIT ?,?";
				}else if(listType.equals("end")) {
					sql ="select a.apply_purchase_date "
				+ "from lecture l join apply a on (l.lecture_idx = a.apply_lecture_idx) where a.apply_member_id = ? AND a.apply_ischeck = ?" 
				+ "AND l.lecture_end_day < now() "
				+ "ORDER BY l.lecture_idx DESC LIMIT ?,?";	
				}else {					
					sql ="select a.apply_purchase_date "
						+ "from lecture l join apply a on (l.lecture_idx = a.apply_lecture_idx) where a.apply_member_id =? AND a.apply_ischeck = ?" 
						+ "ORDER BY l.lecture_idx DESC LIMIT ?,?";	
					
				}
				try {
					pstmt =con.prepareStatement(sql);
					pstmt.setString(1,sId);
					pstmt.setString(2, "1");
					pstmt.setInt(3, startRow);
					pstmt.setInt(4, limit);
					rs =pstmt.executeQuery();
					
					while(rs.next()) {
						ApplyBean ab = new ApplyBean();
						ab.setApply_purchase_date(rs.getDate("apply_purchase_date"));
						
						applyList2.add(ab);
					}
					
				} catch (SQLException e) {
					System.out.println("selectApplyList() 에러" + e.getMessage());
				}
				finally {
					close(rs);
					close(pstmt);
				}
						
				return applyList2;
	}
	
	
	public int selectApplyListCount(String sId, String listType) {
		int listCount = 0;
		
		String sql ="";
			if(listType.equals("")||listType.equals("now")) {	
				sql="SELECT COUNT(*) FROM apply a JOIN lecture l ON (l.lecture_idx = a.apply_lecture_idx) "
						+ "WHERE a.apply_member_id =? "
						+ "AND a.apply_ischeck = ?"
						+ "AND l.lecture_start_day <=now() AND l.lecture_end_day >=now()";
			}else if(listType.equals("end")) {
				sql="SELECT COUNT(*) FROM apply a JOIN lecture l ON (l.lecture_idx = a.apply_lecture_idx) "
						+ "WHERE a.apply_member_id =? "
						+ "AND a.apply_ischeck = ?"
						+ "AND  l.lecture_end_day < now()";
			}else {
				sql="SELECT COUNT(*) FROM apply a JOIN lecture l ON (l.lecture_idx = a.apply_lecture_idx) "
						+ "WHERE a.apply_member_id =? AND a.apply_ischeck = ?";
			}
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sId);
			pstmt.setString(2, "1");
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
