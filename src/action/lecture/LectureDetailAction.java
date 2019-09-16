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
		System.out.println(request.getParameter("page"));
		int lecture_idx = Integer.parseInt(request.getParameter("lecture_idx"));
		String nowPage =request.getParameter("page");
		LectureDetailService lectureDetailService = new LectureDetailService();
		LectureBean article = lectureDetailService.getArticle(lecture_idx);
		

		request.setAttribute("article", article);
		request.setAttribute("page", nowPage);
		
		ActionForward forward = new ActionForward();
//		forward.setPath("/admin/lecture/lecturecontent.jsp?page="+page+"&lecture_idx="+lecture_idx);
		forward.setPath("/admin/lecture/lecturecontent.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
