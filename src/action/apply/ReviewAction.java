package action.apply;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.apply.ReviewService;
import vo.ActionForward;
import vo.ApplyBean;
import vo.BoardPageInfo;
import vo.LectureBean;

public class ReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		response.setContentType("text/html;charset=UTF-8"); 
		String lecture = request.getParameter("lecture");


		//페이징 처리를 위한 변수 선언 
		int page = 1; // 현재 페이지 
		int limit = 10; // 한 페이지 당 표시할 게시물 수 
		
		// 파라미터로 전달된 page 파라미터가 null 이 아닐 경우 파라미터 값을 page 변수에 저장 
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		ReviewService reviewService = new ReviewService();

		
		int listCount  = reviewService.getReviewListCount(lecture);
		System.out.println(listCount);
		
		ArrayList<LectureBean> review = new ArrayList<LectureBean>();
		review = reviewService.selectLecture(page,limit,lecture);
		
		int maxPage = (int)((double)listCount / limit + 0.95);
		
		// 시작 페이지 수 계산
		int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
		
		// 끝 페이지 수 계산 
		int endPage = startPage + 10 - 1;
		
		// 끝 페이지 수가 전체 페이지 수 보다 클 경우 전체 페이지 수를 끝 페이지로 지정 
		if(endPage > maxPage) {
			endPage = maxPage;
		}
//		request.setAttribute("review", review);
		
		BoardPageInfo boardpageInfo = new BoardPageInfo(page, maxPage, startPage, endPage, listCount);

//        
//		if(review ==null) {
//			request.setAttribute("review", null);
//		}else {
	        request.setAttribute("boardPageInfo", boardpageInfo);
			request.setAttribute("review", review);
//			
//		}

		
//		System.out.println(review.size());
		
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
