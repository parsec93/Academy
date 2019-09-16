package action.board;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.board.BoardDeleteProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardDeleteProAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("BoardDeleteProAction");
    	int board_num = Integer.parseInt(request.getParameter("board_num"));
        String page = request.getParameter("nowPage");
        String board_id = request.getParameter("board_id");
        
        BoardDeleteProService boardDeleteProService = new BoardDeleteProService();
        // 패스워드 확인

        ActionForward forward = null;
        
 
            // BoardDeleteProService 객체의 removeArticle() 메서드를 호출하여 삭제 후 결과값 리턴받음
            boolean isDeleteSuccess = boardDeleteProService.removeArticle(board_num);
            
            // isDeleteSuccess 판별
            if(!isDeleteSuccess) {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('글 삭제 실패!')");
                out.println("history.back()");
                out.println("</script>");
            } else {
                forward = new ActionForward();
                forward.setPath(board_id+"board.bo?page=" + page);
                forward.setRedirect(true); // Redirect 방식이므로 생략 불가
            }
        
        
        return forward;
    }

}
