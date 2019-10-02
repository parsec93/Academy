package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.LectureBean;
import vo.MemberBean;

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
	
	public ArrayList<LectureBean> selectLectureList(int page, int limit, String listType){
		ArrayList<LectureBean> lectureList = new ArrayList<LectureBean>();
		int startRow = (page-1) *10;
		String sql ="";
		
		if(listType.equals("")||listType.equals("now")) {
			//진행중인 수업 일때
			sql = "SELECT * FROM lecture where lecture_start_day <=now() and lecture_end_day >=now() ORDER BY lecture_idx DESC LIMIT ?,?";
		}else if(listType.equals("end")) {
			//종료된 수업 일때
			sql = "SELECT * FROM lecture where lecture_end_day < now() ORDER BY lecture_idx DESC LIMIT ?,?";
		}else {
			//예정된 수업 일때
			sql = "SELECT * FROM lecture where lecture_start_day > now() ORDER BY lecture_idx DESC LIMIT ?,?";
		}
		
		
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
	public int selectLectureListCount(String listType) {
		int listCount =0 ;
		
		String sql ="";
		
		if(listType.equals("")||listType.equals("now")) {
			sql = "SELECT COUNT(*) FROM lecture WHERE lecture_start_day <=now() and lecture_end_day >=now()";	
		}else if(listType.equals("end")) {
			sql = "SELECT COUNT(*) FROM lecture WHERE  lecture_end_day <now()";	
		}else {
			sql = "SELECT COUNT(*) FROM lecture WHERE lecture_start_day > now() ";	
		}
			
		
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
	public int lectureInsert(LectureBean lb, int lecture_count) {
		int isSuccess = 0;
		String sql = "insert into lecture values(null,?,?,?,?,?,?,?,?,?,?,?,?)";
		
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
			pstmt.setString(9, lb.getLecture_time());
			pstmt.setString(10, lb.getLecture_room());
			pstmt.setInt(11, lecture_count);	
			pstmt.setString(12, lb.getLecture_teacher_code());
			isSuccess = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("lectureInsert() 에러" + e.getMessage());
		}finally {
			close(pstmt);
		}
		
		return isSuccess;
	}
	public List<LectureBean> lectureInsertList(String lecture_room, Date lecture_start_day) {
		
		List<LectureBean> list = new ArrayList<LectureBean>();
		String sql = "SELECT * FROM lecture where lecture_room=? and lecture_start_day=? order by lecture_count";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, lecture_room);
			String lecture_start_day2 = String.valueOf(lecture_start_day);
			pstmt.setString(2, lecture_start_day2);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				LectureBean lectureBean = new LectureBean();
				lectureBean.setLecture_idx(rs.getInt("lecture_idx"));
				lectureBean.setLecture_subject(rs.getString("lecture_subject"));
				lectureBean.setLecture_course(rs.getString("lecture_course"));
				lectureBean.setLecture_teacher(rs.getString("lecture_teacher"));
				lectureBean.setLecture_start_day(rs.getDate("lecture_start_day"));
				lectureBean.setLecture_end_day(rs.getDate("lecture_end_day"));
				lectureBean.setLecture_week_day(rs.getString("lecture_week_day"));
				lectureBean.setLecture_content(rs.getString("lecture_content"));
				lectureBean.setLecture_fee(rs.getInt("lecture_fee"));
				lectureBean.setLecture_time(rs.getString("lecture_time"));
				lectureBean.setLecture_room(rs.getString("lecture_room"));
				list.add(lectureBean);
			}
		} catch (SQLException e) {
			System.out.println("lectureInsertList() 에러 " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}
	// 수업정보등록 표위치
	public int[] lectureCount(String lecture_room, Date lecture_start_day) {
		int[] lecture_counts = new int[6];
		String sql = "SELECT * FROM lecture where lecture_room=? and lecture_start_day=? order by lecture_count";
		int c = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, lecture_room);
			String lecture_start_day2 = String.valueOf(lecture_start_day);
			pstmt.setString(2, lecture_start_day2);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				lecture_counts[c] = rs.getInt("lecture_count");
				c++;
			}
		} catch (SQLException e) {
			System.out.println("lectureCount() 에러 " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return lecture_counts;
	}
	public ArrayList<MemberBean> selectTeatureCode() {

		ArrayList<MemberBean> tc = new ArrayList<>();
		String sql = "select member_teacher_code, member_name from member where member_isMember=1 ";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberBean mb = new MemberBean();
				mb.setMember_name(rs.getNString("member_name"));
				mb.setMember_teacher_code(rs.getString("member_teacher_code"));
				tc.add(mb);
			}
			
		} catch (SQLException e) {
			System.out.println("selectTeatureCode() 에러 " + e.getMessage());
			e.printStackTrace();
		}
		return tc;
	}
	
	public List<LectureBean> getLectureList(String course,String day,String time){
		List<LectureBean> lectureList = new ArrayList<LectureBean>();
		
	
		System.out.println("여기");
		String courseSql = " lecture_course = ? " ;
		if(course.equals("전체")) {
			courseSql = " lecture_course is not ?";
			course=null;
		}
		String daySql = " lecture_week_day = ? " ;
		if(day.equals("3")) {
			daySql = " lecture_week_day is not ? ";
			day = null;
		}
		String timeSql = " lecture_time = ? ";
		if(time.equals("전체")) {
			timeSql = " lecture_time is not ? ";
			time = null;
		}
		

		String sql = ""; 
		
		System.out.println(courseSql);
		System.out.println(daySql);
		System.out.println(timeSql);
		
		System.out.println("데이"+day);
		System.out.println("타임"+time);
		System.out.println("코스"+course);
		sql = "select * "
		+ "from lecture where " + courseSql
		+ " AND " + daySql 
		+ " AND " + timeSql
		+ " AND lecture_start_day >now() "
		+ " ORDER BY lecture_idx DESC";

		System.out.println(sql);
		try {
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1,course);
			pstmt.setString(2,day);
			pstmt.setString(3,time);
			System.out.println(sql);
			rs =pstmt.executeQuery();
			
			
			while(rs.next()) {
				LectureBean lb = new LectureBean();
				lb.setLecture_idx(rs.getInt("lecture_idx"));
				lb.setLecture_subject(rs.getString("lecture_subject"));
				lb.setLecture_course(rs.getString("lecture_course"));
				lb.setLecture_week_day(rs.getString("lecture_week_day"));
				lb.setLecture_time(rs.getString("lecture_time"));
				lb.setLecture_fee(rs.getInt("lecture_fee"));
				lb.setLecture_teacher(rs.getString("lecture_teacher"));
				lb.setLecture_start_day(rs.getDate("lecture_start_day"));
				lb.setLecture_end_day(rs.getDate("lecture_end_day"));
				
				lectureList.add(lb);
			}
			
		} catch (SQLException e) {
			System.out.println("selectgetLectureList() 에러" + e.getMessage());
		}
		finally {
			close(rs);
			close(pstmt);
		}
				
		return lectureList;
	}
	
	public List<LectureBean> getBasketList(String sId){
		List<LectureBean> lectureList = new ArrayList<LectureBean>();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		System.out.println("겟바스켓리스트"+sId);

		String sql = ""; 
		
		sql = "select basket_lecture_idx from basket where basket_member_id = ?";
		try {
		pstmt =con.prepareStatement(sql);
		pstmt.setString(1,sId);
		rs =pstmt.executeQuery();
		while(rs.next()) {
			sql = "select * "
					+ "from lecture where lecture_idx=?"
					+ " AND lecture_start_day >now() "
					+ " ORDER BY lecture_idx DESC";
			pstmt2 =con.prepareStatement(sql);
			pstmt2.setInt(1,rs.getInt("basket_lecture_idx"));
			rs2 =pstmt2.executeQuery();
			while(rs2.next()) {
				LectureBean lb = new LectureBean();
				lb.setLecture_idx(rs2.getInt("lecture_idx"));
				lb.setLecture_subject(rs2.getString("lecture_subject"));
				lb.setLecture_course(rs2.getString("lecture_course"));
				lb.setLecture_week_day(rs2.getString("lecture_week_day"));
				lb.setLecture_time(rs2.getString("lecture_time"));
				lb.setLecture_fee(rs2.getInt("lecture_fee"));
				lb.setLecture_teacher(rs2.getString("lecture_teacher"));
				lb.setLecture_start_day(rs2.getDate("lecture_start_day"));
				lb.setLecture_end_day(rs2.getDate("lecture_end_day"));
				
				lectureList.add(lb);
				
			}
		}
		}catch (SQLException e) {
			System.out.println("selectgetLectureList() 에러" + e.getMessage());
		}
		finally {
			close(rs);
			close(pstmt);
		}
				
		return lectureList;
			
			
		}
	
		
	
	
	
}
