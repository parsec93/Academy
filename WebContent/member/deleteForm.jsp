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

<%
request.setCharacterEncoding("utf-8");
String member_idx=request.getParameter("member_idx");
String sId = (String)session.getAttribute("sId");
%>
</head>	
<script type="text/javascript">
function back(){
	window.close();
}
</script>
<body>

    <!--================ Start Login Area =================-->

            <h1>회원 탈퇴하시겠습니까?</h1>
                    <form action="../Delete.me?member_idx=<%=member_idx %>" method="post" >
                      <label for="id">id</label> 
                      <input type="text" name="id" id="id" class="inpt" required="required" placeholder="Your id" value="<%=sId%>"> 
                      <br>
                      <label for="password">name</label> 
                      <input type="password" name="pass" id="pass" class="inpt" required="required" placeholder="Your Password"> 
						
                        <div class="submit-wrap">
                            <input type="submit" value="계정 삭제" class="btn">
                            <input type="button" value="취소" onclick="back()" class="btn"> 

                        </div>
                    </form>


    
    <!--================ End Login Area =================-->
</body>
</html>