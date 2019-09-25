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
		System.out.println("FindPassAction()");
		ActionForward forward  = null;
		
		String id = request.getParameter("id");
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		
		FindService findService = new FindService();
		String pass = findService.FindPassService(id,email);
		

		
		if(pass == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('ID / E-mail을 정확하게 입력 바랍니다.')");
            out.println("history.back()");
            out.println("</script>");
		}else {          
			System.out.println("비밀번호 찾기 성공!");
			request.setAttribute("pass", pass);
			forward = new ActionForward();
			forward.setPath("/member/findPass.jsp");
			forward.setRedirect(false);

		}
		return forward;
	}

}
