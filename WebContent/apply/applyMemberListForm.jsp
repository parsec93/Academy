<%@page import="vo.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
	ArrayList<MemberBean> applyMemberList = (ArrayList<MemberBean>)request.getAttribute("applyMemberList");

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
<script type="text/javascript">

</script>
	
<body>

    <!--================ Start Login Area =================-->
    
    <div class="login_container">
        <article class="half">
            <a href="#">수강학생관리</a>
            <div class="tabs">
                <span class="tab signin active"><a href="#signin">수강학생목록</a></span>
            </div>
            <div class="content">
                <div class="signin-cont cont">

                        <table class="teacherwrap">
              <%if(applyMemberList == null) {%>
              <h1>수강한 학생이 없습니다</h1>
              <%}else{ %>
				
				<tr>
					<td>이름</td>
					<td>아이디</td>
					<td>전화번호</td>
					
				</tr>
					<%
					for(int i =0 ; i<applyMemberList.size(); i++){
						MemberBean memberBean = (MemberBean)applyMemberList.get(i);
						%>	
						<tr style="cursor:pointer;"  >
							<td class="code"><%=memberBean.getMember_name() %></td>
							<td class="code"><%=memberBean.getMember_id() %></td>
							<td class="phone"><%=memberBean.getMember_phone()%></td>
						</tr>
						<%
					}
					%>
				<%} %>

				</table>
  

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