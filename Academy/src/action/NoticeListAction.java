package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.NoticeListService;
import vo.ActionForward;
import vo.NoticeBean;

public class NoticeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("NoticeListAction");
		
		ActionForward forward = new ActionForward();
		
		NoticeListService noticeListService = new NoticeListService();
		
		ArrayList<NoticeBean> noticeList = noticeListService.getNoticeList();
		
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
			forward = new ActionForward();
			forward.setPath("notice.jsp");
			forward.setRedirect(false);
		}
		
		
		return forward;
	}

}
