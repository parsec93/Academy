package action.lecture;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.lecture.LectureInsertService;
import vo.ActionForward;
import vo.LectureBean;

public class LectureInsertAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		LectureBean lb = new LectureBean();
		lb.setLecture_subject(request.getParameter("lecture_subject"));
		lb.setLecture_course(request.getParameter("lecture_course"));
		lb.setLecture_teacher(request.getParameter("lecture_teacher"));
		
		Date lecture_start_day = Date.valueOf(request.getParameter("lecture_start_day"));
		Date lecture_end_day = Date.valueOf(request.getParameter("lecture_end_day"));
		lb.setLecture_start_day(lecture_start_day);
		lb.setLecture_end_day(lecture_end_day);
		
		if(request.getParameter("weekday").equals("1")) {
			lb.setLecture_week_day("월,수,금");
		}else if(request.getParameter("weekday").equals("2")){
			lb.setLecture_week_day("화,목");
		}
		System.out.println(request.getParameter("lecture_content")+"제목");
		lb.setLecture_content(request.getParameter("lecture_content"));
		lb.setLecture_fee(Integer.parseInt(request.getParameter("lecture_fee")));
		
		LectureInsertService lectureInsertService = new LectureInsertService();
		boolean isSuccess = lectureInsertService.lectureInsert(lb);
		
		if(isSuccess) {
			System.out.println("수업등록 성공");
			
			forward = new ActionForward();
			forward.setPath("lectureList.le");
			forward.setRedirect(true);
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수업등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		
		return forward;
	}
}
