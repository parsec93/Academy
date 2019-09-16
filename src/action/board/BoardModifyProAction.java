package action.board;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.board.BoardModifyProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("BoardModifyProAction");
		String board_id = request.getParameter("board_id");
		String board_sid = request.getParameter("board_sid");

		BoardModifyProService boardModifyProService = new BoardModifyProService();

		ActionForward forward = null;

		String realFolder = ""; // 실제 업로드 폴더(톰캣)
		String saveFolder = "/boardUpload"; // 이클립스 상의 업로드 폴더
		int fileSize = 10 * 1024 * 1024; // 10MB 제한 크기 지정

		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder); // 이클립스 상의 업로드 폴더에 해당하는 톰캣 실제 폴더

		// 파일 업로드를 위한 MultipartRequest 객체 생성(cos.jar API 필요)
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
				new DefaultFileRenamePolicy());

		// 전달받은 파라미터 데이터(번호, 제목, 내용)를 BoardBean 객체에 저장
		BoardBean article = new BoardBean();

		int board_num = Integer.parseInt(multi.getParameter("board_num"));
		String page = multi.getParameter("page");
		article.setBoard_num(board_num);
		
		if (board_id.equals("qna")) {

			if (multi.getParameter("board_issecret") != null) {
				article.setIsSecret(Integer.parseInt(multi.getParameter("board_issecret")));
				
			} else {
				article.setIsSecret(0);
			}
		} else {
			article.setIsSecret(0);
		}
		
		
		if(Integer.parseInt(multi.getParameter("board_re_lev"))==0) {
			article.setBoard_file(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
			}
		
		article.setBoard_subject(multi.getParameter("board_subject"));
		article.setBoard_content(multi.getParameter("board_content"));

		// BoardModifyProService 객체의 modifyArticle() 메서드를 호출하여 수정 후 결과값 리턴받음
		boolean isModifySuccess = boardModifyProService.modifyArticle(article);

		// isModifySuccess 판별
		if (!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			// 실패했을 경우 if 문을 통해 자바스크립트를 사용하여 이전페이지로 이동해야하므로
			// ActionForward 객체 설정은 else 문을 통해 별도로 설정해야함
			// ActionForward 객체 생성 후
			// BoardDetail.bo 페이지로 포워딩 => 파라미터로 글번호(board_num), 페이지(page) 전달
			// => 주소가 변경(새로운 요청)되어야 하므로 Redirect 방식으로 이동
			forward = new ActionForward();
			forward.setPath("BoardView.bo?board_num=" + board_num + "&page=" + page + "&board_id=" + board_id
					+ "&board_sid=" + board_sid);
			forward.setRedirect(true); // Redirect 방식이므로 생략 불가
		}

		return forward;
	}

}
