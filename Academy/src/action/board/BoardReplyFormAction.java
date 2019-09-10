package action.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.board.BoardViewService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardReplyFormAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("BoardReplyFormAction");
        
        // 게시물 번호(board_num), 현재 페이지(page) 파라미터 가져오기
        int board_num = Integer.parseInt(request.getParameter("board_num"));
        String page = request.getParameter("page");
        String board_id = request.getParameter("board_id");
        String board_sid = request.getParameter("board_sid");
        String board_replyid = request.getParameter("board_replyid");
        // BoardDetailService 클래스의 getArticle() 메서드를 호출하여 게시물 정보 가져오기
        BoardViewService bds = new BoardViewService();
        BoardBean article = bds.getArticle(board_num);
        
        // 현재 게시물 정보(article), 현재 페이지(page) request 객체에 저장
        request.setAttribute("article", article);

        
        ActionForward forward = new ActionForward();
        forward.setPath("/board/board_reply.jsp?page="+page+"&board_id="+board_id+"&board_sid="+board_sid+"&board_replyid="+board_replyid);
        forward.setRedirect(false); // Dispatcher 방식 지정
        return forward;
    }

}
