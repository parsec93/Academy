package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.apply.ApplyAttendCheckAction;
import action.apply.ApplyBasketAction;
import action.apply.ApplyBasketListAction;
import action.apply.ApplyListAction;
import action.apply.ApplyMemberInfoAction;
import action.apply.ApplyReviewInsertAction;
import action.apply.ApplyBasketDeleteAction;
import action.apply.ApplyMemberListAction;
import action.apply.ListTeacherAction;
import action.apply.ReviewAction;
import vo.ActionForward;

@WebServlet("*.al")
public class applyFrontController extends HttpServlet{
	
	 protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	        request.setCharacterEncoding("UTF-8");
	        
	  
	        String command = request.getServletPath(); //서블릿 주소 가져오기
	        
	        Action action = null;
	        ActionForward forward = null;
	        
	        if(command.equals("/ApplyInfo.al")) {
	        	
	        	action = new ApplyListAction();
	        	
	        	try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

	        }else if(command.equals("/reviewInsert.al")) {
	        	
	        	action = new ApplyReviewInsertAction();
	        	try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

	       }else if(command.equals("/InfoTeacher.al")) {
	        	
	        	action = new ListTeacherAction();
	        	
	        	try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }else if(command.equals("/ApplyMemberList.al")) {
	        	
	        	action = new ApplyMemberListAction();
	        	
	        	try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }else if(command.equals("/ApplyAttendCheck.al")) {
	        	
	        	action = new ApplyAttendCheckAction();
	        	
	        	try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }else if(command.equals("/review.al")) {
	        	action  = new ReviewAction();
	        	try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}

	        }else if(command.equals("/basket.al")) {
		        action = new ApplyBasketAction();
		        try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		        
	        }else if(command.equals("/memberbasket.al")) {
		        action = new ApplyBasketListAction();
		        try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		        
	        }else if(command.equals("/mybasketlist.al")) {
	        	forward = new ActionForward();
	        	forward.setPath("/apply/applyBasket.jsp");
				
	        
	        }else if(command.equals("/basketDelete.al")) {
	        	 action = new ApplyBasketDeleteAction();
	 	        try {
	 				forward = action.execute(request, response);
	 			} catch (Exception e) {
	 				e.printStackTrace();
	 			}
	 	        
	        }else if(command.equals("/memberInfo.al")) {
	        	 action = new ApplyMemberInfoAction();
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
