package action.lecture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.lecture.LectureDetailService;
import vo.ActionForward;
import vo.LectureBean;

public class LectureDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureDetailAction");
		System.out.println(request.getParameter("lecture_idx"));
		System.out.println(request.getParameter("Page"));
		int lecture_idx = Integer.parseInt(request.getParameter("lecture_idx"));
		String Page =request.getParameter("Page");
		LectureDetailService lectureDetailService = new LectureDetailService();
		LectureBean article = lectureDetailService.getArticle(lecture_idx);
		
		request.setAttribute("nowPage", Page);
		request.setAttribute("article", article);
		
		ActionForward forward = new ActionForward();
		forward.setPath("/admin/lecture/lecturecontent.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
