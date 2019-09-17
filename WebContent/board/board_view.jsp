<%@page import="vo.BoardBean"%>
<%@page import="vo.MemberBean"%>
<%@page import="svc.member.InfoProService"%>
<%@page import="dao.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String isMember;
	String sId = (String) session.getAttribute("sId");
	BoardDAO boardDAO = BoardDAO.getInstance();
	BoardBean boardBean = (BoardBean) request.getAttribute("article");
	String nowPage = (String) request.getParameter("page");
	String board_id = request.getParameter("board_id");
	if(sId != null){
	InfoProService infoProService = new InfoProService();
	MemberBean memberBean = infoProService.getInfo(sId);
	isMember = (String)memberBean.getMember_isMember();
	} else{
		isMember = "0";
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="icon" href="img/favicon.png" type="image/png" />
<title>게시글 내용</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/flaticon.css" />
<link rel="stylesheet" href="css/themify-icons.css" />
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
<!-- login css -->
<link rel="stylesheet" href="css/style.css" />
<!-- board css -->
<link rel="stylesheet" href="css/board.css" />
</head>
<body>
	<jsp:include page="../header_footer/header.jsp" />
	<!-- 게시판 글 등록 -->
	<section id="boardView">
		<section class="banner_area">
			<div class="banner_inner d-flex align-items-center">
				<div class="overlay"></div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-6">
							<div class="banner_content text-center">
								<h2>글 내용</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>


		<!-- 리스트 게시판 시작-->
		<div class="boardwrap">
			<table id="sub_news">
				<h1 id="board_subject">
				
				<%=boardBean.getBoard_subject()%></h1>
				<section id="bo_v_info">
					<div class="boardleft">
						<p class="boardlefttext">
							작성자<span><%=boardBean.getBoard_sid() %></span>
						</p>
						<p class="boardlefttext">
							작성일<span><%=boardBean.getBoard_date()%></span>
						</p>
						<p class="boardlefttext">
							조회수<span><%=boardBean.getBoard_readcount()%></span>
						</p>
						
					</div>
					<div class="boardright">
						<p class="boardlefttext">
							<%if(boardBean.getBoard_re_lev() == 0){ %>
							첨부파일 : <span> <%
 	if (boardBean.getBoard_file() == null) {
 %>첨부된 파일이 없습니다.<%
 	} else {
 %> <a href="board/bd_File_down.jsp?bd_File_name=<%=boardBean.getBoard_file()%>"><%=boardBean.getBoard_file()%></a>
			<%
				} }
			%>
			
							</span>
						</p>
					</div>

				</section>
				<section id="bo_v_atc">
				<%if(boardBean.getBoard_re_lev() == 0){%>
					<%
						if (boardBean.getBoard_file() != null) {
					%>
					<img src="boardUpload/<%=boardBean.getBoard_file()%>"><br>
					<%
						} }
					%>
					
					<%=boardBean.getBoard_content()%>
				</section>
			</table>
			<div id="table_search">
				<%if(sId!=null){ %>
				 <%if(sId.equals(boardBean.getBoard_sid())|isMember=="1"|isMember=="2"){ %>
				<input type="button" value="글수정" class="btn"
					onclick="location.href='BoardModifyForm.bo?board_num=<%=boardBean.getBoard_num()%>&page=<%=nowPage%>&board_id=<%=board_id%>&board_sid=<%=sId%>&board_replyid=<%=boardBean.getBoard_sid()%>'">
				<input type="button" value="글삭제" class="btn"
					onclick="location.href='BoardDelete.bo?board_num=<%=boardBean.getBoard_num()%>&page=<%=nowPage%>&board_id=<%=board_id%>'">
					<%} %>
				<%if(board_id.equals("qna")){ %>
				 <%if(isMember.equals("1")|isMember.equals("2")){ %>
				<input type="button" value="답글쓰기" class="btn"
					onclick="location.href='BoardReplyForm.bo?board_num=<%=boardBean.getBoard_num()%>&page=<%=nowPage%>&board_id=<%=board_id%>&board_sid=<%=sId%>&board_replyid=<%=boardBean.getBoard_sid()%>'">
					<% }%>
					<% }else{%>
							<input type="button" value="답글쓰기" class="btn"
					onclick="location.href='BoardReplyForm.bo?board_num=<%=boardBean.getBoard_num()%>&page=<%=nowPage%>&board_id=<%=board_id%>&board_sid=<%=sId%>&board_replyid=<%=boardBean.getBoard_sid()%>'">
					<%} %>
					<%} %>
				<input type="button" value="글목록" class="btn"
					onclick="location.href='<%=board_id%>board.bo?page=<%=nowPage%>'">
				
			</div>
			<%if(sId!=null){ %>
			<%
				if (board_id.equals("free")) {
			%>
			<form
				action="BoardComment.bo?page=<%=nowPage%>&board_num=<%=boardBean.getBoard_num()%>&board_id=<%=board_id%>&board_sid=<%=sId%>"
				method="post">
				<div class="comment">
					<h1>댓글</h1>
					<%
						List<BoardBean> commentList = null;
							commentList = boardDAO.getCommentList(boardBean.getBoard_num());
					%>



					<%
						for (int i = 0; i < commentList.size(); i++) {
								//BoardBean bb=(BoardBean)boardList.get(i);
								BoardBean bb2 = commentList.get(i);
					%>
					<div class="comment_more">
						<p class="comment_more_text"><%=bb2.getComment_sid()%></p>
						<p class="comment_more_text2">:</p>
						<p class="comment_more_text"><%=bb2.getComment()%></p>
						<%if(bb2.getComment_sid().equals(sId)){ %>
							
							<input type="button" value="삭제" class="btn2"
							
					onclick="location.href='CommentDelete.bo?page=<%=nowPage%>&board_id=<%=board_id%>&board_num=<%=boardBean.getBoard_num()%>&comment_num=<%=bb2.getComment_num()%>'">
							
						
						<%} %>
					</div>
					<%
						}
					%>


					<p class="mainuser">댓글 등록</p>
					<textarea name="comment" rows="10" cols="20"></textarea>
				</div>
				<div id="table_search">
					<input type="submit" value="댓글등록" class="btn">
				</div>
			</form>
			<%
				} }
			%>
			
		</div>
		

		<!-- 리스트 게시판 끝-->



		<!--================ Start footer Area  =================-->
		<jsp:include page="../header_footer/footer.jsp" />
		<!--================ End footer Area  =================-->

		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/popper.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
		<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
		<script src="js/owl-carousel-thumb.min.js"></script>
		<script src="js/jquery.ajaxchimp.min.js"></script>
		<script src="js/mail-script.js"></script>
		<!--gmaps Js-->
		<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
		<script src="js/gmaps.min.js"></script>
		<script src="js/theme.js"></script>
</body>
</html>