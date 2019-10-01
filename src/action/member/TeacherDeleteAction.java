package action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.member.TeacherDeleteService;
import vo.ActionForward;

public class TeacherDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("TeacherDeleteAction()");
		int member_idx =Integer.parseInt(request.getParameter("member_idx"));
		String member_id = request.getParameter("id");
		//String member_name = request.getParameter("name");

		TeacherDeleteService teacherDeleteService = new TeacherDeleteService();
		boolean isTeacherDelete = teacherDeleteService.isTeacher(member_idx, member_id);
		
ActionForward forward =null;
		
		if(!isTeacherDelete) {//해당계정에 대한 정보가 없다면
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다.')");			
			out.println("history.back()");
			out.println("</script>");
			
		}else {//해당 계정이 있을시 
			
			//TeacherDeleteService 객체의 메서드, 계정 삭제
			boolean isDeleteSuccess = teacherDeleteService.remove(member_idx);
			if(!isDeleteSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('계정 삭제 실패')");			
				out.println("history.back()");
				out.println("</script>");
			}else {
			
		//일치하지 않을시 자바스크립트를 사용하여 이전페이지로 이동해야하므로ActionForword 객체 설정은
		//else문을 통해 별로도 설정해야함
		forward = new ActionForward();
		forward.setPath("TeacherList.me");
		forward.setRedirect(true);
			}	
		}
		return forward;	
	}

}
