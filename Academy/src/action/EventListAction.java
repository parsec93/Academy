package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.EventListService;
import vo.ActionForward;
import vo.NoticeBean;

public class EventListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("EventListAction");
		
		ActionForward forward = new ActionForward();
		EventListService eventListService = new EventListService();
		
		ArrayList<NoticeBean> eventList = eventListService.getEventList();
		request.setAttribute("eventList", eventList);
		
		
		forward.setPath("event.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
