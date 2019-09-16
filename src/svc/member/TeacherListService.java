 package svc.member;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import vo.MemberBean;




public class TeacherListService {
	
//    public int getTeacherListCount(String member_isMember) throws Exception {
//        int listCount = 0; // 전체 게시물 수 저장하는 변수
//        
//        // Connection 객체 가져오기
//        // static import 를 사용하여 JdbcUtil 클래스를 지정했으므로
//        // JdbcUtil.getConnection(); 코드 대신 getConnection() 메서드 호출 코드만 작성하면 된다!
//        Connection con = getConnection();  
//        
//        // BoardDAO 객체 가져오기
//        MemberDAO memberDAO = MemberDAO.getInstance();
//        
//        // BoardDAO 객체에 Connection 객체 전달하기
//        memberDAO.setConnection(con);
//        
//        // selectListCount() 메서드 호출하여 전체 게시물 수 조회하여 listCount 변수에 저장
//        listCount = memberDAO.selectListCount(member_isMember);
////        System.out.println(listCount);
//        // Connection 객체 반환
//        close(con);
//        
//        return listCount;
//    }

    // 전체 게시물 목록을 조회하여 리턴
    public ArrayList<MemberBean> getTeacherList(String member_isMember) throws Exception {
        ArrayList<MemberBean> teacherList = null;
        
        Connection con = getConnection();  
        MemberDAO memberDAO = MemberDAO.getInstance();
        memberDAO.setConnection(con);
        
        teacherList = memberDAO.selectTeacherList(member_isMember);
        
//        System.out.println(articleList);
        
        close(con);
        
        return teacherList;
    }

}
