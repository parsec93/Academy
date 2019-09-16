package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.member.TeacherViewService;
import vo.ActionForward;
import vo.MemberBean;

public class TeacherViewAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("TeacherViewAction");
        
    
       // String member_teacher_code = request.getParameter("member_teacher_code");
        int member_idx = Integer.parseInt(request.getParameter("member_idx"));
     
        TeacherViewService teacherViewService = new TeacherViewService();
        
        // BoardDetailService 객체의 getArticle() 메서드를 호출하여 글 상세 내용 BoardBean 타입으로 리턴받음
        //MemberBean teacher = teacherViewService.getTeacher(member_teacher_code,member_idx);
        MemberBean teacher = teacherViewService.getTeacher(member_idx);
        // page 값 request 객체에 저장
        // 글 상세 내용 BoardBean 객체 request 객체에 저장
        request.setAttribute("teacher", teacher);
        
        // /board/qna_board_view.jsp 페이지로 포워딩(Dispatcher 방식)
        ActionForward forward = new ActionForward();
        forward.setPath("admin/teacherview.jsp?member_idx=" + member_idx); // 포워딩 주소 지정
        forward.setRedirect(false); // 포워딩 방식 지정 => Dispatcher 방식은 false 전달(생략 가능)
        
        return forward; // ActionForward 객체 리턴
        
    }

}













