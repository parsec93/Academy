package action.member;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.member.UpdateProService;
import vo.ActionForward;
import vo.MemberBean;

public class updateProAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      System.out.println("updateProAction");
      ActionForward forward = null;
      HttpSession session = request.getSession();
      
      String realFolder = ""; // 실제 업로드 폴더(톰캣)
      String saveFolder = "memberUpload"; // 이클립스 상의 업로드 폴더
      int fileSize = 10 * 1024 * 1024; // 10MB 제한 크기 지정
      
      // request 객체로부터 서블릿컨텍스트 객체(톰캣) 가져오기
      ServletContext context = request.getServletContext();
      realFolder = context.getRealPath(saveFolder); // 이클립스 상의 업로드 폴더에 해당하는 톰캣 실제 폴더
      
      // 파일 업로드를 위한 MultipartRequest 객체 생성(cos.jar API 필요)
      MultipartRequest multi = 
              new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
     
     //String sId = (String)session.getAttribute("sId");
      String sId =  (String)session.getAttribute("sId");
     // System.out.println(sId);
      
 	 int member_idx =0;
     if(sId.equals("admin1234")) {
    	 sId = multi.getParameter("id");
     }

     if(multi.getParameter("member_idx")==null) {
    	 member_idx =0;
    }else {
    	 member_idx = Integer.parseInt(multi.getParameter("member_idx"));
     }
      String password = multi.getParameter("password");
      String email = multi.getParameter("email1") + "@" + multi.getParameter("email2");
      MemberBean mb = new MemberBean();

  	String isMember ="";

      isMember = multi.getParameter("member_isMember");
      
      mb.setMember_name(multi.getParameter("name"));
      mb.setMember_pass(password);
      mb.setMember_email(email);
      mb.setMember_postcode(multi.getParameter("postcode"));
      mb.setMember_add1(multi.getParameter("add1"));
      mb.setMember_add2(multi.getParameter("add2"));
      mb.setMember_phone(multi.getParameter("phone"));
      mb.setMember_id(sId);
      
      if(isMember.equals("1")) {
    	  mb.setMember_bank(multi.getParameter("bank"));
    	  mb.setMember_accno(multi.getParameter("accno"));
          mb.setMember_teacher_code(multi.getParameter("member_teacher_code")); 
          //교사 계정 사진 변경시
          String opicture = multi.getParameter("opicture");
          String picture = multi.getOriginalFileName((String)multi.getFileNames().nextElement());
          System.out.println(opicture);
          System.out.println(picture);

    	  if(picture != null) {
    		  mb.setMember_picture(picture);
    	  }else {
    		  mb.setMember_picture(opicture);
    	  }
      }

	  mb.setMember_isMember(isMember);
      System.out.println(sId + password);
      UpdateProService updateProService = new UpdateProService();
      boolean isPassword = updateProService.isPassword(sId, password);

      
      if(!isPassword) {
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         out.println("<script>");
         out.println("alert('수정할 권한이 없습니다.')");
         out.println("history.back()");
         out.println("</script>");
      }else {
          
         boolean isUpdateSuccess = updateProService.updateMember(mb);
      
         if(!isUpdateSuccess) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('글 수정 실패!')");
            out.println("history.back()");
            out.println("</script>");   
            
         }else {
             forward = new ActionForward();
             request.setAttribute("memberBean", mb);
             System.out.println(mb.getMember_name());

        	 if(isMember.equals("1")) {    	
        		 
                 forward.setPath("TeacherView.me?member_idx="+member_idx);

        	 }else {
            forward.setPath("member/mypage.jsp");

        	 }
        	 
             forward.setRedirect(false);
        	 
         }
      }
   
      return forward;
   }

}