<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sId = (String)session.getAttribute("sId");
request.setCharacterEncoding("utf-8");
MemberBean memberBean = (MemberBean)request.getAttribute("memberBean");

%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
    content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="icon" href="../img/favicon.png" type="image/png" />
<title>login</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.css" />
<link rel="stylesheet" href="../css/flaticon.css" />
<link rel="stylesheet" href="../css/themify-icons.css" />
<link rel="stylesheet" href="../vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet" href="../vendors/nice-select/css/nice-select.css" />
<!-- main css -->
<link rel="stylesheet" href="../css/login.css" />
<link rel="stylesheet" href="../css/style.css" />
</head>
    <script type="text/javascript">
        function tocheckpw2() {
        	var password1 = document.getElementById("password1").value;
        	var password = document.getElementById("password").value;
            var newPassword1 = document.getElementById("newPassword1").value;
            var newPassword2 = document.getElementById("newPassword2").value;
			
			if(password == password1){
				
            if (newPassword1 != newPassword2) {
            	alert('비밀번호가 일치하지 않습니다');
            	return false;
            }else{
            	alert('비밀번호 변경 성공');
            }
			}else{
				alert('기존비밀번호를 확인하세요!');
				alert(password);
				alert(password1);
				return false;
			}
        }
    </script>


<body>

    <!--================ Start Login Area =================-->
    
    <div class="login_container">
        <article class="half">
            <a href="index.jsp">컴퓨터 학원</a>
            <div class="content">

                    <form action="../UpdatePassword.me" method="post" onsubmit="return tocheckpw2()">

                        <input type="password" name="password" id="password1" class="inpt" required="required" placeholder="현재 비밀번호">
                        <label for="password">Your password</label>
                        <input type="hidden" id="password" value="<%=memberBean.getMember_pass() %>">
                        
                        <input type="password" name="newPassword1" id="newPassword1" class="inpt" required="required" placeholder="새로운 비밀번호">
                        <label for="new password1">new password</label>
                        
                        <input type="password" name="newPassword2" id="newPassword2" class="inpt" required="required" placeholder="새로운 비밀번호 확인">
                        <label for="new password2">new password check</label>
                        

   
                        
                        <div class="submit-wrap">
                            <input type="submit" value="Sign up" class="submit"> <a
                                href="#" class="more">Terms and conditions</a>
                        </div>
                    </form>

            </div>
        </article>
        <div class="half bg"></div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript">
        $('.tabs .tab').click(function() {
            if ($(this).hasClass('signin')) {
                $('.tabs .tab').removeClass('active');
                $(this).addClass('active');
                $('.cont').hide();
                $('.signin-cont').show();
            }
            if ($(this).hasClass('signup')) {
                $('.tabs .tab').removeClass('active');
                $(this).addClass('active');
                $('.cont').hide();
                $('.signup-cont').show();
            }
        });
        $('.container .bg').mousemove(
                function(e) {
                    var amountMovedX = (e.pageX * -1 / 30);
                    var amountMovedY = (e.pageY * -1 / 9);
                    $(this).css('background-position',
                            amountMovedX + 'px ' + amountMovedY + 'px');
                });
    </script>
    
    <!--================ End Login Area =================-->
</body>
</html>