package action.lecture;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.lecture.LectureInsertFormService;
import vo.ActionForward;
import vo.MemberBean;

public class LectureInsertFormAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		
		ActionForward forward = null;
		
		LectureInsertFormService lectureInsertFormService = new LectureInsertFormService();
		ArrayList<MemberBean> tc = lectureInsertFormService.getTeatureCode();
		
		if(tc != null) {
			System.out.println("tc select 성공");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			request.setAttribute("tc", tc);
			forward = new ActionForward();
			forward.setPath("/admin/lecture/lectureInsertForm.jsp");
			forward.setRedirect(false);
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('teatureCode 조회실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		return forward;
	}
}
