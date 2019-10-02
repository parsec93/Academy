package action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.member.MemberBasketService;
import svc.member.MemberDeleteService;
import vo.ActionForward;

public class MemberBasketDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberBasketDeleteAction()");
		HttpSession session = request.getSession();
		String sId = (String)session.getAttribute("sId");
		MemberDeleteService memberDeleteService = new MemberDeleteService();
		String[] chkArray  = request.getParameterValues("chkArray");
		
		for(int i=0; i<chkArray.length; i++) System.out.println("체크박스 값 :"+chkArray[i]);
		
		MemberBasketService memberBasketService = new MemberBasketService();
		for(int i=0; i<chkArray.length; i++) {
			
			memberBasketService.deleteBasket(sId, chkArray[i]);
			
		}

		return null;

	}

}
