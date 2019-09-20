package action.apply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import vo.ActionForward;

public class ApplyInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ApplyInfoAction");	
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String sId = (String)session.getAttribute("sId");
		int apply_idx = Integer.parseInt(request.getParameter("apply_idx"));
		
		
		
		
		return null;
	}

}
