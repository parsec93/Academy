package svc.board;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.BoardDAO;

public class BoardCommentListService {

    // 전체 게시물 수를 조회하여 리턴하는 getListCount()
    public int getCommentCount(int board_num) throws Exception {
        int commentCount = 0; // 전체 게시물 수 저장하는 변수
        
        // Connection 객체 가져오기
        // static import 를 사용하여 JdbcUtil 클래스를 지정했으므로
        // JdbcUtil.getConnection(); 코드 대신 getConnection() 메서드 호출 코드만 작성하면 된다!
        Connection con = getConnection();  
        
        // BoardDAO 객체 가져오기
        BoardDAO boardDAO = BoardDAO.getInstance();
        
        // BoardDAO 객체에 Connection 객체 전달하기
        boardDAO.setConnection(con);
        
        // selectListCount() 메서드 호출하여 전체 게시물 수 조회하여 listCount 변수에 저장
        commentCount = boardDAO.selectCommentCount(board_num);
//        System.out.println(listCount);
        // Connection 객체 반환
        close(con);
        
        return commentCount;
    }
}
