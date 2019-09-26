package action.apply;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.apply.ApplyMemberListService;
import svc.lecture.LectureListService;
import vo.ActionForward;
import vo.LectureBean;
import vo.LecturePageInfo;
import vo.MemberBean;

public class ApplyMemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ApplyMemberListAction");
		
		String lecture_idx = request.getParameter("lecture_idx");
		
		ArrayList<MemberBean> applyMemberList = new ArrayList<MemberBean>();
			

		ApplyMemberListService applyMemberListService = new ApplyMemberListService();
		

		applyMemberList = applyMemberListService.getApplyMemberList(lecture_idx);
		
		ActionForward forward = new ActionForward();
		
	
		request.setAttribute("applyMemberList", applyMemberList);

		if(applyMemberList == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
            out.println("alert('수강학생 조회 실패!')");
            out.println("history.back()");
            out.println("</script>");
		}else {
			System.out.println("수강학생 조회 성공");
			forward.setPath("/apply/applyMemberListForm.jsp");
			forward.setRedirect(false);
		}
 		
		return forward;
	}

}
