<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String lecture_idx = request.getParameter("lecture_idx");
%>
<%
if(request.getParameter("apply_review")!=null){
	%>
<script type="text/javascript">
	opener.location.href="ApplyInfo.al?listType=end&isReview=1";
	window.close();
</script>
<%}%>
<body>

<p class="mainuser">수강 후기</p>
<form action="../reviewInsert.al" method="post" >
<textarea name="apply_review" rows="10" cols="100" style="resize: none;"> </textarea>
<input type="hidden" name="lecture_idx" value="<%=lecture_idx%>">
<div id="table_search">
	<input type="submit" value="후기등록" class="btn">
</div>		
</form>
</body>
</html>