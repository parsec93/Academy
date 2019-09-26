<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="startPage.jsp">
<table width="1330px"  border="0"  height="430px" align="center"   >
   <tr>
    <td>
     <table width="450px" align="center"  border="0" style="color:black; background-color: #F6F6F6; font-size:20px; ">
     <% String pass = (String)request.getAttribute("pass");
%>
      <tr>
      <td>비밀번호는 <h1> <%=pass %></h1>입니다.</td>
      </tr>
   
      <tr>
       <td><input type="button" value="로그인" class="btn" onclick="location.href='member/loginForm.jsp#singin'"></td>
       </tr>

          </table>

     </td>
    </tr>
  </table>

</form>
                
                
 
</body>
</html>