package action.apply;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.apply.ApplyListTeacherService;
import svc.apply.ApplyMemberListService;
import vo.ActionForward;
import vo.ApplyBean;
import vo.LectureBean;
import vo.LecturePageInfo;

public class ListTeacherAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ListTeacherAction");	
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String sId = (String)session.getAttribute("sId");
		ArrayList<LectureBean> applyList = new ArrayList<LectureBean>();

		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null) {
			page =Integer.parseInt(request.getParameter("page"));
		}
		String listType="end";
		if(request.getParameter("listType") != null) {
			listType = request.getParameter("listType");
		}
		ApplyListTeacherService infoTeacherService = new ApplyListTeacherService();
		
		int listCount = infoTeacherService.getListCountTeacher(sId, listType);
		
		applyList = infoTeacherService.getListTeacher(page, limit, sId, listType);
		
		int maxPage = (int)((double)listCount / limit + 0.95);
		int startPage = (((int)((double)page / 10 + 0.9)) -1) *10 +1;
		int endPage = startPage +10 -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		if(applyList != null) {
			forward = new ActionForward();
			System.out.println("수업리스트 조회 성공");
			LecturePageInfo applyPageInfo = new LecturePageInfo(page, maxPage, startPage, endPage, listCount);
			request.setAttribute("applyPageInfo", applyPageInfo);
			request.setAttribute("applyList", applyList);
			request.setAttribute("listType", listType);
			forward.setPath("apply/ListTeacher.jsp");
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
