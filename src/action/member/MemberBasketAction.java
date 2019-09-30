package action.member;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import action.Action;
import sun.awt.image.IntegerComponentRaster;
import svc.lecture.LectureEnrolmentService;
import vo.ActionForward;
import vo.LectureBean;


public class MemberBasketAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("action. MemberBasket action");
		response.setContentType("text/html;charset=UTF-8"); 
		String[] chkArray  = request.getParameterValues("chkArray");
		
		for(int i=0; i<chkArray.length; i++) System.out.println("체크박스 값 :"+chkArray[i]);
		
		
//		
//		List<LectureBean> lectureList =null;
//		
//
//
//		LectureEnrolmentService lectureEnrolmentSesrvice = new LectureEnrolmentService();
//		lectureList= lectureEnrolmentSesrvice.enrolmentLecture(category_subject, category_day, category_time);
//		
//
//		System.out.println(lectureList.size());
//		JSONArray arr=new JSONArray();
//		
//		for(int i=0; i<lectureList.size();i++) {
//			LectureBean lb = lectureList.get(i);
//			JSONObject obj=new JSONObject();
//			long term = (lb.getLecture_end_day().getTime() - lb.getLecture_start_day().getTime());
//			int termdays = (int)(term / (24 * 60 * 60 * 1000));
//			obj.put("lecture_id", Integer.toString(lb.getLecture_idx()));
//			obj.put("subject", lb.getLecture_subject());
//			obj.put("course", lb.getLecture_course());
//			obj.put("termday", Integer.toString(termdays));
//			obj.put("day", lb.getLecture_week_day());
//			obj.put("time", lb.getLecture_time());
//			obj.put("fee", Integer.toString(lb.getLecture_fee()));
//			obj.put("teacher", lb.getLecture_teacher());
////			obj.put("startday", lb.getLecture_start_day());
////			obj.put("endday", lb.getLecture_end_day());
//			arr.add(obj);
//			
//			
//		}
//		
//		System.out.println(arr);
//		response.setContentType("text/html; charset=utf-8"); 
//		PrintWriter writer = response.getWriter();
//		writer.print(arr.toString());
//		writer.flush();
//		writer.close();

		return null;
	}	
}

