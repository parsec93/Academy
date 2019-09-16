package svc.member;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;

import static db.JdbcUtil.*;

public class TeacherViewService {
    // 글 내용 보기 요청을 처리하는 비즈니스 로직 - getArticle() 메서드 정의
    public MemberBean getTeacher(int member_idx) throws Exception {
        // Connection 객체 가져오기 - getConnection()
        Connection con = getConnection();
        
        // BoardDAO 객체 가져오기 - getInstance()
        MemberDAO memberDAO = MemberDAO.getInstance();
        
        // Connection 객체 -> BoardDAO 에 전달 - setConnection()
        memberDAO.setConnection(con);
        
        // BoardDAO 객체의 selectArticle() 메서드를 호출하여 글 상세 내용(BoardBean 객체) 리턴받기
        //MemberBean teacher = memberDAO.selectTeacher(member_teacher_code, member_idx);
        MemberBean teacher = memberDAO.selectTeacher(member_idx);

        // Connection 객체 반환
        close(con);
        
        // BoardBean 객체 리턴
        return teacher;
    }
    
}
















