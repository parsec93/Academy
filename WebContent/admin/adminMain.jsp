<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h1{
font-size:50px;
text-align: center;
width:100%;
display:block;
margin-bottom:30px;
margin-top:200px;
}

.btnwrap{
width:1200px;
margin:0 auto;
}
.btn{
width:580px;
outline:none;
font-size:40px;
margin-right:30px;
height:100px;
color:#333;
}
.btn:last-child{
margin-right:0;
}

f
</style>
<body>
<h1>관리자 페이지</h1>
<div class="btnwrap">
<input type="button" class="btn" value="교사관리" onclick="location.href='../TeacherList.me'">
<input type="button" class="btn" value="수업관리" onclick="location.href='../lectureList.le'">
</div>

</body>
</html>