<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
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

<body>

    <!--================ Start Login Area =================-->
    
    <div class="login_container">
        <article class="half">
            <a href="index.html">컴퓨터 학원</a>
            <div class="tabs">
                <span class="tab signin active"><a href="#signin">Sign in</a></span>
                <span class="tab signup"><a href="#signup">Sign up</a></span>
            </div>
            <div class="content">
                <div class="signin-cont cont">
                    <form action="#" method="post" enctype="multipart/form-data">
                        <input type="email" name="email" id="email" class="inpt" required="required" placeholder="Your email"> 
                        <label for="email">Your email</label> 
                        <input type="password" name="password" id="password" class="inpt" required="required" placeholder="Your password"> 
                        <label for="password">Your password</label> 
                        <input type="checkbox" id="remember" class="checkbox" checked> 
                        <label for="remember">Remember me</label>
                        <div class="submit-wrap">
                            <input type="submit" value="Sign in" class="submit"> 
                            <a href="#" class="more">Forgot your password?</a>
                        </div>
                    </form>
                </div>
                <div class="signup-cont cont">
                    <form action="#" method="post" enctype="multipart/form-data">
                        <input type="text" name="email" id="name" class="inpt" required="required" placeholder="Your name"> 
                        <label for="name">Your name</label> 
                        <input type="email" name="email" id="email" class="inpt" required="required" placeholder="Your email"> 
                        <label for="email">Your email</label> 
                        <input type="text" name="email_more" id="email_more" class="inpt" required="required" placeholder="이메일 인증번호"> 
                        <label for="email">이메일 인증번호</label> 
                        <input type="password" name="password" id="password" class="inpt" required="required" placeholder="Your password">
                        <label for="password">Your password</label>
                        <input type="password" name="password_more" id="password_more" class="inpt" required="required" placeholder="패스워드 확인">
                        <label for="password_more">패스워드 확인</label>
                        <input type="text" name="address" id="address" class="inpt_02" required="required" placeholder="우편번호">
                        <label for="address">우편번호</label>
                        <input type="button" onclick="" value="우편번호 찾기" class="inpt_03"><br>
                        <input type="text" name="address_more" id="address_more" class="inpt" required="required" placeholder="상세주소">
                        <label for="address_more">상세주소</label>
                        <input type="text" name="phone" id="phone" class="inpt" required="required" placeholder="휴대폰 번호"> 
                        <label for="name">Your phone</label>
                        <input type="text" name="nickname" id="nickname" class="inpt_02" required="required" placeholder="닉네임"> 
                        <label for="nickname">닉네임</label> 
                        <input type="button" onclick="" value="중복체크" class="inpt_03"><br>
                        
                        
                        <div class="submit-wrap">
                            <input type="submit" value="Sign up" class="submit"> <a
                                href="#" class="more">Terms and conditions</a>
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
    </script>
    
    <!--================ End Login Area =================-->
</body>
</html>