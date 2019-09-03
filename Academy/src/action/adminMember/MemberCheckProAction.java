package action.adminMember;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.member.MemberCheckProService;
import vo.ActionForward;

public class MemberCheckProAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		int check = 1;
		MemberCheckProService memberCheckProService = new MemberCheckProService();
		check = memberCheckProService.idCheck(request.getParameter("id"));
		
		forward = new ActionForward();
		request.setAttribute("check", Integer.toString(check));
		forward.setPath("member/idCheck.jsp");
		forward.setRedirect(false);	
		
		return forward;
	}
}
