package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import vo.ApplyBean;
import vo.AttendBean;
import vo.LectureBean;
import vo.MemberBean;

public class AttendDAO {
	private static AttendDAO instance = null;
	private AttendDAO() {}
	public static AttendDAO getInstance() {
		if(instance == null) {
			instance = new AttendDAO();
		}
		return instance;
	}
	
	Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int isUpdateAttendCheck(String[] attendMemberArr, String[] attendCheckArr, int lecture_idx , int attendDay) {
		
		int updateCount =0;
		String[] sumAttend = new String[attendMemberArr.length];
		int todaydb = 0;
		String sql = "";
		String sql2 = "";
		String sql3 = "";
		String sql4 = "";

		try {
			sql = "select attend_check, attend_today from attend where attend_member_id= ?"; 
			pstmt = con.prepareStatement(sql);
			for(int i = 0; attendMemberArr.length >i; i++ ) {
				// i번 학생의 아이디를 넣어서
				pstmt.setString(1, attendMemberArr[i]);
				// 출석률을 가져온다
				rs = pstmt.executeQuery();
				// 출석률을 i번째 배열에 저장한다.
				if(rs.next()) {
					sumAttend[i] = rs.getString("attend_check");	
					todaydb = rs.getInt("attend_today");
				}
			}
			if(todaydb!=attendDay) {
			
				for(int i = 0; attendMemberArr.length >i; i++ ) {
					sql2 += "when attend_member_id=? then ? ";
					sql3 += "when attend_member_id=? then "+attendDay+" ";
					if(i==attendMemberArr.length-1) {
						sql4 += lecture_idx;
						break;
					}
					sql4 += lecture_idx + ",";
				}
				System.out.println(sql2+" , "+sql4);
				sql ="update attend set attend_check=CASE " 
						+sql2
						+"end, "
						
				+ "attend_today=CASE "
				+sql3
				+"end "
				
				+"where attend_lecture_idx in("
				+sql4
				+")";
				pstmt = con.prepareStatement(sql);
				for(int i = 0; attendMemberArr.length >i; i++ ) {
					pstmt.setString((i+1)*2-1, attendMemberArr[i]);
					pstmt.setString((i+1)*2, sumAttend[i]+ "/" + attendCheckArr[i]);
					pstmt.setString(attendMemberArr.length*2+i+1, attendMemberArr[i]);
				}
			}else {
				
				for(int i = 0; attendMemberArr.length >i; i++ ) {
					sql2 += "when attend_member_id=? then ? ";
					if(i==attendMemberArr.length-1) {
						sql4 += lecture_idx;
						break;
					}
					sql4 += lecture_idx + ",";
				}
				System.out.println(sql2+" , "+sql4);
				sql ="update attend set attend_check=CASE " 
						+sql2
						+"end "
				
				+"where attend_lecture_idx in("
				+sql4
				+")";
				pstmt = con.prepareStatement(sql);
				for(int i = 0; attendMemberArr.length >i; i++ ) {
					String[] lateAttend = sumAttend[i].split("/");
					String[] lateAttend2 = Arrays.copyOf(lateAttend, lateAttend.length-1);
					String attendString = "";
					for(int j =0;j<lateAttend.length-1;j++) {
						attendString += lateAttend2[j] + "/";
					}
					if(lateAttend[lateAttend.length-1].equals("0") && !attendCheckArr[i].equals("0")) {
						pstmt.setString((i+1)*2-1, attendMemberArr[i]);
						pstmt.setString((i+1)*2,  attendString +
						"la"+ attendCheckArr[i]);
					}else {
						pstmt.setString((i+1)*2-1, attendMemberArr[i]);
						pstmt.setString((i+1)*2, sumAttend[i]);
					}
					
				}
				
			}
			
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
            close(pstmt);
        }        
        return updateCount;
    }
	public ArrayList<AttendBean> todayCheckList(String lecture_idx) {
		
		ArrayList<AttendBean> todayCheck = new ArrayList<>();
		
		String sql = "select * from attend where attend_lecture_idx= ? ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, lecture_idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AttendBean attendBean = new AttendBean();
				attendBean.setAttend_member_id(rs.getString("attend_member_id"));
				attendBean.setAttend_check(rs.getString("attend_check"));
				todayCheck.add(attendBean);
			}
			
		} catch (SQLException e) {
			System.out.println("todayCheckList() 에러" + e.getMessage());		

			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return todayCheck;
	}
	
	

}
