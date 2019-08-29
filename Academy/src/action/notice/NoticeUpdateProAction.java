package action.notice;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.notice.NoticeUpdateProService;
import vo.ActionForward;
import vo.NoticeBean;

public class NoticeUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeUpdateProAction()!");
		
		ActionForward forward = null;
		
		
		
		String realFolder = ""; // 실제 업로드 폴더(톰캣)
        String saveFolder = "noticeUpload"; // 이클립스 상의 업로드 폴더
        int fileSize = 10 * 1024 * 1024; // 10MB 제한 크기 지정
        
        // request 객체로부터 서블릿컨텍스트 객체(톰캣) 가져오기
        ServletContext context = request.getServletContext();
        realFolder = context.getRealPath(saveFolder); // 이클립스 상의 업로드 폴더에 해당하는 톰캣 실제 폴더
        
        // 파일 업로드를 위한 MultipartRequest 객체 생성(cos.jar API 필요)
        MultipartRequest multi = 
        		new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
        int notice_idx = Integer.parseInt(multi.getParameter("notice_idx"));
        String notice_subject= multi.getParameter("notice_subject");
        String notice_content = multi.getParameter("notice_content");
        int isNotice = Integer.parseInt(multi.getParameter("isNotice"));
		String notice_old_file = multi.getParameter("notice_file");
		String notice_file = multi.getOriginalFileName((String)multi.getFileNames().nextElement());
        
        NoticeBean noticeBean = new NoticeBean();
		noticeBean.setNotice_idx(notice_idx);
		noticeBean.setNotice_subject(notice_subject);
        noticeBean.setNotice_content(notice_content);
        noticeBean.setIsNotice(isNotice);// 1 : 공지사항 / 2: 이벤트
        
        
        //이벤트 시작일 및 종료일 
        Date event_start_day, event_end_day;
        if(Integer.parseInt(multi.getParameter("isNotice")) == 2) {
        event_start_day = Date.valueOf(multi.getParameter("event_start_day"));
        event_end_day = Date.valueOf(multi.getParameter("event_end_day"));

        noticeBean.setEvent_start_day(event_start_day);
        noticeBean.setEvent_end_day(event_end_day);
        }
        if(notice_file == null) {
     // 예전파일 있을경우 그대로 저장
        	noticeBean.setNotice_file(notice_old_file);
        }else {
        	noticeBean.setNotice_file(notice_file);
        }
        
        NoticeUpdateProService noticeUpdateProService = new NoticeUpdateProService();    
		boolean isNoticeUpdate = noticeUpdateProService.noticeUpdate(noticeBean);
		if(!isNoticeUpdate) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 수정 실패')");			
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setPath("noticeView.no?notice_idx=" + notice_idx);
			forward.setRedirect(true);
		}
		
		return forward;
		
	}

}
