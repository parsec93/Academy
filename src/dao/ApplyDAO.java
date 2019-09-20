package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ApplyBean;

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
	
	public ArrayList<ApplyBean> selectApplyList(int page, int limit){
		ArrayList<ApplyBean> applyList = new ArrayList<ApplyBean>();
		int startRow = (page-1)*10;
		
		String sql = "SELECT apply_lecture_idx FROM apply WHERE apply_member_id =? ";
		rs.
				sql ="	SELECT * from lecture where lecture_idx=? ";
		pstmt.set		
		
		
		
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
