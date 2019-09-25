<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 request.setCharacterEncoding("UTF-8");
 String cp = request.getContextPath();
 %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
    content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="icon" href="../img/favicon.png" type="image/png" />
<title>ID / 비밀번호 찾기</title>
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
    <div class="login_container">
        <article class="half">
            <a href="../index.jsp">edustage</a>
            <div class="tabs">
                 <span class="tab signin active"><a href="#signin">ID 찾기</a></span>
                <span class="tab signup"><a href="#signup">비밀번호 찾기</a></span>
            </div>
            <div class="content">
                <div class="signin-cont cont">
                    <form action="../FindId.me" method="post">
                        <input type="text" name="name" id="name" class="inpt" required="required" placeholder="Your Name"> 
                        <label for="id">Your Name</label> 
                        <input type="text" name="email1" id="email1" class="inpt_04" required="required" placeholder="Your email">
                       	<p class="emailtext">@</p>
                        <input type="text" name="email2" id="email2" class="inpt_05" required="required" placeholder="직접입력">
                        <div class="submit-wrap">
                            <input type="submit" value="ID 찾기" class="submit"> 
                        </div>
                    </form>
                </div>
                <div>
   <% 
//                  String id = (String)request.getAttribute("id");
                        		
//                          		if(id!=null){
//                         		 out.println(id);
//                         		}
                 %> 
</div>
                
                <div class="signup-cont cont">
                    <form action="../FindPass.me" method="post" >
                        <input type="text" name="id" id="id" class="inpt" required="required" placeholder="Your id"> 
                        <label for="id">Your id</label> 
                        <input type="text" name="phone" id="phone" class="inpt" required="required" placeholder="휴대폰 번호"> 
                        <label for="name">Your phone</label>
                        <input type="text" name="email1" id="email1" class="inpt_04" required="required" placeholder="Your email">
                       	<p class="emailtext">@</p>
                        <input type="text" name="email2" id="email2" class="inpt_05" required="required" placeholder="직접입력">
                        <div class="submit-wrap">
                            <input type="submit" value="비밀번호 찾기" class="submit"> 
                        </div>
                    </form>
                </div>
                <div>
                
 <% 
//                  String pass = (String)request.getAttribute("pass");
                        		
//                          		if(pass!=null){
//                         		 out.println(pass);
//                         		}
                 %> 
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
    </script>
    

</body>
</html>