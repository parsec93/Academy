package action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.member.MemberDeleteService;
import svc.member.TeacherDeleteService;
import vo.ActionForward;

public class MemberDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberDeleteAction()");
		int member_idx =Integer.parseInt(request.getParameter("member_idx"));
		String member_id = request.getParameter("id");
		//String member_name = request.getParameter("name");
		String member_pass = request.getParameter("pass");
		MemberDeleteService memberDeleteService = new MemberDeleteService();
		boolean isMemberDelete = memberDeleteService.isMember(member_idx, member_id);
		
		ActionForward forward =null;
		
		if(!isMemberDelete) {//해당 멤버가 아닌경우
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다.')");			
			out.println("history.back()");
			out.println("</script>");
			
		}else {//해당 멤버가 맞는 경우
			HttpSession session = request.getSession();
			//MemberDeleteService 객체의 메서드를 호출, 패스워드 비교 
			boolean isDeleteSuccess = memberDeleteService.remove(member_id, member_pass);
			if(!isDeleteSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('계정 삭제 실패')");			
				out.println("history.back()");
				out.println("</script>");
			}else {
//				forward = new ActionForward();
		session.invalidate(); //세션값 저장된거 없애기!
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('회원탈퇴 되었습니다.')");		//안내창 띄우고
		out.println("opener.location.href='/Academy/index.jsp'"); //부모창(마이페이지) => 메인으로 이동
		out.println("window.close()"); //deleteForm 닫기 
		out.println("</script>");
//
//		forward.setPath("/Academy/index.jsp");
//		forward.setRedirect(true);
			}	
		}
		return null;	
	}

}
