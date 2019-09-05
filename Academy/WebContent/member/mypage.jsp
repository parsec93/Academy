<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sId = (String)session.getAttribute("sId");
if(sId==null){
	out.println("<script>");
	out.println("alert('로그인필요!')");
	out.println("location.href='index.jsp'");
	out.println("</script>");
}
MemberBean memberBean = (MemberBean)request.getAttribute("memberBean");
// out.println(memberBean.getMember_name());
request.setCharacterEncoding("utf-8");
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
<link rel="stylesheet" href="css/login.css" />
<link rel="stylesheet" href="css/style.css" />
</head>
<script>
function mySubmit(index) {
	if (index == 1) {
	document.myForm.action='member/updateForm.jsp';
	}
	if (index == 2) {
	document.myForm.action='member/updatePassword.jsp';
	}
	document.myForm.submit();
}
</script>

<body>

    <!--================ Start Login Area =================-->
    
    <div class="login_container">
        <article class="half">
            <a href="index.jsp">컴퓨터 학원</a>
            <div class="content">
   
                    <form name='myForm' method="post">
                       
						
                        <label for="name">Your name : </label> <%=memberBean.getMember_name() %> <br>
                        <input type="hidden" name="name" id="name" class="inpt" value="<%=memberBean.getMember_name() %>" required="required" placeholder="Your name"> 
                        
                        <label for="id">Your Id : </label> <%=sId %><br>
                        <input type="hidden" name="id" id="id" class="inpt_02" value="<%=sId %>" required="required" placeholder="Your id"> 
                        
                        <input type="hidden" name="password" id="password" class="inpt" value="<%=memberBean.getMember_pass() %>" required="required" placeholder="Your password">
                 
                        <label for="email">Your email : </label><%=memberBean.getMember_email() %><br>
                        <input type="hidden" name="email" id="email" class="inpt_04" value="<%=memberBean.getMember_email() %>" required="required" placeholder="Your email">
                        
                    
                        <label for="address">우편번호 : </label> <%=memberBean.getMember_postcode() %><br> 
                        <input type="hidden" name="postcode" id="postcode" class="inpt_02" value="<%=memberBean.getMember_postcode() %>" required="required" placeholder="우편번호">
                        
                        <label for="address_more1">상세주소 : </label><%=memberBean.getMember_add1() %><%=memberBean.getMember_add2() %><br>
                        
                        <input type="hidden" name="add1" id="address_more1" class="inpt" value="<%=memberBean.getMember_add1() %>" required="required" placeholder="상세주소">
                        <input type="hidden" name="add2" id="address_more2" class="inpt" value="<%=memberBean.getMember_add2() %>" required="required" placeholder="상세주소">
                        
                        <label for="name">Your phone : </label><%=memberBean.getMember_phone() %><br>
                        <input type="hidden" name="phone" id="phone" class="inpt" value="<%=memberBean.getMember_phone() %>" required="required" placeholder="휴대폰 번호"> 
                        
                
                        <div class="submit-wrap">
								<input type='button' value="회원 수정" onClick='mySubmit(1)'>
								<input type='button' value="비밀번호 수정" onClick='mySubmit(2)'>
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