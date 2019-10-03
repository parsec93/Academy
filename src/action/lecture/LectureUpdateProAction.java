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
		String listType = request.getParameter("listType");
		
		LectureUpdateService lectureUpdateSevice = new LectureUpdateService();
		ActionForward	forward = null;
		
		LectureBean article = new LectureBean();
		article.setLecture_idx(lecture_idx);
		article.setLecture_subject(request.getParameter("lecture_subject"));
		article.setLecture_course(request.getParameter("lecture_course_name"));
		article.setLecture_teacher(request.getParameter("lecture_teacher_name"));
		article.setLecture_teacher_code(request.getParameter("lecture_teacher_code"));
		System.out.println("티처코드 2는" + article.getLecture_teacher_code());
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
		forward.setPath("lectureList.le");
		forward.setRedirect(false);
		
	}
	
	
	return forward;
	}

}
