package action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.member.FindService;
import vo.ActionForward;

public class FindIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FindIdAction()");
		ActionForward forward  = null;
		
		String name = request.getParameter("name");
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		
		FindService findService = new FindService();
		String id = findService.FindIdService(name,email);
		
		request.setAttribute("id", id);
		
		if(id == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('해당하는 ID가 없습니다.')");
            out.println("history.back()");

		}else {
			System.out.println("아이디찾기 성공");
			forward = new ActionForward();
			forward.setPath("/find.me");
			forward.setRedirect(false);


	}
		return forward;
	}

}
