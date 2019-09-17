<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sId = (String)session.getAttribute("sId");
request.setCharacterEncoding("utf-8");

String password = request.getParameter("password");

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
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">

function passCheck(val){
	var pass2 = document.up.newPassword2.value;   
    if(val.length <4){
        document.getElementById('result').value = "비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&* 만 허용)를 혼용하여 8자 이상 입력해주세요";
        document.getElementById('result').style.color="red";
    }else if(val.length<8){
        document.getElementById('result').value = "8자 이상 입력하세요";
        document.getElementById('result').style.color="orange";
    }else if(!val.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*])|([!,@,#,$,%,^,&,*].*[a-zA-Z0-9])/)){
    	document.getElementById('result').value = "비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8자 이상 입력해주세요.";
    	document.getElementById('result').style.color="red";
    }else {
    	document.getElementById('result').value = "어려움";
    	document.getElementById('result').style.color="green";
    }
    passCheck2(pass2)
}
function passCheck2(pass2) {
 var pass1 = document.up.newPassword1.value;
 
 if(pass1!=pass2){
	 document.getElementById('result2').value = "비밀번호 불일치";
     document.getElementById('result2').style.color="red";
 }else{
	 document.getElementById('result2').value = "비밀번호 일치";
    document.getElementById('result2').style.color="green";
 }
}
        function tocheckpw2() {
        	var pw1 = document.getElementById("password1").value;
        	var pw = document.getElementById("password").value;

			
			if(pw == pw1){
            	alert('비밀번호 변경 성공');
			}else{
				alert('기존비밀번호를 확인하세요!');
				return false;
			}
        }
</script>
	
<body>

    <!--================ Start Login Area =================-->
    
    <div class="login_container">
        <article class="half">
            <a href="../index.jsp">edustage</a>
            <div class="content">

                      <form action="../UpdatePassword.me" method="post" name ="up" onsubmit="return tocheckpw2()">

                        <input type="password" name="password1" id="password1" class="inpt" required="required" placeholder="현재 비밀번호">
                        
                        <input type="hidden" name="password" id="password" class="inpt" value="<%=password %>" >

                        <input type="password" name="newPassword1" id="newPassword1" class="inpt" required="required" placeholder="새로운 비밀번호" onkeyup="passCheck(this.value)">
                        <output id="result"></output>
                        <label for="newPassword1">Your password</label>
                        
                        <input type="password" name="newPassword2" id="newPassword2" class="inpt" required="required" placeholder="새로운 비밀번호 확인" onkeyup="passCheck2(this.value)">
                        <output id="result2"></output>
                        <label for="newPassword2">Your password</label>

                        
                        <div class="submit-wrap">
                            <input type="submit" value="Sign up" class="submit"> 
                            <a href="#" class="more">Terms and conditions</a>
                        </div>
                    </form>

            </div>
        </article>
        <div class="half bg"></div>
    </div>

 
    <!--================ End Login Area =================-->
</body>
</html>