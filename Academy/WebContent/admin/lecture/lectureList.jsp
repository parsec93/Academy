<%@page import="vo.LecturePageInfo"%>
<%@page import="vo.LectureBean"%>
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
    <title>게시판TEST</title>
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
  <%
  ArrayList<LectureBean> lectureList = (ArrayList<LectureBean>)request.getAttribute("lectureList");
  LecturePageInfo lecturePageInfo = (LecturePageInfo)request.getAttribute("lecturePageInfo");
 
  int listCount = lecturePageInfo.getListCount();
  int nowPage = lecturePageInfo.getPage();
  int startPage = lecturePageInfo.getStartPage();
  int endPage = lecturePageInfo.getEndPage();
  int maxPage = lecturePageInfo.getMaxPage();
  %>

  <body>
    <!--================ Start Header Menu Area =================-->
    <jsp:include page="/header_footer/header.jsp" />
    <!--================ End Header Menu Area =================-->
	  
    <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="overlay"></div>
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-6">
              <div class="banner_content text-center">
                <h2>게시판테스트</h2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->
	
	

	<!-- 리스트 게시판 시작-->
	
	<div class="boardwrap">
	<h1>게시판 제목</h1>
	<p class="boardtotal">Total 0건 / 0 페이지</p>
	<table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
	<caption>게시판 리스트</caption>
	<colgroup>
	<col width="5%">
	<col width="45%">
	<col width="10%">
	<col width="10%">
	<col width="15%">
	<col width="15%">
	</colgroup>
	<%if(lectureList.size() == 0) {%>
    <h1><b>작성된 글이 없습니다.</b></h1>
    <%}else{ %>
	<thead>
	<tr>
	<th scope="col">글번호</th>
	<th scope="col">제목</th>
	<th scope="col">과목</th>
	<th scope="col">선생님</th>
	<th scope="col">시작일</th>
	<th scope="col">종료일</th>
	</tr>
	</thead>
    <%
    for(int i =0 ; i<lectureList.size(); i++){
	LectureBean lectureBean = (LectureBean)lectureList.get(i);
	%>	
	
	<tbody>
	<tr>
	<td class="num"><%=lectureBean.getLecture_idx() %></td>
	<td class="title">
	<a href="lectureDetail.le?lecture_idx=<%=lectureBean.getLecture_idx()%>&page=<%=nowPage%>"><%=lectureBean.getLecture_subject() %></a>
	<img width="13" height="12" class="pic" alt="첨부이미지" src="img/board/ic_pic.gif"> <a class="comment" href="#">[5]</a> <img width="10" height="9" class="new" alt="새글" src="img/board/ic_new.gif">
	</td>
	<td class="name"><%=lectureBean.getLecture_course() %></td>
	<td class="hit"><%=lectureBean.getLecture_teacher() %></td>
	<td class="date"><%=lectureBean.getLecture_start_day() %></td>
	<td class="date"><%=lectureBean.getLecture_end_day() %></td>
	</tr>
	<%
		}
	} %>
	
	<!-- tr이 제목 1줄입니다 보일 list 갯수만큼 li반복합니다.-->
	</tbody>
	</table>
	<div id="table_search">
	<input type="button" value="수업등록" class="btn" onclick="location.href='lectureInsert.le'">
	</div>
	<div id="table_search">
	<form action="#" method="get">
	<input type="text" name="search" class="input_box">
	<input type="submit" value="search" class="btn">
	</form>
	</div>
	
	
	<div id="page_control">
	
		<%
		if(nowPage <= 1 ) { %>
			[이전]&nbsp;
		<%} else { %>
			<a href="lectureList.le?page=<%=nowPage -1 %>">[이전]</a>&nbsp;
		<%} %>
		
		<%for(int i = startPage ; i <= endPage; i++) {
			if(i == nowPage) {%>
				[<%=i %>]
			<%} else { %>
				<a href = "lectureList.le.no?page=<%=i %>">[<%=i %>]</a>&nbsp;
			<%} %>
		<%} %>
		
		<%if(nowPage >= maxPage){ %>
			&nbsp;[다음]
		<%} else {  %>
			<a href="lectureList.le.no?page=<%=nowPage +1 %>"> &nbsp;[다음]</a>
		<%} %>


<!-- 페이징 처리 구역 종료 -->
                    </div>
                      </div>
	<!-- 리스트 게시판 끝-->


    <!--================ Start footer Area  =================-->
    <jsp:include page="/header_footer/footer.jsp" />
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
