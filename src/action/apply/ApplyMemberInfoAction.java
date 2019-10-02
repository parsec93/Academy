package action.apply;

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
import svc.apply.ApplyBasketService;
import svc.lecture.LectureEnrolmentService;
import vo.ActionForward;
import vo.LectureBean;
import vo.MemberBean;


public class ApplyMemberInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("action. ApplyMemberInfoAction action");
		response.setContentType("text/html;charset=UTF-8"); 
		HttpSession session = request.getSession();
		String sId = (String)session.getAttribute("sId");
		List<MemberBean> memberInfo =null;

		ApplyBasketService applyBasketService = new ApplyBasketService();
		
		memberInfo = applyBasketService.memberInfo(sId);
		JSONArray arr=new JSONArray();
		for(int i=0; i<memberInfo.size();i++) {
			MemberBean mb = memberInfo.get(i);
			JSONObject obj=new JSONObject();
			obj.put("member_email", mb.getMember_email());
			obj.put("member_name", mb.getMember_name());
			obj.put("member_phone", mb.getMember_phone());
			obj.put("member_add1", mb.getMember_add1());
			obj.put("member_postcode", mb.getMember_postcode());
			arr.add(obj);
			
			
		}
		
		System.out.println(arr);
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter writer = response.getWriter();
		System.out.println(arr);
		writer.print(arr.toString());
		writer.flush();
		writer.close();
		
		
		return null;
	}	
}

