package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static db.JdbcUtil.*;

import vo.BoardBean;
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
			String member_isMember =mb.getMember_isMember();
			if(member_isMember.equals("0")){
				System.out.println("ㅎㅎDAO");
				String sql = "insert into member values(null,?,?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mb.getMember_name());
				pstmt.setString(2, mb.getMember_id());
				pstmt.setString(3, mb.getMember_pass());
				pstmt.setString(4, mb.getMember_email());
				pstmt.setString(5, mb.getMember_postcode());
				pstmt.setString(6, mb.getMember_add1());
				pstmt.setString(7, mb.getMember_add2());
				pstmt.setString(8, mb.getMember_phone());
				pstmt.setString(9, "0");
				pstmt.setString(10, "");
			} else if(member_isMember.equals("1")){
				String sql = "insert into member values(null,?,?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mb.getMember_name());
				pstmt.setString(2, mb.getMember_id());
				pstmt.setString(3, mb.getMember_pass());
				pstmt.setString(4, mb.getMember_email());
				pstmt.setString(5, mb.getMember_postcode());
				pstmt.setString(6, mb.getMember_add1());
				pstmt.setString(7, mb.getMember_add2());
				pstmt.setString(8, mb.getMember_phone());
				pstmt.setString(9, mb.getMember_isMember());
				pstmt.setString(10, "0");
				
			}
			
			
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
	            memberBean.setMember_pass(rs.getString("member_pass"));
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
	   
		public int selectListCount(String member_isMember) {
			int listCount = 0; // 선생님 인원수를 저장하는 변수

			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				System.out.println(member_isMember);
				String sql = "SELECT COUNT(*) FROM member WHERE member_isMember=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_isMember);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					listCount = rs.getInt(1);
				}

			} catch (SQLException e) {
				System.out.println("selectListCount() 에러 - " + e.getMessage());
			} finally {
				// static import 문을 사용하여 JdbcUtil 클래스명 지정 필요없음
				close(rs);
				close(pstmt);
			}

			return listCount;
		}
	   
	   public ArrayList<MemberBean> selectTeacherList(String member_isMember){
		   	PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			ArrayList<MemberBean> teacherList = new ArrayList<MemberBean>();
			
			try {
				// SELECT 구문 : board 테이블 데이터 전체 조회
				// => board_re_ref 기준 내림차순, board_re_seq 기준 오름차순
				// => 전체 갯수가 아닌 시작 레코드 번호 ~ limit 갯수 만큼 읽어오기
				String sql = "SELECT * FROM member WHERE member_isMember=? ORDER BY member_teacher_code";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_isMember);
				rs = pstmt.executeQuery();

				// ResultSet 객체 내의 모든 레코드를 각각 레코드별로 BoardBean 에 담아서 ArrayList 객체에 저장
				// => 패스워드 제외
				while (rs.next()) {
					MemberBean memberBean = new MemberBean();
					memberBean.setMember_teacher_code(rs.getString("member_teacher_code"));
					memberBean.setMember_name(rs.getString("member_name"));
					memberBean.setMember_id(rs.getString("member_id"));
					memberBean.setMember_email(rs.getString("member_email"));
					memberBean.setMember_postcode(rs.getString("member_postcode"));
					memberBean.setMember_add1(rs.getString("member_add1"));
					memberBean.setMember_add2(rs.getString("member_add2"));
					memberBean.setMember_phone(rs.getString("member_phone"));


					teacherList.add(memberBean);
				}

			} catch (SQLException e) {
				System.out.println("selectArticleList() 에러 - " + e.getMessage());
			} finally {
				close(rs);
				close(pstmt);
			}

			return teacherList;
			
			
	   }
	   
	   public MemberBean selectTeacher(String member_teacher_code) { // 글 번호를 전달받아 조회 후, 결과를 BoardBean 으로 리턴
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			MemberBean memberBean = null;

			try {
				// board_num 에 해당하는 게시물 조회 후, 결과값을 BoardBean 에 저장하여 리턴
				String sql = "SELECT * FROM member WHERE member_teacher_code=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_teacher_code);
				rs = pstmt.executeQuery();

				if (rs.next()) { // 조회된 게시물이 있을 경우
					memberBean = new MemberBean();
					memberBean.setMember_name(rs.getString("member_name"));
					memberBean.setMember_id(rs.getString("member_id"));
					memberBean.setMember_email(rs.getString("member_email"));
					memberBean.setMember_pass(rs.getString("member_pass"));
					memberBean.setMember_postcode(rs.getString("member_postcode"));
					memberBean.setMember_add1(rs.getString("member_add1"));
					memberBean.setMember_add2(rs.getString("member_add2"));
					memberBean.setMember_phone(rs.getString("member_phone"));
					memberBean.setMember_teacher_code(rs.getString("member_teacher_code"));
//					memberBean.setMember_date(rs.getDate("member_date"));
				}
			} catch (SQLException e) {
				System.out.println("selectArticle() 에러 - " + e.getMessage());
			} finally {
				close(rs);
				close(pstmt);
			}

			return memberBean;

		}
	
	
}
