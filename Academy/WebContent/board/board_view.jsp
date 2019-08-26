<%@page import="vo.BoardBean"%>
<%@page import="dao.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BoardDAO boardDAO = BoardDAO.getInstance();
	BoardBean boardBean = (BoardBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page");
	System.out.print(request.getAttribute("nowPage"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 내용</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style type="text/css">
#registForm {
	width: 500px;
	height: 1000px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

table {
	margin: auto;
	width: 900px;
	border: 1px solid darkgray;
}

.td_left {
	width: 150px;
	background: orange;
}

.td_right {
	width: 600px;
	/* 		background: skyblue; */
}

#commandCell {
	text-align: center;
}
#comment{
width:900px;
margin:0 auto;
}
#comment_more{
width:100%;
}
</style>
</head>
<body>
	<!-- 게시판 글 등록 -->
	<section id="boardView">
		<h2>글 내용</h2>
		<form action="#" method="post" enctype="multipart/form-data"
			name="boardform">
			<table>
				<tr>
					<td class="td_left"><label for="board_subject">제목</label></td>
					<td class="td_right"><%=boardBean.getBoard_subject()%></td>
				</tr>
				<tr>
					<td class="td_left"><label for="board_file">첨부파일</label></td>
					<td class="td_right">
						<%
							if (boardBean.getBoard_file() != null) {
						%> <%=boardBean.getBoard_file()%> <%
							}
						%>
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="board_content">내용</label></td>
					<td class="td_right"><%=boardBean.getBoard_content()%></td>
				</tr>

			</table>
			<section id="commandCell">
				<a
					href="BoardReplyForm.bo?board_num=<%=boardBean.getBoard_num()%>&page=<%=nowPage%>">[답변]</a>
				<a href="BoardModifyForm.bo?board_num=<%=boardBean.getBoard_num()%>">[수정]</a>
				<a
					href="BoardDeleteForm.bo?board_num=<%=boardBean.getBoard_num()%>&page=<%=nowPage%>">[삭제]</a>
				<a href="BoardList.bo?page=<%=nowPage%>">[목록]</a> &nbsp;&nbsp; <br>
				<br>
			</section>
		</form>
	</section>


	<form action="BoardComment.bo?page=<%=nowPage%>&board_num=<%=boardBean.getBoard_num()%>" method="post">
		
		<div id="comment">
			<br> <br> <br>
			<%
		List<BoardBean> commentList = null;

		commentList = boardDAO.getCommentList(boardBean.getBoard_num());
	%>
			<section id="comment">
				<table id="commenttable">

					<tr>
						<th class="twrite">작성자</th>
						<th class="tread">내용</th>
					</tr>
					<%
						for (int i = 0; i < commentList.size(); i++) {
							//BoardBean bb=(BoardBean)boardList.get(i);
							BoardBean bb2 = commentList.get(i);
					%>
					<tr>
						<td class="left"><%=bb2.getComment_num()%></td>
						<td><%=bb2.getComment()%></td>
					</tr>
					<%
						}
					%>

				</table>
				&nbsp;&nbsp;
				<textarea rows="5" cols="78" class="w3-input w3-border"
					placeholder="댓글 작성" name="comment" id="comment_more"></textarea>
				<br> <input type="submit" value="댓글 등록" class="btn"
					style="float: right;">
			</section>
		</div>
	</form>


</body>
</html>















