package action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.member.LoginProService;
import vo.ActionForward;

public class LoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LoginProAction");
		
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		
		String sId = (String)session.getAttribute("sId");
		String id =request.getParameter("idlg");
		String password = request.getParameter("password");
		String isMember = request.getParameter("tYN");
		if(id.equals("admin1234")) {
			isMember = "2";
		}
		System.out.println("isMember"+isMember);
		
		if(sId !=null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된 접근입니다!')");
			out.println("location.href='Main.bo'");
			out.println("</script>");
		}else {
			LoginProService memberLoginProService = new LoginProService();
			boolean isLoginMember = memberLoginProService.isLoginMember(id, password,isMember);
			if(isLoginMember) {
				forward = new ActionForward();
				System.out.println("로그인 성공!");
				session.setAttribute("sId", id);
				request.setAttribute("isMember", isMember);
				forward.setPath("index.jsp");
				forward.setRedirect(false);
			}else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('로그인 실패!')");
                out.println("history.back()");
                out.println("</script>");
			}
		}
		
		
		return forward;
	}

}
