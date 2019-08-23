<%@page import="vo.NoticeBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
NoticeBean noticeBean = (NoticeBean)request.getAttribute("noticeBean");
%>
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
</style>
</head>
<body>
	<!-- 게시판 글 등록 -->
	<section id="writeForm">
		<h2>게시판 글 등록</h2>
		<form action="#" method="post" enctype="multipart/form-data" name="boardform">
			<table>
				<tr>
					<td class="td_left"><label for="notice_subject">제목</label></td>
					<td class="td_right"><%=noticeBean.getNotice_subject() %></td>
				</tr>
				<tr>
					<td class="td_left"><label for="notice_subject">구분</label></td>
					<td class="td_right">
					<% if(noticeBean.getIsNotice() == 1){ %>
													<input type="radio" name="isNotice" value="1" checked="checked">공지사항
					<%}else if(noticeBean.getIsNotice()==2){ %>
													<input type="radio" name="isNotice" value="2" checked="checked">이벤트</td>
					<%}else{} %>
				</tr>
				<%//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
				<tr><td class="td_left">이벤트 시작일 : </td><td class="td_right"><%=noticeBean.getEvent_start_day() %></td>
				</tr>
				<tr><td class="td_left"> 이벤트 종료일 : </td><td class="td_right"><%=noticeBean.getEvent_end_day() %></td>
				</tr>
								<tr>
					<td class="td_left"><label for="notice_file">파일첨부</label></td>
					<td class="td_right"><%=noticeBean.getNotice_file() %></td>
				</tr>
				<tr>
					<td class="td_left"><label for="notice_content">내용</label></td>
					<td class="td_right"><img src="noticeUpload/<%=noticeBean.getNotice_file()%>"><br>
					<%=noticeBean.getNotice_content() %></td>
				</tr>

			</table>
			<section id="commandCell">
				<input type="button" value="공지사항 목록보기" onclick="location.href='notice.no'"/>&nbsp;&nbsp;
				<input type="button" value="이벤트 목록보기" onclick="location.href='event.no'"/>
			</section>
		</form>	
	</section>
</body>
</html>















