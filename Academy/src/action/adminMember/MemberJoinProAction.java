package action.adminMember;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.member.MemberJoinProService;
import vo.ActionForward;
import vo.Email;
import vo.MemberBean;

public class MemberJoinProAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		
		MemberBean mb = new MemberBean();
		
		String email = request.getParameter("email1") + "@" +request.getParameter("email2");
		mb.setMember_name(request.getParameter("name"));
		mb.setMember_id(request.getParameter("id"));
		mb.setMember_pass(request.getParameter("password"));
		mb.setMember_email(email);
		mb.setMember_postcode(request.getParameter("postcode"));
		mb.setMember_add1(request.getParameter("add1"));
		mb.setMember_add2(request.getParameter("add2"));
		mb.setMember_phone(request.getParameter("phone"));
		System.out.println(request.getParameter("name"));
		MemberJoinProService memberJoinProService = new MemberJoinProService();
		boolean isJoinMember = memberJoinProService.insertMember(mb);
		
		if(isJoinMember) {
			System.out.println("회원가입 성공");
			
			forward = new ActionForward();
			forward.setPath("member/loginForm.jsp");
			forward.setRedirect(true);
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		
		return forward;
	}
}
