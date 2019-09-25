package action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.member.FindService;
import svc.member.LoginProService;
import vo.ActionForward;

public class FindPassAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FindIdAction()");
		ActionForward forward  = null;
		
		String id = request.getParameter("id");
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		
		FindService findService = new FindService();
		String pass = findService.FindIdService(id,email);
		
		request.setAttribute("pass", pass);
		
		if(pass == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('아이디/이메일을 확인해 주세요!')");
            out.println("history.back()");

		}else {
            
			System.out.println("비밀번호 찾기 성공!");
			forward = new ActionForward();
			forward.setPath("/find.me");
			forward.setRedirect(true);

		}
		return forward;
	}

}
