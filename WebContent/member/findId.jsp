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
     <% String id = (String)request.getAttribute("id");
     if(id!= null){ %>
      <tr>
      <td>ID는 <h1> <%=id %></h1>입니다.</td>
      </tr>
   
      <tr>
       <td><input type="button" value="로그인" class="btn" onclick="location.href='member/loginForm.jsp#singin'"></td>
               <td><input type="button" value="비밀번호 찾기" class="btn" onclick="location.href='member/findId_Pass.jsp#signup'"></td>
       </tr>

      <%} else{%>

      <tr>
      <td><h1>가입정보가 없습니다.</h1></td>
      </tr>      
             <tr>
        <td><input type="button" value="회원가입하기" class="btn" onclick="location.href='member/loginForm.jsp#singin'"></td>
      </tr> 
           <%} %>
          </table>

     </td>
    </tr>
  </table>

</form>


                
                
                

</body>
</html>