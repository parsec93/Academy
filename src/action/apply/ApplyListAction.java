package action.apply;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.apply.ApplyInfoService;
import svc.apply.ApplyListService;
import vo.ActionForward;
import vo.ApplyBean;

public class ApplyListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ApplyListAction");	
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String sId = (String)session.getAttribute("sId");
		ArrayList<ApplyBean> applyList = new ArrayList<ApplyBean>();
		
		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null) {
			page =Integer.parseInt(request.getParameter("page"));
		}
		
		ApplyListService applyInfoService = new ApplyListService();
		
		int listCount = applyInfoService.getApplyListCount();
		
		applyList = applyInfoService.getApplyList(page, limit);
		
		
		
		
		
		return null;
	}

}
