package action.adminMember;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.member.InfoProService;
import vo.ActionForward;
import vo.MemberBean;

public class infoProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("infoProAction");
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String sId = (String)session.getAttribute("sId");
		
		InfoProService infoProService = new InfoProService();
		MemberBean memberBean = infoProService.getInfo(sId);
		System.out.println(memberBean.getMember_name());
		if(memberBean != null) {
			request.setAttribute("memberBean", memberBean);
			forward = new ActionForward();
			System.out.println("gomypage");
			System.out.println(memberBean.getMember_name());
			forward.setPath("member/mypage.jsp");
			forward.setRedirect(false);
		}
		return forward;
	}

}
