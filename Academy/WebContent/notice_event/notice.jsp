<%@page import="vo.NoticePageInfo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.NoticeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="icon" href="img/favicon.png" type="image/png" />
    <title>공지사항</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/flaticon.css" />
    <link rel="stylesheet" href="css/themify-icons.css" />
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
    <!-- main css -->
    <link rel="stylesheet" href="css/style.css" />
  </head>
<%

// Action 클래스에서 request 객체의 setAttribute()메서드로 저장되어 전달된 객체 가져오기(Ojbect타입이므로 각각 형변환이 필요)
ArrayList<NoticeBean> noticeList = (ArrayList<NoticeBean>)request.getAttribute("noticeList");   // 게시판 글 목록 을 위한 객체 
NoticePageInfo noticePageInfo = (NoticePageInfo)request.getAttribute("noticePageInfo");

//pageInfo 객체로부터 페이징 정보 가져오기 
int listCount = noticePageInfo.getListCount();
int nowPage = noticePageInfo.getPage();
int startPage = noticePageInfo.getStartPage();
int endPage = noticePageInfo.getEndPage();
int maxPage = noticePageInfo.getMaxPage();

String sid = (String)session.getAttribute("sid");

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
                <h2>Courses</h2>
                <div class="page_link">
                  <a href="index.jsp">Home</a>
                  <a href="event.jsp">Notice</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->
	 <div class="popular_courses section_gap_top">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-5">
            <div class="main_title">
              <h2 class="mb-3">NOTICE</h2>
              <p>
				공지사항
              </p>
              <%if(noticeList.size() == 0) {%>
              <h1><b>작성된 글이 없습니다.</b></h1>
              <%}else{ %>
				<table border="1" width="500">
				<tr>
					<td>글 번호</td><td>글 제목</td><td>작성일</td>
				</tr>
					<%
					for(int i =0 ; i<noticeList.size(); i++){
						NoticeBean noticeBean = (NoticeBean)noticeList.get(i);
						%>	
						<tr style="cursor:pointer;" onclick="location.href='noticeView.no?notice_idx=<%=noticeBean.getNotice_idx()%>'" onmouseover="window.status='https://www.happyjung.com/'" onmouseout="window.status=''">
							<td><%=noticeBean.getNotice_idx() %></td>
							<td><%=noticeBean.getNotice_subject() %></td>
							<td><%=new SimpleDateFormat("yyyy-MM-dd").format(noticeBean.getNotice_date()) %></td>
						</tr>
						<%
					}
					%>
				
				
				<%} %>
				</table>

<!-- // 페이징 처리 구역  -->
	<section id="noticeList">
	
		<%if(noticeList.size() > 10  ){
		if(nowPage <= 1 ) { %>
			[이전]&nbsp;
		<%} else { %>
			<a href="notice.no?page=<%=nowPage -1 %>">[이전]</a>&nbsp;
		<%} %>
		
		<%for(int i = startPage ; i <= endPage; i++) {
			if(i == nowPage) {%>
				[<%=i %>]
			<%} else { %>
				<a href = "notice.no?page=<%=i %>">[<%=i %>]</a>&nbsp;
			<%} %>
		<%} %>
		
		<%if(nowPage >= maxPage){ %>
			&nbsp;[다음]
		<%} else {  %>
			<a href="notice.no?page=<%=nowPage +1 %>"> &nbsp;[다음]</a>
		<%} }%>
	</section>

<!-- 페이징 처리 구역 종료 -->
                    </div>
                  </div>
                </div>
              </div>
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
