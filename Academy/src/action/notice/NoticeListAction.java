package action.notice;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.notice.NoticeListService;
import vo.ActionForward;
import vo.NoticeBean;
import vo.NoticePageInfo;

// 글 목록 보기 요청을 처리하는 NoticeListAction
public class NoticeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("NoticeListAction");
		
		
		
		// 게시물 목록 정보를 받아와서 저장할 ArrayList 타입 변수 선언(제네릭 타입은 NoticeBean 으로 지정)
		ArrayList<NoticeBean> noticeList = new ArrayList<NoticeBean>();
		
		//페이징 처리를 위한 변수 선언 
		int page = 1; // 현재 페이지 
		int limit = 10; // 한 페이지 당 표시할 게시물 수 
		
		// 파라미터로 전달된 page 파라미터가 null 이 아닐 경우 파라미터 값을 page 변수에 저장 
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		NoticeListService noticeListService = new NoticeListService();
		
		int listCount = noticeListService.getNoticeListCount(); // 전체 게시물 수 가져오기 
		
		noticeList = noticeListService.getNoticeList(page, limit); //전체 게시물 목록 가져오기 (10개 한정)	
		
		//전체 페이지(마지막 페이지) 수 계산 
		int maxPage = (int)((double)listCount / limit + 0.95);
		
		// 시작 페이지 수 계산
		int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
		
		// 끝 페이지 수 계산 
		int endPage = startPage + 10 - 1;
		
		// 끝 페이지 수가 전체 페이지 수 보다 클 경우 전체 페이지 수를 끝 페이지로 지정 
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		ActionForward forward = new ActionForward();
		
		
		// NoticePageInfo 인스턴스 생성 후 페이징 처리 정보 저장 
		NoticePageInfo noticePageInfo = new NoticePageInfo(page, maxPage, startPage, endPage, listCount);
		
		// request 객체에 NoticePageInfo 객체(noticePageInfo)와 ArrayList 객체(noticeList) 를 파라미터로 저장
		request.setAttribute("noticePageInfo", noticePageInfo);
		request.setAttribute("noticeList", noticeList);
		
		if(noticeList == null) {
			response.setContentType("text/html;/charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
            out.println("alert('공지사항 게시판 조회 실패!')");
            out.println("history.back()");
            out.println("</script>");
		}else {
			System.out.println("공지사항 조회 성공");
			forward.setPath("notice_event/notice.jsp");
			forward.setRedirect(false);
		}
		
		
		return forward;
	}

}
