package action.notice;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.notice.EventListService;
import vo.ActionForward;
import vo.NoticeBean;

public class EventListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("EventListAction");
		
		ActionForward forward = new ActionForward();
		EventListService eventListService = new EventListService();
		
		ArrayList<NoticeBean> eventList = eventListService.getEventList();
		
		if(eventList == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이벤트 조회 실패')");
			out.println("</script>");
		}else {
			System.out.println("이벤트 조회 성공");
			request.setAttribute("eventList", eventList);
			forward.setPath("notice_event/event.jsp");
			forward.setRedirect(false);
		}
		
		

		return forward;
	}

}
