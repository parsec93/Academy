package action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.notice.NoticeViewService;
import vo.ActionForward;
import vo.NoticeBean;

public class NoticeUpdateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeUpdateFormAction()");
		int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
		
		NoticeViewService noticeViewService = new NoticeViewService();
		NoticeBean noticeBean = noticeViewService.getArticle(notice_idx);
		request.setAttribute("noticeBean", noticeBean);
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("/notice_event/noticeUpdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
