<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style type="text/css">
	#registForm {
		width: 500px;
		height: 610px;
		border: 1px solid red;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 450px;
		border: 1px solid darkgray;
	}
	
	.td_left {
		width: 150px;
		background: orange;
	}
	
	.td_right {
		width: 300px;
		background: skyblue;
	}
	
	#commandCell {
		text-align: center;
	}
</style>
</head>
<body>
	<!-- 게시판 글 등록 -->
	<section id="writeForm">
		<h2>게시판 글 등록</h2>
		<form action="NoticeWritePro.no" method="post" enctype="multipart/form-data" name="boardform">
			<table>
				<tr>
					<td class="td_left"><label for="notice_subject">제목</label></td>
					<td class="td_right"><input type="text" name="notice_subject" id="notice_subject" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="notice_subject">구분</label></td>
					<td class="td_right"><input type="radio" name="isNotice" value="1">공지사항
													<input type="radio" name="isNotice" value="2">이벤트</td>
				</tr>
				<%//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
				<tr><td class="td_left">이벤트 시작일</td><td><input type="text" id="date_start" placeholder="이벤트시작일" name="event_start_day"></td>
						<script>
$(function() {
  $( "#date_start" ).datepicker({
    dateFormat: 'yy-mm-dd'
  });
});
</script>
				</tr>
				<tr><td class="td_left"> 이벤트 종료일</td><td><input type="text" id="date_end" placeholder="이벤트 종료일" name="event_end_day"></td>
						<script>
$(function() {
  $( "#date_end" ).datepicker({
    dateFormat: 'yy-mm-dd'
  });
});
</script>
				</tr>
				<tr>
					<td class="td_left"><label for="notice_content">내용</label></td>
					<td class="td_right"><textarea name="notice_content" id="notice_content" cols="40" rows="15" required="required" ></textarea></td>
				</tr>
				<tr>
					<td class="td_left"><label for="notice_file">파일첨부</label></td>
					<td class="td_right"><input type="file" name="notice_file" id="notice_file" /></td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="등록" />&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" />
			</section>
		</form>	
	</section>
</body>
</html>















