package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

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
				String sql = "insert into member values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mb.getMember_name());
				pstmt.setString(2, mb.getMember_id());
				pstmt.setString(3, mb.getMember_pass());
				pstmt.setString(4, "0");
				pstmt.setString(5, mb.getMember_email());
				pstmt.setString(6, mb.getMember_postcode());
				pstmt.setString(7, mb.getMember_add1());
				pstmt.setString(8, mb.getMember_add2());
				pstmt.setString(9, mb.getMember_phone());
				pstmt.setString(10, "0");
				pstmt.setString(11, "0");
				pstmt.setString(12, "0");
				pstmt.setString(13, "0");
				pstmt.setString(14, "0");
			} else if(member_isMember.equals("1")){
				String sql = "insert into member values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mb.getMember_name());
				pstmt.setString(2, mb.getMember_id());
				pstmt.setString(3, mb.getMember_pass());
				pstmt.setString(4, mb.getMember_jumin());
				pstmt.setString(5, mb.getMember_email());
				pstmt.setString(6, mb.getMember_postcode());
				pstmt.setString(7, mb.getMember_add1());
				pstmt.setString(8, mb.getMember_add2());
				pstmt.setString(9, mb.getMember_phone());
				pstmt.setString(10, mb.getMember_bank());
				pstmt.setString(11, mb.getMember_accno());
				pstmt.setString(12, mb.getMember_picture());
				pstmt.setString(13, mb.getMember_isMember());
				pstmt.setString(14, mb.getMember_teacher_code());
				
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
	
	public boolean selectLogin(String id, String password, String isMember) {
	      boolean isLoginMember = false;
	      String sql = "SELECT * FROM member WHERE member_id=? AND member_pass=? AND member_isMember=?";
	     
	      try {
	         pstmt= con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         pstmt.setString(2, password);
	         pstmt.setString(3, isMember);
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
	            memberBean.setMember_idx(rs.getInt("member_idx"));
	            memberBean.setMember_name(rs.getString("member_name"));
	            memberBean.setMember_id(rs.getString("member_id"));
	            memberBean.setMember_pass(rs.getString("member_pass"));
	            memberBean.setMember_email(rs.getString("member_email"));
	            memberBean.setMember_postcode(rs.getString("member_postcode"));
	            memberBean.setMember_add1(rs.getString("member_add1"));
	            memberBean.setMember_add2(rs.getString("member_add2"));
	            memberBean.setMember_phone(rs.getString("member_phone"));
	            memberBean.setMember_isMember(rs.getString("member_isMember"));
	            
	            
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
	      System.out.println("isUpdateMember");
	      String sql ="";
			String member_isMember =mb.getMember_isMember();
			System.out.println(member_isMember);
	      try {
	    	  if(member_isMember.equals("1")){//관리자가 교직원 계정 수정
	 				sql = "UPDATE member SET member_name=? , member_pass=?, member_email=?, member_postcode=?,member_add1=?,member_add2=?,member_phone=?, member_bank=?, member_accno=?, member_picture=? WHERE member_id=?";
	 				pstmt = con.prepareStatement(sql);
	 		         pstmt.setString(1, mb.getMember_name());
		 			pstmt.setString(2, mb.getMember_pass());
	 		         pstmt.setString(3, mb.getMember_email());
	 		         pstmt.setString(4, mb.getMember_postcode());
	 		         pstmt.setString(5, mb.getMember_add1());
	 		         pstmt.setString(6, mb.getMember_add2());
	 		         pstmt.setString(7, mb.getMember_phone());
	 				pstmt.setString(8, mb.getMember_bank());
	 				pstmt.setString(9, mb.getMember_accno());
	 				pstmt.setString(10, mb.getMember_picture());
	 		         pstmt.setString(11, mb.getMember_id());
	 				
	 			}else{ // 일반 계정 수정
	 				System.out.println("ㅎㅎDAO");
	 				sql = "UPDATE member SET member_name=?, member_email=?, member_postcode=?,member_add1=?,member_add2=?,member_phone=? WHERE member_id=?";
	 				pstmt = con.prepareStatement(sql);
	 		         pstmt.setString(1, mb.getMember_name());
	 		         pstmt.setString(2, mb.getMember_email());
	 		         pstmt.setString(3, mb.getMember_postcode());
	 		         pstmt.setString(4, mb.getMember_add1());
	 		         pstmt.setString(5, mb.getMember_add2());
	 		         pstmt.setString(6, mb.getMember_phone());
	 		         pstmt.setString(7, mb.getMember_id());

	 			}
	                  
		         updateCount = pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
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
	   
	   public String findId(String name, String email){
		   System.out.println("FIND ID DAO");
		   String id = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   
		   String sql = "SELECT member_id FROM member WHERE member_name=? AND member_email=?";
		   
		   try {
			pstmt = con.prepareStatement(sql);
			   pstmt.setString(1, name);
			   pstmt.setString(2, email);
			   rs = pstmt.executeQuery();
			   if(rs.next()) {
				   id = rs.getString("member_id");
			   }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}		   
		   return id;
	   }
	   
	   public String findPass(String id, String email){
		   System.out.println("FIND Pass DAO");
		   String pass = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   
		   String sql = "SELECT member_pass FROM member WHERE member_id=? AND member_email=?";
		   
		   try {
			pstmt = con.prepareStatement(sql);
			   pstmt.setString(1, id);
			   pstmt.setString(2, email);
			   rs = pstmt.executeQuery();
			   if(rs.next()) {
				   pass = rs.getString("member_pass");
			   }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}		   
		   return pass;
	   }
	   
	   
	   public boolean isMember(int member_idx, String member_id) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			boolean isMember = false;
			
			try {//board_num에 해당하는 게시물의 패스워드를 비교
				String sql = "select * from member where member_idx=? AND member_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, member_idx);
				pstmt.setString(2, member_id);
				rs = pstmt.executeQuery();
				if(rs.next()) {//게시물 번호에 해당하는 패스워드가 일치하여 레코드가 검색될 경우
					isMember=true;
				}
			} catch (SQLException e) {
				System.out.println("isArticleWriter 에러 : " + e.getMessage());
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			return isMember;
		}//
	   
		public int deleteMember(String member_id, String member_pass) {
			PreparedStatement pstmt = null;
			int deleteCount = 0;
			try {
				String sql="DELETE FROM member WHERE member_id=? AND member_pass=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_id);
				pstmt.setString(2, member_pass);
				deleteCount = pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("deleteTeacher 에러 : " + e.getMessage());
			}finally {
				close(pstmt);
			}
			return deleteCount;
		} //deleteArticle()
	   
//------------------------------------------------- Teacher ------------------------------------------------------------	   
	   
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
				String sql = "SELECT * FROM member WHERE member_isMember=? ORDER BY member_idx, member_teacher_code";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_isMember);
				rs = pstmt.executeQuery();

				// ResultSet 객체 내의 모든 레코드를 각각 레코드별로 BoardBean 에 담아서 ArrayList 객체에 저장
				// => 패스워드 제외
				while (rs.next()) {
					MemberBean memberBean = new MemberBean();
					memberBean.setMember_idx(rs.getInt("member_idx"));
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
	   
	   public MemberBean selectTeacher(int member_idx) { // 글 번호를 전달받아 조회 후, 결과를 BoardBean 으로 리턴
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			MemberBean memberBean = null;

			try {
				// board_num 에 해당하는 게시물 조회 후, 결과값을 BoardBean 에 저장하여 리턴
				String sql = "SELECT * FROM member WHERE member_idx=?";
				pstmt = con.prepareStatement(sql);
				//pstmt.setString(1, member_teacher_code);
				pstmt.setInt(1, member_idx);
				rs = pstmt.executeQuery();

				if (rs.next()) { // 조회된 게시물이 있을 경우
					memberBean = new MemberBean();
					memberBean.setMember_idx(rs.getInt("member_idx"));
					memberBean.setMember_name(rs.getString("member_name"));
					memberBean.setMember_id(rs.getString("member_id"));
					memberBean.setMember_jumin(rs.getString("member_jumin"));
					memberBean.setMember_email(rs.getString("member_email"));
					memberBean.setMember_pass(rs.getString("member_pass"));
					memberBean.setMember_postcode(rs.getString("member_postcode"));
					memberBean.setMember_add1(rs.getString("member_add1"));
					memberBean.setMember_add2(rs.getString("member_add2"));
					memberBean.setMember_phone(rs.getString("member_phone"));
					memberBean.setMember_bank(rs.getString("member_bank"));
					memberBean.setMember_accno(rs.getString("member_accno"));
					memberBean.setMember_picture(rs.getString("member_picture"));
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
	
	   
	   public boolean isTeacher(int member_idx, String member_id) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			boolean isTeacher = false;
			
			try {//board_num에 해당하는 게시물의 패스워드를 비교
				String sql = "select * from member where member_idx=? AND member_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, member_idx);
				pstmt.setString(2, member_id);
				rs = pstmt.executeQuery();
				if(rs.next()) {//게시물 번호에 해당하는 패스워드가 일치하여 레코드가 검색될 경우
					isTeacher=true;
				}
			} catch (SQLException e) {
				System.out.println("isArticleWriter 에러 : " + e.getMessage());
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			return isTeacher;
		}//
	   
		public int deleteTeacher(int member_idx) {
			PreparedStatement pstmt = null;
			int deleteCount = 0;
			try {
				String sql="DELETE FROM member WHERE member_idx=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, member_idx);
				deleteCount = pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("deleteTeacher 에러 : " + e.getMessage());
			}finally {
				close(pstmt);
			}
			return deleteCount;
		} //deleteArticle()
	   
		
		
		// 회원 목록 출력
		public ArrayList<MemberBean> selectMemberList(int page, int limit){
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
			String sql="";
			
			try {
				int startRow = (page -1) * 10; // 읽어올 목록의 첫 레코드 번호 
				sql = "SELECT * FROM MEMBER ORDER BY member_idx DESC LIMIT ?,?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, limit);
				
				rs = pstmt.executeQuery();
				
				// ResultSet 객체 내의 모든 레코드를 각각 레코드별로 MemberBean 에 담아서 ArrayList 객체에 저장
				while(rs.next()) {
					MemberBean memberBean = new MemberBean();
					
					memberBean.setMember_idx(rs.getInt("member_idx"));
					memberBean.setMember_name(rs.getString("member_name"));
					memberBean.setMember_id(rs.getString("member_id"));
					memberBean.setMember_phone(rs.getString("member_phone"));
					memberBean.setMember_email(rs.getString("member_email"));
					
				}
			} catch (Exception e) {
				System.out.println("selectMemberList() 에러"+e.getMessage());
			}finally {
				close(rs);
				close(pstmt);
			}
			return memberList;
		}
	
		
		
		
		//전체 회원 수를 조회하여 리턴 
		public int selectMembertListCount() {
			int listCount = 0; // 회원 수를 저장하는 변수 
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql="";
			
			try {
				sql = "SELECT COUNT(*) FROM member";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					listCount =  rs.getInt(1);
				}
			} catch (Exception e) {
				System.out.println("selectMemberListCount() 에러"+e.getMessage());
			}finally {
				close(rs);
				close(pstmt);
			}
			return listCount;
		}
		
		
}
