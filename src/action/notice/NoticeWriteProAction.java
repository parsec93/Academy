package action.notice;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.notice.NoticeWriteProService;
import vo.ActionForward;
import vo.NoticeBean;

public class NoticeWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardWriteProAction");
		
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

        
        // 글쓰기 페이지에서 전달받은 파라미터를 BoardBean 객체에 저장
        NoticeBean noticeBean = new NoticeBean();
        // request 객체를 MultipartRequest 객체에 전달했으므로 multi.getParameter() 메서드로 파라미터 가져오기
        noticeBean.setNotice_subject(multi.getParameter("notice_subject"));
        noticeBean.setNotice_content(multi.getParameter("notice_content"));
        noticeBean.setIsNotice(Integer.parseInt(multi.getParameter("isNotice")));// 1 : 공지사항 / 2: 이벤트
        
        
        System.out.println(multi.getParameter("event_start_day"));
        System.out.println(multi.getParameter("event_end_day"));
        //이벤트 시작일 및 종료일 
        Date event_start_day, event_end_day;
        if(Integer.parseInt(multi.getParameter("isNotice")) == 2) {
        event_start_day = Date.valueOf(multi.getParameter("event_start_day"));
        event_end_day = Date.valueOf(multi.getParameter("event_end_day"));

        noticeBean.setEvent_start_day(event_start_day);
        noticeBean.setEvent_end_day(event_end_day);
        }
        
        
        // 업로드 파일명은 별도의 메서드 getOriginalFileName()를 호출하여 가져오기 
        noticeBean.setNotice_file(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
        
        
        // 비즈니스 로직을 처리할 Service 클래스 인스턴스 생성
       NoticeWriteProService noticeWriteProService = new NoticeWriteProService();
        // Service 클래스의 registArticle() 메서드를 호출하여 글쓰기 로직 처리(BoardBean 객체 전달)
        boolean isWriteSuccess = noticeWriteProService.registNotice(noticeBean);
        
        // isWriteSuccess 값 판별
        if(!isWriteSuccess) { // 글 쓰기에 실패했을 경우
            // 자바스크립트 활용하여 "등록 실패" 메세지 출력 후 이전 페이지로 돌아가기
            response.setContentType("text/html;charset=UTF-8"); // 응답 문서 타입 설정
            PrintWriter out = response.getWriter(); // 출력스트림 객체 가져오기
            out.println("<script>");
            out.println("alert('등록실패!')");
            out.println("history.back()");
            out.println("</script>");
        } else { // 글 쓰기에 성공했을 경우
            // ActionForward 객체 생성하여 포워딩 정보 설정
            forward = new ActionForward();
            forward.setPath("notice.no"); // 포워딩 경로 설정
            // 글 목록 출력을 위해 BoardList.bo 페이지로 새로운 요청이 이루어지므로 Redirect 방식으로 포워딩
            forward.setRedirect(true); // Redirect 방식 지정
        }
        
        
        
        
		
		return forward;
	}

}
