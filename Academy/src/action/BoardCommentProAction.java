package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardCommentProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardCommentProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("BoardCommentProAction");
        // page 파라미터 가져오기
        String page = request.getParameter("page");
        
        // BoardBean 객체(article) 생성 후 전달받은 모든 파라미터 추가
        BoardBean article = new BoardBean();
        article.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
//        article.setBoard_id(request.getParameter("board_id"));
        article.setComment(request.getParameter("comment"));
        
        // BoardReplyProService 인스턴스 생성
        BoardCommentProService boardCommentProService = new BoardCommentProService();
        boardCommentProService.commentArticle(article);
        
        
        // ActionForward 객체를 사용하여 BoardList.bo?page=x 포워딩 => 페이지 번호를 가지고 이동
        ActionForward forward = new ActionForward();
        forward.setPath("BoardView.bo?board_num=" +article.getBoard_num()+"&page="+page);
        forward.setRedirect(true);
        
        return forward;
    }

}
