package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static db.JdbcUtil.*;

import vo.MemberBean;

public class MemberDAO {
	
	private static MemberDAO instance = null;
	private MemberDAO() {}
	public static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}
	
	Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int insertMember(MemberBean mb) {
		
		int isInsertCount = 0;
		
		try {
			String sql = "insert into member values(null,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getMember_name());
			pstmt.setString(2, mb.getMember_id());
			pstmt.setString(3, mb.getMember_pass());
			pstmt.setString(4, mb.getMember_email());
			pstmt.setString(5, mb.getMember_postcode());
			pstmt.setString(6, mb.getMember_add1());
			pstmt.setString(7, mb.getMember_add2());
			pstmt.setString(8, mb.getMember_phone());
			
			isInsertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertMember 실패 - " + e.getMessage());
		}finally {
			close(pstmt);
		}
		
		
		return isInsertCount;
	}
	public int idCheck(String id) {
		
		int Check = 1;
		try {
			con = getConnection();
			
			String sql = "select member_id from member where member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				Check = 1; //중복이면
			}else {
				Check = 0;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("idCheck 실패 - " + e.getMessage());
		}finally {
			if(rs!=null) try { rs.close();} catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}
		return Check;
	}
	
	public boolean selectLogin(String id, String password) {
	      boolean isLoginMember = false;
	      String sql = "SELECT * FROM member WHERE member_id=? AND member_pass=?";
	      
	      try {
	         pstmt= con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         pstmt.setString(2, password);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	            isLoginMember = true;
	         }
	      } catch (SQLException e) {
	            System.out.println("selectLoginMember 실패! - " + e.getMessage());
	        } finally {
	           close(rs);
	           close(pstmt);
	      }
	      return isLoginMember;
	   }
	   public MemberBean selectInfo(String member_id) {
	      System.out.println("selectInfo");
	      MemberBean memberBean = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = "SELECT * FROM member WHERE member_id=?";
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, member_id);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            memberBean = new MemberBean();
	            memberBean.setMember_name(rs.getString("member_name"));
	            memberBean.setMember_id(rs.getString("member_id"));
	            memberBean.setMember_email(rs.getString("member_email"));
	            memberBean.setMember_postcode(rs.getString("member_postcode"));
	            memberBean.setMember_add1(rs.getString("member_add1"));
	            memberBean.setMember_add2(rs.getString("member_add2"));
	            memberBean.setMember_phone(rs.getString("member_phone"));
	            
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	         close(rs);
	      }
	      return memberBean;

	      
	   }
	   public boolean isPassword(String id,String password) {
	      
	      boolean isPassword = false;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = "SELECT * FROM member WHERE member_id = ? AND member_pass=?";
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         pstmt.setString(2, password);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            isPassword = true;
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	            close(rs);
	            close(pstmt);
	        }
	        
	        
	        return isPassword;
	      
	   }
	   
	   public int isUpdateMember(MemberBean mb) {
	      int updateCount =0;
	      PreparedStatement pstmt = null;
	      
	      String sql = "UPDATE member SET member_name=?, member_email=?, member_postcode=?,member_add1=?,member_add2=?,member_phone=? WHERE member_id=?";
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, mb.getMember_name());
	         pstmt.setString(2, mb.getMember_email());
	         pstmt.setString(3, mb.getMember_postcode());
	         pstmt.setString(4, mb.getMember_add1());
	         pstmt.setString(5, mb.getMember_add2());
	         pstmt.setString(6, mb.getMember_phone());
	         pstmt.setString(7, mb.getMember_id());
	         updateCount = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	            close(pstmt);
	        }
	        
	        return updateCount;
	    }
	   public int isUpdatepassword(String id, String newPassword) {
		   int updateCount = 0;
		   PreparedStatement pstmt =null;
		   
		   String sql = "UPDATE member SET member_pass=? WHERE member_id=?";
		   
		   try {
			   pstmt = con.prepareStatement(sql);
			   pstmt.setString(1, newPassword);
			   pstmt.setString(2, id);
			   updateCount =pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
	        close(pstmt);
	    }
	    
	    return updateCount;
	   }
	
	
}
