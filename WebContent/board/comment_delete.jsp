<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int board_num = Integer.parseInt(request.getParameter("board_num"));
	int comment_num = Integer.parseInt(request.getParameter("comment_num"));
	String nowPage = request.getParameter("page");
	String board_id = request.getParameter("board_id");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script>

	
		var result = confirm("삭제 하시겠습니까?");
		if (result) {

			location.href='CommentDeletePro.bo?board_num=<%=board_num%>&nowPage=<%=nowPage%>&board_id=<%=board_id%>&comment_num=<%=comment_num%>';
		} else {

			history.back();
		}
		
	</script>

</body>
</html>