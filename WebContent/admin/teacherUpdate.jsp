<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
 request.setCharacterEncoding("utf-8");
String sId = (String)session.getAttribute("sId");
String jumin = request.getParameter("jumin");
String jumin1 = jumin.substring(0,6);
String jumin2 = jumin.substring(6);

String email =request.getParameter("email");
String[] arrayEamil = email.split("@");

String opicture = request.getParameter("picture");
%>
<!-- Required meta tags -->
<meta charset="utf-8" />
    <meta   name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="icon" href="img/favicon.png" type="image/png" />
<title>Teacher 수정</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/flaticon.css" />
    <link rel="stylesheet" href="css/themify-icons.css" />
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
    <!-- login css -->
<link rel="stylesheet" href="../css/login.css" />
<link rel="stylesheet" href="../css/style.css" />
</head>
<script src="js/jquery-3.4.1.js"></script>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function passCheck(val){
	pass2 = document.up.password_more.value;   
    if(val.length <4){
        document.getElementById('result').value = "쉬움";
        document.getElementById('result').style.color="red";
    }else if(val.length<8){
        document.getElementById('result').value = "보통";
        document.getElementById('result').style.color="orange";
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

	//패스워드 유효성
	if(pass1.length<8){
		alert("비밀번호는 8자이상입니다.");
    	document.up.password.focus();
        return false;
    }
	//패스워드2 확인
	if(pass1!=pass2){
		alert("비밀번호가 다릅니다.");
		 document.up.password_more.focus();
        return false;
	 }


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
	
<body>

    <!--================ Start Login Area =================-->
    
    <div class="login_container">
        <article class="half">
            <a href="../index.jsp">컴퓨터 학원</a>
            <div class="tabs">
                <span class="tab signin active">교사계정수정</span>
            </div>
            <div class="content">
                <div class="signin-cont cont">
                    <form action="../UpdatePro.me?member_idx=<%=request.getParameter("member_idx")%>" method="post" name="up" method="post" enctype="multipart/form-data" >
                  		<input type="hidden" name="member_isMember" value="1"/>
                  		<input type="hidden" name="opicture" value="<%=opicture%>"/>
                        
                        <input type="text" name="name" id="name" class="inpt" value="<%=request.getParameter("name") %>" required="required" placeholder="Your name"> 
                        
                       
                        <input type="text" name="id" id="id" class="inpt_02" value="<%=request.getParameter("id")%>" readonly="readonly" required="required" placeholder="Your id"> 
                        
                        
                        <input type="password" name="password" id="password" class="inpt"  value="<%=request.getParameter("password")%>" readonly="readonly"  required="required" placeholder="Your password">

                        <div style="clear:both;">    
                        <input type="text" name="jumin1" id="jumin1" class="inpt_04" required="required" value="<%=jumin1 %>" readonly="readonly">
                        <p class="emailtext">-</p>
                        <input type="text" name="jumin2" id="jumin2" class="inpt_05" required="required" value="<%=jumin2%>" readonly="readonly">
                    
                        </div>
                        

                       
                       <div style="clear:both;">
                        <input type="text" name="email1" id="email1" value="<%=arrayEamil[0] %>" class="inpt_04" required="required" placeholder="Your email">
                        <p class="emailtext">@</p>
                        <input type="text" name="email2" id="email2" value="<%=arrayEamil[1] %>" class="inpt_05" required="required" placeholder="직접입력">
                       </div>
                        <input type="text" name="postcode" id="postcode" value="<%=request.getParameter("postcode") %>" class="inpt_02" required="required" placeholder="우편번호">
                        <label for="address">우편번호</label>
                        <input type="button" value="우편번호 찾기" class="inpt_03" onClick="openDaumZipAddress();"><br>
                        <input type="text" name="add1" id="address_more1" value="<%=request.getParameter("add1") %>" class="inpt" required="required" placeholder="주소1">
                        <label for="address_more">주소1</label>
                        <input type="text" name="add2" id="address_more2" value="<%=request.getParameter("add2") %>" class="inpt" required="required" placeholder="상세주소2">
                        <label for="address_more">상세주소2</label>
                    
                        <label for="name">Your phone</label>
                        <input type="text" name="phone" id="phone" class="inpt" value="<%=request.getParameter("phone") %>" required="required" placeholder="휴대폰 번호">   
             			<div>
             			<select style="float: left;"name="bank" id="bank" >
             			<option value="0" <%if(request.getParameter("bank").equals("0")){%> selected="selected"<%} %>>은행명</option>
             			<option value="1" <%if(request.getParameter("bank").equals("1")){%> selected="selected"<%} %>>부산은행</option> <option value="2" <%if(request.getParameter("bank").equals( "2")){%> selected="selected"<%} %>>국민은행</option>
             			<option value="3" <%if(request.getParameter("bank").equals("3")){%> selected="selected"<%} %>>우리은행</option> <option value="4" <%if(request.getParameter("bank").equals("4")){%> selected="selected"<%} %>>하나은행</option> 
             			<option value="5" <%if(request.getParameter("bank").equals("5")){%> selected="selected"<%} %>>농협</option>
             			</select>
             			
             			<input type="text"  draggable="false"  name="accno" id="accno" class="inpt_02" required="required" value="<%=request.getParameter("accno") %>" placeholder="계좌번호 (숫자만 입력)" 
             			onKeyup="accnoCheck(this.value)">
             			<label for="text">계좌번호</label>
             			</div>
             			<img alt="증명사진" src="../memberUpload/<%=opicture%>" width="250" height="300"><%=opicture%>
             			<input type="file" name="picture" id="picture" class="inpt"  placeholder="증명사진"> 
                        <label for="file">Image</label>
						
             				
                        <div class="submit-wrap">
                            <input type="submit" value="수정 완료" class="submit"> 
                        </div>
                    </form>
                </div>
            </div>
        </article>
        <div class="half bg"></div>
    </div>

    
    <!--================ End Login Area =================-->
</body>
</html>