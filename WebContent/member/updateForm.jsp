<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sId = (String)session.getAttribute("sId");
request.setCharacterEncoding("utf-8");
String email =request.getParameter("email");
String[] arrayEamil = email.split("@");
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
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
	<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
// 					jQuery("#postcode1").val(data.postcode1);
// 					jQuery("#postcode2").val(data.postcode2);
					jQuery("#postcode").val(data.zonecode);
					jQuery("#address_more1").val(data.address);
					jQuery("#address_more2").focus();
					console.log(data);
				}
			}).open();
		}
	</script>

<body>

    <!--================ Start Login Area =================-->
    
    <div class="login_container">
        <article class="half">
            <a href="index.jsp">컴퓨터 학원</a>
            <div class="content">

                    <form action="../UpdatePro.me" method="post" >
                        <label for="name">Your name</label> 
                        <input type="text" name="name" id="name" class="inpt" value="<%=request.getParameter("name") %>" required="required" placeholder="Your name"> 
                        
                        <label for="id">Your Id</label>
                        <input type="text" name="id" id="id" class="inpt_02" value="<%=sId %>" readonly="readonly" required="required" placeholder="Your id"> 
                        
                        <label for="password">Your password</label>
                        <input type="password" name="password" id="password" class="inpt" required="required" placeholder="Your password">
                        
                        <label for="email">Your email</label>
                        <input type="text" name="email1" id="email1" value="<%=arrayEamil[0] %>" class="inpt_04" required="required" placeholder="Your email">
                        &nbsp;@&nbsp;
                        <input type="text" name="email2" id="email2" value="<%=arrayEamil[1] %>" class="inpt_04" required="required" placeholder="직접입력">
                        &nbsp;
                        <input type="text" name="postcode" id="postcode" value="<%=request.getParameter("postcode") %>" class="inpt_02" required="required" placeholder="우편번호">
                        <label for="address">우편번호</label>
                        <input type="button" value="우편번호 찾기" class="inpt_03" onClick="openDaumZipAddress();"><br>
                        <input type="text" name="add1" id="address_more1" value="<%=request.getParameter("add1") %>" class="inpt" required="required" placeholder="주소1">
                        <label for="address_more">주소1</label>
                        <input type="text" name="add2" id="address_more2" value="<%=request.getParameter("add2") %>" class="inpt" required="required" placeholder="상세주소2">
                        <label for="address_more">상세주소2</label>
                    
                        <label for="name">Your phone</label>
                        <input type="text" name="phone" id="phone" class="inpt" value="<%=request.getParameter("phone") %>" required="required" placeholder="휴대폰 번호"> 
                        
                        
                        
                        
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