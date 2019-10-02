package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ApplyBean;
import vo.LectureBean;
import vo.MemberBean;

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
			sql = "select l.lecture_idx, l.lecture_subject, l.lecture_start_day, l.lecture_end_day, l.lecture_course "
		+ "from lecture l join apply a on (l.lecture_idx = a.apply_lecture_idx) where a.apply_member_id = ? AND a.apply_ischeck = ?"
		+ "AND l.lecture_start_day <=now() and l.lecture_end_day >=now() "
		+ "ORDER BY l.lecture_idx DESC LIMIT ?,?";
		}else if(listType.equals("end")) {
			sql = "select l.lecture_idx, l.lecture_subject, l.lecture_start_day, l.lecture_end_day, l.lecture_course "
		+ "from lecture l join apply a on (l.lecture_idx = a.apply_lecture_idx) where a.apply_member_id = ? AND a.apply_ischeck = ?"
		+ "AND l.lecture_end_day < now() "
		+ "ORDER BY l.lecture_idx DESC LIMIT ?,?";	
		}else {
			sql = "select l.lecture_idx, l.lecture_subject, l.lecture_start_day, l.lecture_end_day, l.lecture_course "
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
				lb.setLecture_idx(rs.getInt("lecture_idx"));
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
					sql ="select a.apply_purchase_date, a.apply_review, a.apply_lecture_idx "
				+ "from lecture l join apply a on (l.lecture_idx = a.apply_lecture_idx) where a.apply_member_id =? AND a.apply_ischeck = ?" 
                + "AND l.lecture_start_day <=now() and l.lecture_end_day >=now() "
				+ "ORDER BY l.lecture_idx DESC LIMIT ?,?";
				}else if(listType.equals("end")) {
					sql ="select a.apply_purchase_date, a.apply_review, a.apply_lecture_idx "
				+ "from lecture l join apply a on (l.lecture_idx = a.apply_lecture_idx) where a.apply_member_id = ? AND a.apply_ischeck = ?" 
				+ "AND l.lecture_end_day < now() "
				+ "ORDER BY l.lecture_idx DESC LIMIT ?,?";	
				}else {					
					sql ="select a.apply_purchase_date, a.apply_review, a.apply_lecture_idx "
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
						ab.setApply_lecture_idx(rs.getInt("apply_lecture_idx"));
						ab.setApply_purchase_date(rs.getDate("apply_purchase_date"));
						ab.setApply_review(rs.getString("apply_review"));
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
	public int reviewInsert(ApplyBean ab) {
		System.out.println("insertReview");
		int isInsertSuccess = 0;
		
		String sql = "update apply set apply_review =? where apply_lecture_idx=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ab.getApply_review());
			pstmt.setInt(2, ab.getApply_lecture_idx());
			
			isInsertSuccess = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertReview 실패 - " + e.getMessage());
		}finally {
			close(pstmt);
		}

		return isInsertSuccess;
	}
	
	public ArrayList<LectureBean> selectListTeacher(int page, int limit, String sId){
		ArrayList<LectureBean> applyList = new ArrayList<LectureBean>();
		
		int startRow = (page-1)*10;
		
//		String sql = "SELECT apply_lecture_idx FROM apply WHERE apply_member_id =? ORDER BY apply_purchase_date DESC LIMIT ?,?";

		String sql = "select l.lecture_subject, l.lecture_week_day, l.lecture_room, l.lecture_time, l.lecture_end_day, l.lecture_idx "
		+ "from lecture l join member m on (l.lecture_teacher_code = m.member_teacher_code) "
		+ "WHERE m.member_id= ? "
		+ "AND l.lecture_start_day <=now() and l.lecture_end_day >=now() "
		+ "ORDER BY l.lecture_idx DESC LIMIT ?,?";
	
		try {
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1,sId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, limit);
			rs =pstmt.executeQuery();
			
			while(rs.next()) {
				LectureBean lb = new LectureBean();
				lb.setLecture_idx(rs.getInt("lecture_idx"));
				lb.setLecture_subject(rs.getString("lecture_subject"));
				lb.setLecture_week_day(rs.getString("lecture_week_day"));
				lb.setLecture_room(rs.getString("lecture_room"));
				lb.setLecture_time(rs.getString("lecture_time"));
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
	
	
	
	public int selectListCountTeacher(String sId) {
		int listCount = 0;
		
		String 	sql="SELECT COUNT(*) FROM member m JOIN lecture l ON (m.member_teacher_code = l.lecture_teacher_code) "
						+ "WHERE m.member_id= ? "
						+ "AND l.lecture_start_day <=now() AND l.lecture_end_day >=now()";
	
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sId);
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
	public ArrayList<MemberBean> selectApplyMemberList(String lecture_idx){
		ArrayList<MemberBean> applyMemberList = new ArrayList<MemberBean>();
		
		String sql = "SELECT m.member_idx, m.member_name, m.member_id, m.member_phone FROM member m JOIN apply a ON (m.member_id =a.apply_member_id)"
				+ "WHERE a.apply_lecture_idx = ? AND apply_ischeck=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,lecture_idx);
			pstmt.setString(2, "1");
			rs =pstmt.executeQuery();
			
			while(rs.next()) {
				MemberBean mb = new MemberBean();
				mb.setMember_idx(rs.getInt("member_idx"));
				mb.setMember_name(rs.getString("member_name"));
				mb.setMember_id(rs.getString("member_id"));
				mb.setMember_phone(rs.getString("member_phone"));
				applyMemberList.add(mb);
			}
			
		} catch (SQLException e) {
			System.out.println("selectApplyMemberList() 에러" + e.getMessage());		
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return applyMemberList;
	}

	
	

}
