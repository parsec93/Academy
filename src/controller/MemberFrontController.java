package controller;

import java.io.IOException;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.board.BoardViewAction;
import action.member.MemberBasketAction;
import action.member.MemberBasketListAction;
import action.member.FindIdAction;
import action.member.FindPassAction;
import action.member.LoginProAction;
import action.member.LogoutProAction;
import action.member.MemberCheckProAction;
import action.member.MemberDelete;
import action.member.MemberJoinProAction;
import action.member.MemberListAction;
import action.member.TeacherDeleteAction;
import action.member.TeacherListAction;
import action.member.TeacherViewAction;
import action.member.infoProAction;
import action.member.updatePasswordProAction;
import action.member.updateProAction;
import vo.ActionForward;

@WebServlet("*.me")
public class MemberFrontController extends HttpServlet {
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // 한글 설정
        
        // 서블릿 주소 가져오기
        String command = request.getServletPath();
        
        Action action = null;
        ActionForward forward = null;
        
        if(command.equals("/MemberLoginForm.me")) {
            // member 폴더의 loginForm.jsp 페이지로 이동
            forward = new ActionForward();
            forward.setPath("/member/loginForm.jsp");
        }else if(command.equals("/emailCheck.me")) {
            forward = new ActionForward();
            forward.setPath("/member/emailCheck.jsp");
        }else if(command.equals("/MemberJoinPro.me")) {
        	
			action = new MemberJoinProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/MemberCheckPro.me")) {
			action = new MemberCheckProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/LoginPro.me")) {

        	action = new LoginProAction();

        	try {
				forward =action.execute(request, response);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }else if(command.equals("/LogoutPro.me")) {
        	System.out.println("/LogoutPro.me");
        	action = new LogoutProAction();
        	
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }else if(command.equals("/InfoPro.me")){
        	System.out.println("/InfoPro.me");
        	action = new infoProAction();
        	
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
        }else if(command.equals("/UpdatePro.me")) {
        	action = new updateProAction();
        	
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }else if(command.equals("/UpdatePassword.me")) {
        	action = new updatePasswordProAction();
        	
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }else if(command.equals("/TeacherList.me")) {
        	String member_isMember = "1";
        	request.setAttribute("member_isMember", member_isMember);       	
        	action = new TeacherListAction();
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }else if(command.equals("/TeacherView.me")) {
            action = new TeacherViewAction();    
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(command.equals("/TeacherDelete.me")) {
        	action = new TeacherDeleteAction();
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }else if(command.equals("/TeacherUpdate.me")) {
        	forward = new ActionForward();
        	forward.setPath("/admin/teacherUpdate.jsp");
        }else if(command.equals("/Member.me")) {
        	System.out.println("member.me FrontController");
        	action = new MemberListAction();
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }else if(command.equals("/FindId.me")) {
        action = new FindIdAction();
        try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			}
        }else if(command.equals("/basket.me")) {
	        action = new MemberBasketAction();
	        try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	        
        }else if(command.equals("/memberbasket.me")) {
	        action = new MemberBasketListAction();
	        try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
        
        }else if(command.equals("/mybasketlist.me")) {
        	forward = new ActionForward();
        	forward.setPath("/member/memberBasket.jsp");
			
        
        }else if(command.equals("/FindPass.me")) {
        	action = new FindPassAction();
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }else if(command.equals("/find.me")){
        	forward = new ActionForward();
        	forward.setPath("/member/findId_Pass.jsp");
        }else if(command.equals("/Delete.me")) {
        	action = new MemberDelete();
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }

        
        
        
        // 포워딩 처리
        if(forward != null) {
            // ActionForward 객체의 isRedirect() 메서드가 true 이면 Redirect 방식으로 포워딩
            //                        ""                  false 이면 Dispatcher 방식으로 포워딩
            if(forward.isRedirect()) {
                System.out.println("forward.isRedirect()");
                response.sendRedirect(forward.getPath());
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
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
