package action.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.board.BoardViewService;
import svc.member.InfoProService;
import vo.ActionForward;
import vo.BoardBean;
import vo.MemberBean;

public class BoardViewAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("BoardViewdAction");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
      	String board_sid = request.getParameter("board_sid");

        // 파라미터로 전달된 board_num, page 데이터 가져오기
        int board_num = Integer.parseInt(request.getParameter("board_num"));
        InfoProService infoProService = new InfoProService();
        String board_id = request.getParameter("board_id");
        System.out.println(board_num+"보드넘버");
        String page = request.getParameter("page"); // 직접 사용할 파라미터가 아니므로 int 형변환 필요없음 
        
        
        BoardViewService boardViewService = new BoardViewService();
        
        // BoardDetailService 객체의 getArticle() 메서드를 호출하여 글 상세 내용 BoardBean 타입으로 리턴받음
        BoardBean article = boardViewService.getArticle(board_num);
        
        System.out.println(article.getBoard_replyid()+"답글");

        if(board_id.equals("qna")) {
        	int isSecret = article.getIsSecret();
        	
        	

        	if(isSecret==1) {
        		if(request.getParameter("board_sid").equals("null")) {
        			out.println("<script>" );
        			out.println("alert('비밀 글 입니다');");
        			out.println("history.go(-1);");
        			out.println("</script>");
        			out.flush();
        		}
        		else{
        			System.out.println(board_sid);
        			MemberBean memberBean = infoProService.getInfo(board_sid);
        			if(!memberBean.getMember_isMember().equals("2")&!memberBean.getMember_isMember().equals("1")&!board_sid.equals(article.getBoard_sid())&!board_sid.equals(article.getBoard_replyid())) {
        			out.println("<script>" );
        			out.println("alert('비밀 글 입니다');");
        			out.println("history.go(-1);");
        			out.println("</script>");
        			out.flush();
        			}
        		}
        		
        	}
        	
        }
        
        // page 값 request 객체에 저장
        // 글 상세 내용 BoardBean 객체 request 객체에 저장
        request.setAttribute("article", article);
        System.out.println(page+"하하");
        // /board/qna_board_view.jsp 페이지로 포워딩(Dispatcher 방식)
        ActionForward forward = new ActionForward();
        forward.setPath("board/board_view.jsp?page="+page+"&board_id="+board_id); // 포워딩 주소 지정
        forward.setRedirect(false); // 포워딩 방식 지정 => Dispatcher 방식은 false 전달(생략 가능)
        
        return forward; // ActionForward 객체 리턴
        
    }

}













