package svc.board;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BoardDAO;

public class BoardCommentDeleteProService {


    // 글 번호를 전달받아 게시물 삭제(본인 확인 완료된 상태)
    public boolean removeComment(int comment_num) throws Exception {
        boolean isRemoveSuccess = false; // 게시물 삭제 결과 저장할 변수
        
        Connection con = getConnection();
        BoardDAO boardDAO = BoardDAO.getInstance();
        boardDAO.setConnection(con);
        
        // BoardDAO 객체의 deleteArticle() 메서드를 호출하여 글 번호(board_num)를 전달
        // => 게시물 삭제 결과를 정수형으로 리턴받아 성공 여부 판별
        int deleteCount = boardDAO.deleteComment(comment_num);
        
        if(deleteCount > 0) { // 삭제 성공했을 경우
            commit(con);
            isRemoveSuccess = true;
        } else { // 삭제 실패했을 경우
            rollback(con);
        }
        
        close(con);
        
        return isRemoveSuccess;
    }
    
    

}
















