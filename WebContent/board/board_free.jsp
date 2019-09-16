<%@page import="svc.board.BoardCommentListService"%>
<%@page import="vo.BoardPageInfo"%>
<%@page import="vo.BoardBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="icon" href="img/favicon.png" type="image/png" />
    <title>자유게시판</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/flaticon.css" />
    <link rel="stylesheet" href="css/themify-icons.css" />
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
    <!-- main css -->
    <link rel="stylesheet" href="css/style.css" />
    <!-- board css -->
	<link rel="stylesheet" href="css/board.css" />
  </head>
<%
request.setCharacterEncoding("UTF-8");
// Action 클래스에서 request 객체의 setAttribute()메서드로 저장되어 전달된 객체 가져오기(Ojbect타입이므로 각각 형변환이 필요)
ArrayList<BoardBean> articleList = (ArrayList<BoardBean>)request.getAttribute("articleList");   // 게시판 글 목록 을 위한 객체 
BoardPageInfo boardPageInfo = (BoardPageInfo)request.getAttribute("boardPageInfo");
BoardCommentListService boardCommentListService = new BoardCommentListService();
//pageInfo 객체로부터 페이징 정보 가져오기 
int listCount = boardPageInfo.getListCount();
int nowPage = boardPageInfo.getPage();
int startPage = boardPageInfo.getStartPage();
int endPage = boardPageInfo.getEndPage();
int maxPage = boardPageInfo.getMaxPage();

request.setCharacterEncoding("UTF-8");
String board_id = (String)request.getAttribute("board_id");
String board_sid = (String)session.getAttribute("sId");


%>
  <body>
    <!--================ Start Header Menu Area =================-->
    <jsp:include page="../header_footer/header.jsp" />
    <!--================ End Header Menu Area =================-->

    <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="overlay"></div>
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-6">
              <div class="banner_content text-center">
                <h2>자유게시판</h2>
                <div class="page_link">
                  <a href="index.jsp">Home</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->
	 <div class="boardwrap">
    <table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
	<caption>게시판 리스트</caption>
    <colgroup>
	<col width="8%">
	<col width="12%">
	<col width="50%">
	<col width="20%">
	<col width="10%">

	</colgroup>
              <%if(articleList == null) {%>
              <h1>작성된 글이 없습니다.</h1>
              <%}else{ %>
				<thead>
				<tr>
					<th scope="col">글 번호</td>
					<th scope="col">작성자</td>
					<th scope="col">글 제목</td>
					<th scope="col">작성일</td>
					<th scope="col">조회수</td>
					
				</tr>
					</thead>
					<%
					for(int i =0 ; i<articleList.size(); i++){
						BoardBean boardBean = (BoardBean)articleList.get(i);
						%>	
						<tr style="cursor:pointer;" onclick="location.href='BoardView.bo?board_num=<%=boardBean.getBoard_num()%>&page=<%=nowPage%>&board_id=<%=board_id%>'" >
							<td class="num"><%=listCount-i-(10*(nowPage-1))%></td>
							<td class="sid"><%=boardBean.getBoard_sid() %></td>
							<td class="title"><%if(boardBean.getBoard_re_lev() != 0) { %>
								<%for(int j = 0; j <= articleList.get(i).getBoard_re_lev() * 2; j++) { %> 
										&nbsp;
								<%} %><%} %>
								<%if(boardBean.getBoard_re_lev() > 0){ %>
								<img width="13" height="12" class="reply" alt="첨부이미지" src="img/board/ic_reply.png">
								<%} %>
								<%=boardBean.getBoard_subject() %>
								<%if(boardCommentListService.getCommentCount(boardBean.getBoard_num())>0){ %>
								<a class="comment" href="#">[<%=boardCommentListService.getCommentCount(boardBean.getBoard_num())%>]</a>
								<%} %>
								</td>
							<td class="date"><%=new SimpleDateFormat("yyyy-MM-dd").format(boardBean.getBoard_date()) %></td>
							<td class="readcount"><%=boardBean.getBoard_readcount() %></td>
						</tr>
						<%
					}
					%>
				
				
				<%} %>
				</table>

<!-- // 페이징 처리 구역  -->
	<section id="articleList">

		<%if(nowPage <= 1 ) { %>
			[이전]&nbsp;
		<%} else { %>
			<a href="<%=board_id%>board.bo?page=<%=nowPage -1 %>">[이전]</a>&nbsp;
		<%} %>
		
		<%for(int i = startPage ; i <= endPage; i++) {
			if(i == nowPage) {%>
				[<%=i %>]
			<%} else { %>
				<a href = "<%=board_id%>board.bo?page=<%=i %>">[<%=i %>]</a>&nbsp;
			<%} %>
		<%} %>
		
		<%if(nowPage >= maxPage){ %>
			&nbsp;[다음]
		<%} else {  %>
			<a href="<%=board_id%>board.bo?page=<%=nowPage +1 %>"> &nbsp;[다음]</a>
		<%} %><br><br>
		
	</section>
	<%if(board_sid!=null){ %>
		<input type="button" value="글쓰기" onclick="location='BoardWriteForm.bo?board_id=<%=board_id%>&board_sid=<%=board_sid%>'" style="float:right;"/>
		<%} %>

<!-- 페이징 처리 구역 종료 -->
                    </div>
            
   
    <!--================ Start Popular Courses Area =================-->
   
    <!--================ End Popular Courses Area =================-->

    <!--================ Start Registration Area =================-->

      <!--================ End Registration Area =================-->

    <!--================ Start Feature Area =================-->

    <!--================ End Feature Area =================-->

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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
    <script src="js/gmaps.min.js"></script>
    <script src="js/theme.js"></script>
  </body>
</html>
