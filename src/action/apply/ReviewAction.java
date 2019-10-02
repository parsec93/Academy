package action.apply;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.apply.ReviewService;
import vo.ActionForward;
import vo.ApplyBean;
import vo.LectureBean;

public class ReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		response.setContentType("text/html;charset=UTF-8"); 
		String lecture = request.getParameter("lecture");
		ArrayList<LectureBean> review = new ArrayList<>();

		//페이징 처리를 위한 변수 선언 
		int page = 1; // 현재 페이지 
		int limit = 10; // 한 페이지 당 표시할 게시물 수 
		
		// 파라미터로 전달된 page 파라미터가 null 이 아닐 경우 파라미터 값을 page 변수에 저장 
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		ReviewService reviewService = new ReviewService();
		review = reviewService.selectLecture(lecture);
		
		int listCount =0;

	
		
		
		
		request.setAttribute("review", review);
		
		System.out.println(review);
		
		if(lecture.equals("java")) {
			forward.setPath("course_java.jsp");
		}else if(lecture.equals("jsp")) {
			forward.setPath("course_jsp.jsp");
		}else if(lecture.equals("oracle")) {
			forward.setPath("course_oracle.jsp");
		}else if(lecture.equals("web")) {
			forward.setPath("course_web.jsp");
		}else if(lecture.equals("network")) {
			forward.setPath("course_network.jsp");
		}

		forward.setRedirect(false);
		return forward;
	}

}
