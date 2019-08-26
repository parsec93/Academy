package action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.member.UpdateProService;
import vo.ActionForward;
import vo.MemberBean;

public class updateProAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      System.out.println("updateProAction");
      
      HttpSession session = request.getSession();
      String sId = (String)session.getAttribute("sId");
      String password = request.getParameter("password");
      MemberBean mb = new MemberBean();
      mb.setMember_name(request.getParameter("name"));
      mb.setMember_pass(password);
      mb.setMember_email(request.getParameter("email"));
      mb.setMember_postcode(request.getParameter("address"));
      mb.setMember_add1(request.getParameter("address_more1"));
      mb.setMember_add2(request.getParameter("address_more2"));
      mb.setMember_phone(request.getParameter("phone"));
      mb.setMember_id(sId);
      
      System.out.println(sId + password);
      UpdateProService updateProService = new UpdateProService();
      boolean isPassword = updateProService.isPassword(sId, password);
      ActionForward forward = null;
      
      if(!isPassword) {
         response.setContentType("text/html:charset=UTF-8");
         PrintWriter out = response.getWriter();
         out.println("<script>");
         out.println("alert('수정할 권한이 없습니다.')");
         out.println("history.back()");
         out.println("</script>");
      }else {
         
         
         boolean isUpdateSuccess = updateProService.updateMember(mb);
      
         if(!isUpdateSuccess) {
            response.setContentType("text/html:charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('글 수정 실패!')");
            out.println("history.back()");
            out.println("</script>");   
            
         }else {
            forward = new ActionForward();
            request.setAttribute("memberBean", mb);
            System.out.println(mb.getMember_name());
            forward.setPath("member/mypage.jsp");
            forward.setRedirect(false);
         }
      }
   
      return forward;
   }

}