package action.lecture;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.lecture.LectureInsertProService;
import vo.ActionForward;
import vo.LectureBean;

public class LectureInsertProAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		LectureBean lb = new LectureBean();
		lb.setLecture_subject(request.getParameter("lecture_subject"));
		lb.setLecture_course(request.getParameter("lecture_course_name"));
		lb.setLecture_teacher(request.getParameter("lecture_teacher_name"));
		lb.setLecture_teacher_code(request.getParameter("lecture_teacher_code"));
		
		String lecture_month = request.getParameter("lecture_month");
		Calendar cal = Calendar.getInstance();
		//현재 년도
		int year = cal.get ( cal.YEAR);
		Date lecture_start_day = Date.valueOf(year+"-"+lecture_month+"-"+01);
		Date lecture_end_day = Date.valueOf(year+"-"+lecture_month+"-"+30);
		int m = Integer.parseInt(lecture_month);
		System.out.println("m은?"+m);
		//1 3 5 7 8 10 12
		if(m==1 || m==3 || m==5 || m==7 || m==8) {
			lecture_start_day = Date.valueOf(year+"-0"+lecture_month+"-"+01);
			lecture_end_day = Date.valueOf(year+"-0"+lecture_month+"-"+31);
		}else if(m==10 || m==12) {
			lecture_end_day = Date.valueOf(year+"-"+lecture_month+"-"+31);
		}else if(m==2 || m==4 || m==6 || m==9) {
			lecture_start_day = Date.valueOf(year+"-0"+lecture_month+"-"+01);
			lecture_end_day = Date.valueOf(year+"-0"+lecture_month+"-"+30);
		}
		lb.setLecture_start_day(lecture_start_day);
		lb.setLecture_end_day(lecture_end_day);
		//
		lb.setLecture_week_day(request.getParameter("weekday"));
		
//		if(request.getParameter("weekday").equals("1")) {
//			lb.setLecture_week_day("월,수,금");
//		}else if(request.getParameter("weekday").equals("2")){
//			lb.setLecture_week_day("화,목");
//		}
		lb.setLecture_content(request.getParameter("lecture_content"));
		
		if(request.getParameter("time").equals("1")) {
			lb.setLecture_time("오전");
		}else if(request.getParameter("time").equals("2")){
			lb.setLecture_time("오후");
		}else if(request.getParameter("time").equals("3")){
			lb.setLecture_time("저녁");
		}
		lb.setLecture_room(request.getParameter("lecture_room"));
		lb.setLecture_fee(Integer.parseInt(request.getParameter("lecture_fee")));
		int lecture_count = Integer.parseInt(request.getParameter("lecture_count"));
		
		LectureInsertProService lectureInsertService = new LectureInsertProService();
		boolean isSuccess = lectureInsertService.lectureInsert(lb, lecture_count);
		
		if(isSuccess) {
			System.out.println("수업등록 성공");
			System.out.println(request.getParameter("lecture_subject"));
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수업등록 성공')");
//			out.println("opener.location.href='/Academy/lectureInsert.le';"); 
//			out.println("window.close();");
			out.println("</script>");
			
			forward = new ActionForward();
			forward.setPath("./admin/lecture/lectureInsertForm.jsp");
			forward.setRedirect(false);
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
