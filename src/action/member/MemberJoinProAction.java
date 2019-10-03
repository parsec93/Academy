package action.member;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.member.MemberJoinProService;
import vo.ActionForward;
import vo.Email;
import vo.MemberBean;

public class MemberJoinProAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		
		String realFolder = ""; // 실제 업로드 폴더(톰캣)
        String saveFolder = "memberUpload"; // 이클립스 상의 업로드 폴더
        int fileSize = 10 * 1024 * 1024; // 10MB 제한 크기 지정
        
        // request 객체로부터 서블릿컨텍스트 객체(톰캣) 가져오기
        ServletContext context = request.getServletContext();
        realFolder = context.getRealPath(saveFolder); // 이클립스 상의 업로드 폴더에 해당하는 톰캣 실제 폴더
        
        // 파일 업로드를 위한 MultipartRequest 객체 생성(cos.jar API 필요)
        MultipartRequest multi = 
                new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());

		
		MemberBean mb = new MemberBean();
		
		String email = multi.getParameter("email1") + "@" +multi.getParameter("email2");
//		String isMember = request.getParameter("member_isMember");
//		System.out.println("에휴 ");
		String jumin = multi.getParameter("jumin1") + multi.getParameter("jumin2");


	
		
		mb.setMember_name(multi.getParameter("name"));
		mb.setMember_id(multi.getParameter("id"));
		mb.setMember_pass(multi.getParameter("password"));
		
		mb.setMember_jumin(jumin);
		
		mb.setMember_email(email);
		mb.setMember_postcode(multi.getParameter("postcode"));
		mb.setMember_add1(multi.getParameter("add1"));
		System.out.println(multi.getParameter("add1"));
		mb.setMember_add2(multi.getParameter("add2"));


		mb.setMember_phone(multi.getParameter("phone"));

		mb.setMember_bank(multi.getParameter("bank"));
		mb.setMember_accno(multi.getParameter("accno"));
		
		if(multi.getParameter("member_isMember").equals("1")) {
		mb.setMember_picture(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		mb.setMember_teacher_code(multi.getParameter("member_teacher_code")); ///

		}else {
			mb.setMember_picture("");
//			mb.setMember_teacher_code("");
		}
		mb.setMember_isMember(multi.getParameter("member_isMember"));
		System.out.println(multi.getParameter("name"));
		MemberJoinProService memberJoinProService = new MemberJoinProService();
		
		//과목 코드와동인한 선생의 최대코드를 가져와서 +1
		String member_teacher_code = multi.getParameter("member_teacher_code");
		System.out.println("member_teacher_code"+member_teacher_code);
		
		if(member_teacher_code != null) {
		ArrayList<String> list = memberJoinProService.getTeacherCode(member_teacher_code);
		System.out.println(list);
		if(list.size() == 0) {
			mb.setMember_teacher_code(member_teacher_code+1);
			System.out.println(member_teacher_code+1);
		}else {
			String code = list.get(0);
			for(int i=0;i<list.size();i++) {
				if(Integer.parseInt(code.substring(2)) < Integer.parseInt(list.get(i).substring(2)) ) {
					code = list.get(i);
				}
			}
			mb.setMember_teacher_code(code.substring(0,2)+(Integer.parseInt(code.substring(2))+1));
			System.out.println(code.substring(0,2)+(Integer.parseInt(code.substring(2))+1));
		}
		}
		
		boolean isJoinMember = memberJoinProService.insertMember(mb);
		
		if(isJoinMember) {
			System.out.println("회원가입 성공");
			
			forward = new ActionForward();
			if(mb.getMember_isMember().equals("0")) {
			forward.setPath("member/loginForm.jsp");
			forward.setRedirect(true);
			}else if(mb.getMember_isMember().equals("1")) {
			forward.setPath("TeacherList.me");
			forward.setRedirect(true);	
				
			}
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
