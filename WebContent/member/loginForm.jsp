<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
$(document).ready(function(){
	
	$('#emailCheck').click(function(){
		var email1 = document.up.email1.value;
		var email2 = document.up.email2.value;
		if(email1==""){
	  		alert("이메일을 입력하세요");
	  		document.up.email1.focus();
	  		return;
	  	}else if(email2==""){
	  		alert("이메일을 입력하세요");
	  		document.up.email2.focus();
	  		return;
	  	}
		$.ajax('../emailCheck.me',{
			data:{email1:$('#email1').val(), email2:$('#email2').val()},
			success : function(data) {
 			document.getElementById('rNum').value = data;
			}
		});
		alert("인증번호 발송 완료");
	});
});
function idCheck() {
  	 id=document.up.id.value;
  	if(id==""){
  		alert("아이디를 입력하세요");
  		document.up.id.focus();
  		return;
  	}else{
  		window.open("idCheck.jsp?id="+id+"&check=2","","width=400,height=200");	
  	}
  }
//아이디 새로입력할때 마다 check초기화
function inputIdCheck() {
	document.up.idCheckValue.value="idUnCheck";
}
function passCheck(val){
	pass2 = document.up.password_more.value;   
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
 pass1 = document.up.password.value;
 
 if(pass1!=pass2){
	 document.getElementById('result2').value = "비밀번호 불일치";
     document.getElementById('result2').style.color="red";
 }else{
	 document.getElementById('result2').value = "비밀번호 일치";
    document.getElementById('result2').style.color="green";
 }
}
function joinCheck() {
	pass1=document.up.password.value; 
	pass2 = document.up.password_more.value;
	icv = document.up.idCheckValue.value;
	//패스워드 유효성(길이 확인)
	if(pass1.length<8){
		alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&* 만 허용)를 혼용하여 8자 이상 입력해주세요.");
    	document.up.password.focus();
        return false;
    }
	//패스워드 유효성(영문 + 숫자 + 특수문자 모두 섞어서 사용할 것)
	if(!pass1.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*])|([!,@,#,$,%,^,&,*].*[a-zA-Z0-9])/)) { 
        alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8자 이상 입력해주세요.");
        return false;
    }
	//패스워드2 확인 
	if(pass1!=pass2){
		alert("비밀번호가 다릅니다.");
		 document.up.password_more.focus();
        return false;
	 }
	if(icv != "idCheck"){
		alert("중복확인이 필요합니다.");
		return false;
	}
	//인증번호 확인
// 	email_more = document.up.email_more.value;
// 	rNum = document.up.rNum.value;
	
// 	if(Number(rNum) != Number(email_more)){
// 		alert("이메일 인증번호가 일치하지 않습니다");
// 		return false;
// 	}
}

</script>
<!--  우편번호 -->
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
	<!-- 아이디 저장 -->
<script type="text/javascript">
	$(document).ready(function(){
		
		var userInputId = getCookie("userInputId");
		$("input[name='idlg']").val(userInputId);

	if($("input[name='idlg']").val() != ""){
		$("#remember").attr("checked", true);
	}
	$("#remember").change(function () {
		if($("#remember").is(":checked")){
			var userInputId = $("input[name='idlg']").val();
			setCookie("userInputId",userInputId,7);
		}else{
			deleteCookie("userInputId");
		}
	});
	$("input[name='idlg']").keyup(function(){
		if($("#remember").is(":checked")){
			var userInputId = $("input[name='idlg']").val();
			setCookie("userInputId", userInputId,7);
		}
	});
});
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;

	}

	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();

	}

	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
// 	teacher 식별 코드

	function loginCheck() {

		if($("#check_YN").is(":checked")){
			document.getElementById('tYN').value = "1";
		}else{
			document.getElementById('tYN').value = "0";
		}
		
		return true;
	}		

	
</script>
	
<body>

    <!--================ Start Login Area =================-->
    
    <div class="login_container">
        <article class="half">
            <a href="../index.jsp">edustage</a>
            <div class="tabs">
                <span class="tab signin active"><a href="#signin">Sign in</a></span>
                <span class="tab signup"><a href="#signup">Sign up</a></span>
            </div>
            <div class="content">
                <div class="signin-cont cont">
                    <form action="../LoginPro.me" method="post" name="login" onsubmit="return loginCheck()">
                        <input type="text" name="idlg" id="idlg" class="inpt" required="required" placeholder="Your id"> 
                        <label for="id">Your id</label> 
                        <input type="password" name="password" id="password" class="inpt" required="required" placeholder="Your password"> 
                        <label for="password">Your password</label> 
                        <input type="checkbox" id="remember" class="checkbox" > 
                        <label for="remember">Remember me</label>
                        <input type="checkbox" id="check_YN" class="checkbox1" name="check_YN" > 
                        <input type="hidden" id="tYN" name="tYN">
                        <label for="remember">Teacher</label>
                        <div class="submit-wrap">
                            <input type="submit" value="Sign in" class="submit"> 
                            <a href="findId_Pass.jsp" class="more">ID/PASSWORD 찾기</a>
                        </div>
                    </form>
                </div>
                <div class="signup-cont cont">
                    <form action="../MemberJoinPro.me" name="up" enctype="multipart/form-data" method="post" onsubmit="return joinCheck()">
                    	<input type="hidden" name="member_isMember" value="0"/> 
                        <input type="text" name="name" id="name" class="inpt" required="required" placeholder="Your name"> 
                        <label for="name">Your name</label> 
                        
                        <input type="text" name="id" id="id" class="inpt_02" required="required" placeholder="Your id" onkeydown="inputIdCheck()"> 
                        <label for="id">Your Id</label>
                        <input type="button" value="중복확인" class="inpt_03" onClick="idCheck()">
                        <input type="hidden" name="idCheckValue" value="idUncheck"> 
                        <input type="password" name="password" id="password" class="inpt" required="required" placeholder="Your password" onkeyup="passCheck(this.value)">
                        <output id="result"></output>
                        
                        <label for="password">Your password</label>
                        <input type="password" name="password_more" id="password_more" class="inpt" required="required" placeholder="패스워드 확인" onkeyup="passCheck2(this.value)">
                        <output id="result2"></output>
                        <label for="password_more">패스워드 확인</label>
                        
                        <input type="text" name="email1" id="email1" class="inpt_04" required="required" placeholder="Your email">
                       	<p class="emailtext">@</p>
                        <input type="text" name="email2" id="email2" class="inpt_05" required="required" placeholder="직접입력">
                        
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