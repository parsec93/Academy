package action.member;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import action.Action;
import sun.awt.image.IntegerComponentRaster;
import svc.lecture.LectureEnrolmentService;
import svc.member.MemberBasketService;
import vo.ActionForward;
import vo.LectureBean;


public class MemberBasketAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("action. MemberBasket action");
		response.setContentType("text/html;charset=UTF-8"); 
		HttpSession session = request.getSession();
		String sId = (String)session.getAttribute("sId");
		String[] chkArray  = request.getParameterValues("chkArray");
		
		for(int i=0; i<chkArray.length; i++) System.out.println("체크박스 값 :"+chkArray[i]);
		
		MemberBasketService memberBasketService = new MemberBasketService();
		for(int i=0; i<chkArray.length; i++) {
			
			memberBasketService.insertBasket(sId, chkArray[i]);
			
		}

		return null;
	}	
}

