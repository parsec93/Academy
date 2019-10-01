package action.board;

import java.io.PrintWriter;


import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.board.BoardCommentListService;
import svc.board.BoardListService;
import vo.ActionForward;
import vo.BoardBean;
import vo.BoardPageInfo;

// 글 목록 보기 요청을 처리하는 BoardListAction
public class BoardListAction implements Action {

	
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("BoardListAction!");
        String board_id = (String) request.getAttribute("board_id");
        String board_sid = (String) request.getAttribute("board_sid");
        String search = (String)request.getAttribute("search");
        
        // 게시물 목록 정보를 받아와서 저장할 ArrayList 타입 변수 선언(제네릭 타입 BoardBean 타입으로 지정)
        ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
        
        // 페이징 처리를 위한 변수 선언
        int page = 1; // 현재 페이지
        int limit = 10; // 한 페이지 당 표시할 게시물 수
        
        // 파라미터로 전달된 page 파라미터가 null 이 아닐 경우 파라미터 값을 page 변수에 저장
        if(request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        BoardListService boardListService = new BoardListService();
        int listCount = boardListService.getBoardListCount(board_id, search); // 전체 게시물 수 가져오기
        
        articleList = boardListService.getArticleList(page, limit,board_id,search); // 전체 게시물 목록 가져오기(10개 한정)
        
        // 전체 페이지(마지막 페이지) 수 계산
        int maxPage = (int)((double)listCount / limit + 0.95);
        
        // 시작 페이지 수 계산
        int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
        
        // 끝 페이지 수 계산
        int endPage = startPage + 10 - 1;
        
        // 끝 페이지 수가 전체 페이지 수 보다 클 경우 전체 페이지 수를 끝 페이지로 지정
        if(endPage > maxPage) {
            endPage = maxPage;
        }
        
     
        ActionForward forward = new ActionForward();
        // PageInfo 인스턴스 생성 후 페이징 처리 정보 저장
        BoardPageInfo boardpageInfo = new BoardPageInfo(page, maxPage, startPage, endPage, listCount);
        
        // request 객체에 PageInfo 객체(pageInfo)와 ArrayList 객체(articleList)를 파라미터로 저장
        request.setAttribute("board_id", board_id);
        request.setAttribute("board_sid", board_sid);
        request.setAttribute("boardPageInfo", boardpageInfo);
        request.setAttribute("articleList", articleList);
        request.setAttribute("search", search); //페이지 search값 넘겨주기
        // ActionForward 객체를 생성하여 Dispatcher 방식으로 board 폴더 내의 qna_board_list.jsp 페이지로 이동
       
		if (board_id.equals("free")) {
			forward.setPath("board/board_free.jsp");
		} else if (board_id.equals("qna")) {
			forward.setPath("board/board_qna.jsp");
		}
		

		forward.setRedirect(false);
        return forward;
    }

}


















