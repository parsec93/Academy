package action.lecture;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import action.Action;
import svc.lecture.LectureInsertFormService;
import vo.ActionForward;
import vo.MemberBean;

public class LectureInsertFormAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		String selCourse = request.getParameter("selCourse");
		System.out.println("selCourse는" + selCourse);
		LectureInsertFormService lectureInsertFormService = new LectureInsertFormService();
		ArrayList<MemberBean> tc = lectureInsertFormService.getTeatureCode();
		
		JSONArray arr=new JSONArray();
		for(int i=0;i<tc.size();i++){
			MemberBean mb = tc.get(i);
			System.out.println("tc는"+mb.getMember_teacher_code());
			if(mb.getMember_teacher_code().substring(0,2).equals(selCourse)){
				JSONObject obj=new JSONObject();
				obj.put("member_name", mb.getMember_name());
				obj.put("member_teacher_code", mb.getMember_teacher_code());
				arr.add(obj);
			}
		}
		
		System.out.println(arr);
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter writer = response.getWriter();
		writer.print(arr.toString());
		writer.flush();
		writer.close();
		
		return null;
	}
}
