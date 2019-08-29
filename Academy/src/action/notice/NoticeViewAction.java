package action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.notice.NoticeViewService;
import vo.ActionForward;
import vo.NoticeBean;

public class NoticeViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeViewAction!");
		
		int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
		NoticeViewService noticeViewService = new NoticeViewService();
		NoticeBean noticeBean = noticeViewService.getArticle(notice_idx);
		
		request.setAttribute("noticeBean", noticeBean);
		
		ActionForward forward = new ActionForward();
		forward.setPath("notice_event/noticeView.jsp");//포워딩 주소 지정
		forward.setRedirect(false);//포워드 방식 지정
		
		
		return forward;
	}

}
