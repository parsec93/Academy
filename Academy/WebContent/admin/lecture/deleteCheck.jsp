<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
int lecture_idx = Integer.parseInt(request.getParameter("lecture_idx"));
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function goPage(){
		location.href="/Academy/lectureDelete.le?lecture_idx=<%=lecture_idx%>";
	}
</script>


</head>
<body>
<h1>삭제하시겠습니까?</h1>
<input type="button" value="삭제하기" onclick="goPage()">
<input type="button" value="취소" onclick="window.close()">
</body>
</html>

