package action.lecture;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.lecture.LectureListService;
import vo.ActionForward;
import vo.LectureBean;
import vo.LecturePageInfo;

public class LectureListeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureListeAction");
		
		ArrayList<LectureBean> lectureList = new ArrayList<LectureBean>();
	
		
		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		LectureListService lectureListService = new LectureListService();
		
		int listCount = lectureListService.getLectureListCount();
		
		lectureList = lectureListService.getLectureList(page, limit);
		
		int maxPage = (int)((double)listCount / limit + 0.95);
		int startPage = (((int)((double)page / 10 + 0.9)) -1) *10 +1;
		int endPage = startPage +10 -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		ActionForward forward = new ActionForward();
		
		LecturePageInfo lecturePageInfo = new LecturePageInfo(page, maxPage, startPage, endPage, listCount);
		request.setAttribute("lecturePageInfo", lecturePageInfo);
		request.setAttribute("lectureList", lectureList);
		
		if(lectureList == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
            out.println("alert('수업리스트 조회 실패!')");
            out.println("history.back()");
            out.println("</script>");
		}else {
			System.out.println("수업리스트 조회 성공");
			forward.setPath("admin/lecture/lectureList.jsp");
			forward.setRedirect(false);
		}
 		
		return forward;
	}

}
