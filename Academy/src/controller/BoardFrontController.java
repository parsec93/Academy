package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.BoardCommentProAction;
import action.BoardDeleteProAction;
import action.BoardViewAction;
import action.BoardListAction;
import action.BoardModifyFormAction;
import action.BoardModifyProAction;
import action.BoardReplyFormAction;
import action.BoardReplyProAction;
import action.BoardWriteProAction;
import vo.ActionForward;

@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        
  
        String command = request.getServletPath(); //서블릿 주소 가져오기
        
        Action action = null;
        ActionForward forward = null;
       

        if(command.equals("/BoardWriteForm.bo")) {
            forward = new ActionForward();
            forward.setPath("/board/board_write.jsp");
        } else if(command.equals("/BoardWritePro.bo")) {
            // Action 인터페이스를 구현한 XXXAction 클래스의 인스턴스를 생성하여
            // execute() 메서드를 호출하여 요청 작업을 처리한 후 ActionForward 객체 리턴받아야 한다.
            action = new BoardWriteProAction(); // Action 클래스 인스턴스 생성
            
            try {
                // Action 클래스의 execute() 메서드를 호출하여 request, response 객체 전달 후
                // 실행 결과에 해당 포워딩 정보를 ActionForward 객체로 리턴
                // => throws Exception 코드에 의해 try~catch 의무가 발생함!
                forward = action.execute(request, response);
                // => 포워딩 방식은 Action 클래스 내에서 결정하므로 아직 알 수 없다!
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/BoardList.bo")) {
            action = new BoardListAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/BoardComment.bo")) {
            action = new BoardCommentProAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/BoardView.bo")) {
            action = new BoardViewAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/BoardReplyForm.bo")) {
            action = new BoardReplyFormAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/BoardModifyForm.bo")) {
            action = new BoardModifyFormAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/BoardModifyPro.bo")) {
            action = new BoardModifyProAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/BoardReplyPro.bo")) {
            action = new BoardReplyProAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if(command.equals("/BoardDeleteForm.bo")) {
            forward = new ActionForward();
            forward.setPath("/board/qna_board_delete.jsp");
        } else if(command.equals("/BoardDeletePro.bo")) {
            action = new BoardDeleteProAction();
            
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        
        // if문에서 서블릿 주소 판별 후 요청 처리 뒤에 포워딩할 페이지를 ActionForward 객체로 생성했기 때문에
        // ActionForward 객체 내의 포워딩 방식에 따라 지정된 URL 로 각각 다른 방식의 포워딩이 필요함
        if(forward != null) { // 예외 발생 시를 제외한 나머지(ActionForward 객체가 null 이 아닐 때)
            
            // Redirect or Dispatcher 방식 판별
            if(forward.isRedirect()) { // Redirect 방식일 경우
                response.sendRedirect(forward.getPath()); // 지정된 주소로 리다이렉트 방식 포워딩
            } else { // Dispatcher 방식일 경우
                // request 객체로부터 Dispatcher 객체를 가져오기(매개변수로 포워딩 주소 전달)
                RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
                // Dispatcher 객체의 forward() 메서드 호출하여 포워딩(매개변수로 request, response 객체 전달)
                dispatcher.forward(request, response);
            }
            
        }
        
        
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }
    
}
















