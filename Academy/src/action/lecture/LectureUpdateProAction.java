package action.lecture;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.lecture.LectureUpdateService;
import vo.ActionForward;
import vo.LectureBean;

public class LectureUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureUpdatProAction");
		System.out.println(request.getParameter("lecture_idx"));
		System.out.println(request.getParameter("page"));
		int lecture_idx =Integer.parseInt(request.getParameter("lecture_idx"));
		String page = request.getParameter("page");
		
		LectureUpdateService lectureUpdateSevice = new LectureUpdateService();
		ActionForward	forward = null;
		
		LectureBean article = new LectureBean();
		article.setLecture_idx(lecture_idx);
		article.setLecture_subject(request.getParameter("lecture_subject"));
		article.setLecture_course(request.getParameter("lecture_course"));
		article.setLecture_teacher(request.getParameter("lecture_teacher"));
		Date lecture_start_day = Date.valueOf(request.getParameter("lecture_start_day"));
		article.setLecture_start_day(lecture_start_day);
		Date lecture_end_day = Date.valueOf(request.getParameter("lecture_end_day"));
		article.setLecture_end_day(lecture_end_day);
		article.setLecture_week_day(request.getParameter("lecture_week_day"));
		article.setLecture_content(request.getParameter("lecture_content"));
		article.setLecture_fee(Integer.parseInt(request.getParameter("lecture_fee")));
		
		boolean isUpdateSuccess = lectureUpdateSevice.updateArticle(article);
		
		
		if(!isUpdateSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");	
			
		}else {
			


		forward = new ActionForward();
        request.setAttribute("article", article);
        request.setAttribute("nowPage", page);
		forward.setPath("lectureDetail.le");
		forward.setRedirect(false);
		
	}
	
	
	return forward;
	}

}
