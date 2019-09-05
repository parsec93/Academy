package action.member;

import java.io.PrintWriter;


import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.member.TeacherListService;
import vo.ActionForward;
import vo.MemberBean;

// 글 목록 보기 요청을 처리하는 BoardListAction
public class TeacherListAction implements Action {

	
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("TeacherListAction!");
        String member_isMember = (String) request.getAttribute("member_isMember");
        
        
        
        // 게시물 목록 정보를 받아와서 저장할 ArrayList 타입 변수 선언(제네릭 타입 BoardBean 타입으로 지정)
        ArrayList<MemberBean> teacherList = new ArrayList<MemberBean>();
        

        TeacherListService teacherListService = new TeacherListService();
        
        
        teacherList = teacherListService.getTeacherList(member_isMember); // 전체 게시물 목록 가져오기(10개 한정)
        

        ActionForward forward = new ActionForward();

        request.setAttribute("teacherList", teacherList);
        
 
			forward.setPath("admin/teacherList.jsp");
			forward.setRedirect(false);

		

        
        return forward;
    }

}


















