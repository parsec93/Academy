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
		System.out.println(request.getParameter("listType"));
		
		ArrayList<LectureBean> lectureList = new ArrayList<LectureBean>();
		
		//목록 종류(진행중인 수업 or 종료된 수업) 파라미터(listType)값 가져오기
		String listType="";
		if(request.getParameter("listType") != null) {
			listType = request.getParameter("listType");
		}
		
		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		LectureListService lectureListService = new LectureListService();
		
		int listCount = lectureListService.getLectureListCount();
		
		//영화목록조회 값 전달 
		lectureList = lectureListService.getLectureList(page, limit , listType);
		
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
