<%@page import="vo.MemberBean"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDAO memberDAO = MemberDAO.getInstance();
	MemberBean memberBean = (MemberBean) request.getAttribute("teacher");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 정보</title>
</head>
<body>
	<!-- 게시판 글 등록 -->
	<table>
		<tr>
		  <td>이름</td>
		  <td>아이디</td>
		  <td>이메일</td>
		  <td>비밀번호</td>
		  <td>우편번호</td>
		  <td>주소</td>
		  <td>상세주소</td>
		  <td>전화번호</td>
		  <td>교사코드</td>
		</tr>
		<tr>
		  <td><%=memberBean.getMember_name() %></td>
		  <td><%=memberBean.getMember_id()%></td>
		  <td><%=memberBean.getMember_email()%></td>
		  <td><%=memberBean.getMember_pass()%></td>
		  <td><%=memberBean.getMember_postcode()%></td>
		  <td><%=memberBean.getMember_add1()%></td>
		  <td><%=memberBean.getMember_add2()%></td>
		  <td><%=memberBean.getMember_phone()%></td>
		  <td><%=memberBean.getMember_teacher_code() %></td>
		</tr>
	
	</table>


</body>
</html>















