package action.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.board.BoardReplyProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardReplyProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("BoardReplyProAction");
        // page 파라미터 가져오기
        String page = request.getParameter("page");
        String board_id = request.getParameter("board_id");
        String board_sid = request.getParameter("board_sid");
        System.out.println(board_id);
        // BoardBean 객체(article) 생성 후 전달받은 모든 파라미터 추가
        BoardBean article = new BoardBean();
        article.setBoard_id(board_id);
        article.setBoard_sid(board_sid);
        article.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
        article.setBoard_subject(request.getParameter("board_subject"));
        article.setBoard_content(request.getParameter("board_content"));
        article.setBoard_re_ref(Integer.parseInt(request.getParameter("board_re_ref")));
        article.setBoard_re_lev(Integer.parseInt(request.getParameter("board_re_lev")));
        article.setBoard_re_seq(Integer.parseInt(request.getParameter("board_re_seq")));
        article.setIsSecret(Integer.parseInt(request.getParameter("board_issecret")));
        article.setBoard_replyid(request.getParameter("board_replyid"));
        System.out.println("ReplyProAction 클래스 : " + Integer.parseInt(request.getParameter("board_re_ref")) + ", " + Integer.parseInt(request.getParameter("board_re_lev")));
        
        // BoardReplyProService 인스턴스 생성
        BoardReplyProService boardReplyProService = new BoardReplyProService();
        boardReplyProService.replyArticle(article);
        
        
        // ActionForward 객체를 사용하여 BoardList.bo?page=x 포워딩 => 페이지 번호를 가지고 이동
        ActionForward forward = new ActionForward();
        forward.setPath(board_id+"board.bo?page=" + page+"&board_id="+board_id);
        forward.setRedirect(true);
        
        return forward;
    }

}
