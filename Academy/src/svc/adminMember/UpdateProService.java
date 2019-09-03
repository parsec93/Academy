package svc.adminMember;
import static db.JdbcUtil.*;

import java.sql.Connection;

import javax.swing.MenuElement;

import dao.MemberDAO;
import vo.MemberBean;

public class UpdateProService {
   
   public boolean isPassword(String id, String password) {
      Connection con = getConnection();
      MemberDAO memberDAO = MemberDAO.getInstance();
      memberDAO.setConnection(con);
      
      boolean isPassword = memberDAO.isPassword(id, password);
      close(con);
      return isPassword;
   }
   public boolean updateMember (MemberBean mb) {
	  System.out.println("updateMember");
	  System.out.println(mb.getMember_email());
      Connection con = getConnection();
      MemberDAO memberDAO =MemberDAO.getInstance();
      memberDAO.setConnection(con);
      
      boolean isUpdateSuccess = false;
      int updateCount = memberDAO.isUpdateMember(mb);
      System.out.println(updateCount);
      if(updateCount == 1) {
    	  
         commit(con);
         isUpdateSuccess = true;
      }else {
         rollback(con);
      }
      close(con);
      return isUpdateSuccess;
   }
   public boolean updatePassword (String id, String newPassword) {
	  Connection con =getConnection();
	  MemberDAO memberDAO = MemberDAO.getInstance();
	  memberDAO.setConnection(con);
	  
	  boolean isUpdatePasswordSuccess= false;
	  int updateCount = memberDAO.isUpdatepassword(id, newPassword);
	  if(updateCount ==1 ) {
	         commit(con);
	         isUpdatePasswordSuccess = true;
	      }else {
	         rollback(con);
	      }
	      close(con);
	      return isUpdatePasswordSuccess;
	  }
	  
   }
