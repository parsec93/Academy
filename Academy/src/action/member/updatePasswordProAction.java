package action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.member.UpdateProService;
import vo.ActionForward;

public class updatePasswordProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("updatePasswordProAction");
		HttpSession session = request.getSession();
		String sId =(String)session.getAttribute("sId");
		String password = request.getParameter("password");
		String newPassword = request.getParameter("newPassword1");
		
		UpdateProService updateProService = new UpdateProService();
		boolean isPassword = updateProService.isPassword(sId, password);
		ActionForward forward = null;
		
		if(!isPassword) {
	         response.setContentType("text/html:charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>");
	         out.println("alert('비밀번호가 맞지 않습니다.')");
	         out.println("history.back()");
	         out.println("</script>");
		}else {
			boolean isUpdatePasswordSuccess = updateProService.updatePassword(sId, newPassword);
	         if(!isUpdatePasswordSuccess) {
	             response.setContentType("text/html:charset=UTF-8");
	             PrintWriter out = response.getWriter();
	             out.println("<script>");
	             out.println("alert('비밀번호 변경 실패!')");
	             out.println("history.back()");
	             out.println("</script>");   
	             
	          }else {
	             forward = new ActionForward();
	             session.invalidate();
	             forward.setPath("member/loginForm.jsp");
	             forward.setRedirect(true);
	          }
		}
		
		return forward;
	}

}
