<%@page import="dao.MemberDAO"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function ok() {
	//window내장객체 멤버변수 opener == join.jsp창을 open해준 페이지
	opener.document.up.id.value=document.wfr.id.value;
	opener.document.up.idCheckValue.value="idCheck";
	window.close();
}
</script>
</head>
<body>
<%
String id = request.getParameter("id");
String check = request.getParameter("check");
if(check == null){
	check = (String)request.getAttribute("check");
}
if(check.equals("2")){
	out.println("중복확인을 눌러주세요");
}else if(check.equals("1")){
	out.println("아이디중복");
}else if(check.equals("0")){
	String lenReg = "[a-zA-Z0-9]{8,}";
	String engReg = "[a-zA-Z]";
	String numReg = "[0-9]";
	int eng = 0;
	int num = 0;
		eng += Pattern.compile(engReg).matcher(id).find() ? 1:0;
		num += Pattern.compile(numReg).matcher(id).find() ? 1:0;
	if(Pattern.matches(lenReg, id) && eng !=0 && num != 0) {


		out.println("아이디사용가능");
		%>
		<input type="button" value="아이디 사용" onClick="ok()">
		<%
	} else{
		out.println("영문,숫자 조합으로 8자 이상 필요");
	}
	
}
%>
<form action="/Academy/MemberCheckPro.me" name="wfr" method="post">
아이디:<input type="text" name="id" value="<%=id%>">
<input type="submit" value="아이디중복확인">
</form>
</body>
</html>