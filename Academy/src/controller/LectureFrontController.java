package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.board.BoardCommentProAction;
import action.board.BoardDeleteProAction;
import action.board.BoardListAction;
import action.board.BoardModifyFormAction;
import action.board.BoardModifyProAction;
import action.board.BoardReplyFormAction;
import action.board.BoardReplyProAction;
import action.board.BoardViewAction;
import action.board.BoardWriteProAction;
import action.lecture.LectureDetailAction;
import action.lecture.LectureListeAction;
import action.lecture.LectureUpdateFormAction;
import action.lecture.LectureUpdateProAction;
import vo.ActionForward;

@WebServlet("*.le")
public class LectureFrontController extends HttpServlet {
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        
  
        String command = request.getServletPath(); //서블릿 주소 가져오기
        
        Action action = null;
        ActionForward forward = null;
       

        if(command.equals("/lectureList.le")) {
        	
        	action = new LectureListeAction();
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

        }else if(command.equals("/lectureDetail.le")) {
        	
        	action = new LectureDetailAction();
        	
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }else if(command.equals("/lectureUpdateForm.le")) {
        	action = new LectureUpdateFormAction();
        	
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
        }else if(command.equals("/lectureUpdate.le")) {
        	
        	action = new LectureUpdateProAction();
        	
        	try {
				forward =action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
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





