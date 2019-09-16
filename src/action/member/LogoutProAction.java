package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import vo.ActionForward;

public class LogoutProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LogoutProAction");
		HttpSession session = request.getSession();
		session.invalidate();
		
		ActionForward forward = new ActionForward();
		forward.setPath("index.jsp");
		forward.setRedirect(true);
		
		return forward;
	}

}
