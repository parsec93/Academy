package action.apply;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.apply.ApplyAttendCheckService;
import svc.apply.ApplyListTeacherService;
import svc.apply.ApplyMemberListService;
import vo.ActionForward;
import vo.ApplyBean;
import vo.LectureBean;
import vo.LecturePageInfo;

public class ApplyAttendCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ApplyAttendCheckAction");
		String cYN = request.getParameter("cYN");
		int lecture_idx = Integer.parseInt(request.getParameter("lecture_idx"));
		String attendmember = request.getParameter("attendmember");
		int attendDay = Integer.parseInt(request.getParameter("attendDay"));
		System.out.println(attendmember);
		System.out.println(lecture_idx);
		System.out.println(cYN);
		System.out.println(attendDay);
		
		String[] attendMemberArr = attendmember.split("/");
		String[] attendCheckArr = cYN.split("/");
		
		ApplyAttendCheckService applyAttendCheckService = new ApplyAttendCheckService();
		boolean isUpdateSuccess = applyAttendCheckService.UpdateAttendCheck(attendMemberArr, attendCheckArr, lecture_idx,attendDay);
		
		ActionForward forward = null;
        if(!isUpdateSuccess) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('출석체크 실패!')");
            out.println("history.back()");
            out.println("</script>");   
            
         }else {
        	 
             response.setContentType("text/html;charset=UTF-8");
             PrintWriter out = response.getWriter();
             out.println("<script>");
             out.println("alert('출석체크 성공!')");
             out.println("window.close()");
             out.println("</script>");  
//             forward = new ActionForward();
//             forward.setPath("apply/ListTeacher.jsp");
//             forward.setRedirect(false);
        	 
      
         }
	
		return null;
         
	}
}
