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
<body>
<%
String member_idx=request.getParameter("member_idx");
String id = request.getParameter("id");
String name = request.getParameter("name");
%>
    <!--================ Start Login Area =================-->

            <a href="index.jsp">교직원 계정 삭제</a>
                    <form action="TeacherDelete.me?member_idx=<%=member_idx %>" method="post" >
                      <label for="id">id</label> 
                      <input type="text" name="id" id="id" class="inpt" required="required" placeholder="Your id" value="<%=id%>"> 
                      <br>
                      <label for="name">name</label> 
                      <input type="text" name="name" id="name" class="inpt" required="required" placeholder="Your id" value="<%=name%>"> 

                        <div class="submit-wrap">
                            <input type="submit" value="계정 삭제" class="btn">
                            <input type="button" value="취소" onclick="history.back()" class="btn"> 

                        </div>
                    </form>


    
    <!--================ End Login Area =================-->
</body>
</html>