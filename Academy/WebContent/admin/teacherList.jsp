<%@page import="vo.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
ArrayList<MemberBean> teacherList = (ArrayList<MemberBean>)request.getAttribute("teacherList");

%>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
    content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="icon" href="img/favicon.png" type="image/png" />
<title>login</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/flaticon.css" />
<link rel="stylesheet" href="css/themify-icons.css" />
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
<!-- main css -->
<link rel="stylesheet" href="css/login.css" />
<link rel="stylesheet" href="css/style.css" />
</head>
<script src="js/jquery-3.4.1.js"></script>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<body>

    <!--================ Start Login Area =================-->
    
    <div class="login_container">
        <article class="half">
            <a href="index.jsp">교사 관리</a>
            <div class="tabs">
                <span class="tab signin active"><a href="#signin">교사 목록</a></span>
                <span class="tab signup"><a href="#signup">교사 등록</a></span>
            </div>
            <div class="content">
                <div class="signin-cont cont">
                    <form action="../LoginPro.me" method="post" >
                        <table>
              <%if(teacherList == null) {%>
              <h1>등록된 선생님이 없습니다</h1>
              <%}else{ %>
				
				<tr>
					<td>교사코드</td>
					<td>이름</td>
					<td>전화번호</td>
					
					
				</tr>
				
					<%
					for(int i =0 ; i<teacherList.size(); i++){
						MemberBean memberBean = (MemberBean)teacherList.get(i);
						%>	
						<tr style="cursor:pointer;" onclick="location.href='TeacherView.me?member_teacher_code=<%=memberBean.getMember_teacher_code()%>'" >
							<td class="code"><%=memberBean.getMember_teacher_code() %></td>
							<td class="name"><%=memberBean.getMember_name() %></td>
							<td class="phone"><%=memberBean.getMember_phone()%></td>
						</tr>
						<%
					}
					%>
				<%} %>

				</table>
                        <div class="submit-wrap">
                            <input type="submit" value="Sign in" class="submit"> 
                        </div>
                    </form>
                </div>
                <div class="signup-cont cont">
                    <form action="../MemberJoinPro.me" name="up" method="post" onsubmit="return joinCheck()">
                    	<input type="hidden" name="member_isMember" value="1"/> 
                        <input type="text" name="name" id="name" class="inpt" required="required" placeholder="Your name"> 
                        <label for="name">Your name</label> 
                        
                        <input type="text" name="id" id="id" class="inpt_02" required="required" placeholder="Your id" onkeydown="inputIdCheck()"> 
                        <label for="id">Your Id</label>
                        <input type="button" value="중복확인" class="inpt_03" onClick="idCheck()"><br>
                        <input type="hidden" name="idCheckValue" value="idUncheck"> 
                        <input type="password" name="password" id="password" class="inpt" required="required" placeholder="Your password" onkeyup="passCheck(this.value)">
                        <output id="result"></output>
                        <label for="password">Your password</label>
                        <input type="password" name="password_more" id="password_more" class="inpt" required="required" placeholder="패스워드 확인" onkeyup="passCheck2(this.value)">
                        <output id="result2"></output>
                        <label for="password_more">패스워드 확인</label>
                        
                        <input type="text" name="email1" id="email1" class="inpt_04" required="required" placeholder="Your email">
                        &nbsp;@&nbsp;
                        <input type="text" name="email2" id="email2" class="inpt_04" required="required" placeholder="직접입력">
                        &nbsp;
                        
<!-- 						<select class="inpt_05" onChange="SelectValue(this)"> -->
<!-- 							<option value="">직접입력</option> -->
<!-- 							<option value="naver.com">naver.com</option> -->
<!-- 							<option value="nate.com">nate.com</option> -->
<!-- 							<option value="itwill.co.kr">itwillbs.co.kr</option> -->
<!-- 						</select> -->
                        <input type="text" name="email_more" id="email_more" class="inpt_02" required="required" >
                        <input type="button" value="인증번호 발송" id="emailCheck" class="inpt_03" ><br>
                        <input type="hidden" id="rNum" name="rNum">
                        <input type="text" name="postcode" id="postcode" class="inpt_02" required="required" placeholder="우편번호">
                        <label for="address">우편번호</label>
                        <input type="button" value="우편번호 찾기" class="inpt_03" onClick="openDaumZipAddress();"><br>
                        <input type="text" name="add1" id="address_more1" class="inpt" required="required" placeholder="주소1">
                        <label for="address_more">주소1</label>
                        <input type="text" name="add2" id="address_more2" class="inpt" required="required" placeholder="상세주소2">
                        <label for="address_more">상세주소2</label>
                        <input type="text" name="phone" id="phone" class="inpt" required="required" placeholder="휴대폰 번호"> 
                        <label for="name">Your phone</label>
             
                        <div class="submit-wrap">
                            <input type="submit" value="Sign up" class="submit"> 
                            <a href="#" class="more">Terms and conditions</a>
                        </div>
                    </form>
                </div>
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
        //=======아이디 중복체크 ========
        
    </script>
    
    <!--================ End Login Area =================-->
</body>
</html>