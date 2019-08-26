<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sId = (String)session.getAttribute("sId");
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
<link rel="stylesheet" href="../css/login.css" />
<link rel="stylesheet" href="../css/style.css" />
</head>

<body>

    <!--================ Start Login Area =================-->
    
    <div class="login_container">
        <article class="half">
            <a href="index.jsp">컴퓨터 학원</a>
            <div class="content">

                    <form action="../UpdatePro.me" method="post" >
                        <input type="text" name="name" id="name" class="inpt" value="<%=request.getParameter("name") %>" required="required" placeholder="Your name"> 
                        <label for="name">Your name</label> 
                        
                        <input type="text" name="id" id="id" class="inpt_02" value="<%=sId %>" required="required" placeholder="Your id"> 
                        <label for="id">Your Id</label>
                        
                        <input type="password" name="password" id="password" class="inpt" required="required" placeholder="Your password">
                        <label for="password">Your password</label>
                        
                        <input type="email" name="email" id="email" class="inpt_04" value="<%=request.getParameter("email") %>" required="required" placeholder="Your email">
                     
                        <label for="email">Your email</label>
                        
                    
                        <input type="text" name="address" id="address" class="inpt_02" value="<%=request.getParameter("address") %>" required="required" placeholder="우편번호">
                        <label for="address">우편번호</label><br>
                        <input type="text" name="address_more1" id="address_more1" class="inpt" value="<%=request.getParameter("address_more1") %>" required="required" placeholder="상세주소">
                        <label for="address_more1">상세주소</label>
                        <input type="text" name="address_more2" id="address_more2" class="inpt" value="<%=request.getParameter("address_more2") %>" required="required" placeholder="상세주소">
                        
                        <input type="text" name="phone" id="phone" class="inpt" value="<%=request.getParameter("phone") %>" required="required" placeholder="휴대폰 번호"> 
                        <label for="name">Your phone</label>
                        
                        
                        
                        
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