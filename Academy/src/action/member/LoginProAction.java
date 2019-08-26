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
		
		if(sId !=null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된 접근입니다!')");
			out.println("location.href='Main.bo'");
			out.println("</script>");
		}else {
			String id =request.getParameter("id");
			String password = request.getParameter("password");
			System.out.println(id + password);
			LoginProService memberLoginProService = new LoginProService();
			boolean isLoginMember = memberLoginProService.isLoginMember(id,password);
			if(isLoginMember) {
				System.out.println("로그인 성공!");
				session.setAttribute("sId", id);
				forward = new ActionForward();
				forward.setPath("index.jsp");
				forward.setRedirect(true);
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
