package action.lecture;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

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
		
		LectureInsertService lectureInsertService = new LectureInsertService();
		String lecture_room = request.getParameter("lecture_room");
		String lecture_month = request.getParameter("lecture_month");
		if(lecture_room == null) {
			lecture_room = "1";
		}
		Calendar cal = Calendar.getInstance();
		//현재 월
		int month = cal.get ( cal.MONTH ) + 1 ;
		int year = cal.get ( cal.YEAR);
		if(lecture_month == null) {
			lecture_month = Integer.toString(month);
		}
		Date lecture_start_day = Date.valueOf(year+"-"+lecture_month+"-"+1);
		List<LectureBean> list = lectureInsertService.lectureInsertList(lecture_room, lecture_start_day);
		int[] lecture_counts = lectureInsertService.lectureCount(lecture_room, lecture_start_day);
		if(list != null) {
			System.out.println("LectureInsertAction 성공");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수업정보조회 성공')");

			out.println("</script>");
			request.setAttribute("lecture_room", lecture_room);
			request.setAttribute("lecture_month", lecture_month);
			request.setAttribute("list", list);
			request.setAttribute("lecture_counts", lecture_counts);
			forward = new ActionForward();
			forward.setPath("./admin/lecture/lectureInsert.jsp");
			forward.setRedirect(false);
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수업정보조회 실패')");
			out.println("history.back()");
			out.println("</script>");
		
		}
		return forward;
	}
}
