package action.apply;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.apply.ApplyReviewInsertService;
import vo.ActionForward;
import vo.ApplyBean;

public class ApplyReviewInsertAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ApplyReviewInsertAction");	
		ActionForward forward = null;
		
		ApplyBean ab = new ApplyBean();
		ab.setApply_lecture_idx(Integer.parseInt(request.getParameter("lecture_idx")));
		ab.setApply_review(request.getParameter("apply_review"));
		ApplyReviewInsertService applyReviewInsertService = new ApplyReviewInsertService();
		Boolean isInsertSuccess = applyReviewInsertService.reviewInsert(ab);
		
		if(isInsertSuccess) {
			forward = new ActionForward();
			System.out.println("후기등록 성공");
			forward.setPath("/apply/applyReview.jsp");
			forward.setRedirect(false);
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
            out.println("alert('수업리스트 조회 실패!')");
            out.println("history.back()");
            out.println("</script>");
		}
		
		
		return forward;
	}
}
