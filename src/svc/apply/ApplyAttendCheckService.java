package svc.apply;
import static db.JdbcUtil.*;

import java.sql.Connection;

import javax.swing.MenuElement;

import dao.ApplyDAO;
import dao.AttendDAO;
import dao.MemberDAO;
import vo.MemberBean;

public class ApplyAttendCheckService {
   

   public boolean UpdateAttendCheck (String[] attendMemberArr,String[] attendCheckArr, int lecture_idx , int attendDay) {
	  System.out.println("ApplyAttendCheckService");
      Connection con = getConnection();
      AttendDAO attendDAO = AttendDAO.getInstance();
      attendDAO.setConnection(con);

      
      boolean isUpdateSuccess = false;
      int updateCount = attendDAO.isUpdateAttendCheck(attendMemberArr, attendCheckArr, lecture_idx, attendDay);
      System.out.println(updateCount);
      if(updateCount > 0) {
    	 
         commit(con);
         isUpdateSuccess = true;
      }else {
         rollback(con);
      }
      close(con);
      return isUpdateSuccess;
   }
}

