package action.lecture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.lecture.LectureDetailService;
import vo.ActionForward;
import vo.LectureBean;

public class LectureUpdateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureUpdateFormAction");
		System.out.println(request.getParameter("lecture_idx"));
		int lecture_idx = Integer.parseInt(request.getParameter("lecture_idx"));
		String page = request.getParameter("page");
		
		LectureDetailService lectureDetailService = new LectureDetailService();
		LectureBean article = lectureDetailService.getArticle(lecture_idx);
		
		request.setAttribute("article", article);
		request.setAttribute("page", page);
		ActionForward forward = new ActionForward();
		forward.setPath("/admin/lecture/lectureUpdate.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
