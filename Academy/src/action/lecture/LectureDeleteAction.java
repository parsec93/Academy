package action.lecture;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.lecture.LectureDeleteService;
import vo.ActionForward;

public class LectureDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("action. LectureDelete action");
		
		int lecture_idx = Integer.parseInt(request.getParameter("lecture_idx"));
		
		LectureDeleteService lectureDeleteSesrvice = new LectureDeleteService();
		
		boolean isLectureDeleteSuccess = lectureDeleteSesrvice.deleteLecture(lecture_idx);
		
		ActionForward forward = null;
	
		if(!isLectureDeleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('삭제 실패')");
            out.println("history.back()");
            out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setPath("../Academy/lectureList.le");
			forward.setRedirect(true);
		}
		
		return forward;
	}

	
}
