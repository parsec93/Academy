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
	<tbody>
	<tr>
	<td class="num">1</td>
	<td class="title">
	<a href="testcontent.jsp">게시판 제목이 들어갑니다</a>
	<img width="13" height="12" class="pic" alt="첨부이미지" src="img/board/ic_pic.gif"> <a class="comment" href="#">[5]</a> <img width="10" height="9" class="new" alt="새글" src="img/board/ic_new.gif">
	</td>
	<td class="name">글쓴이이름</td>
	<td class="hit">1234</td>
	<td class="date">2008/02/14</td>
	<td class="date">2008/02/14</td>
	</tr>
	<tr class="reply">
	<td class="num">2</td>
	<td class="title" style="padding-left:30px;">
	<img width="13" height="12" class="reply" alt="첨부이미지" src="img/board/ic_reply.png"> <a href="#">블로그 개편 답글</a>
	</td>
	<td class="name">벤쿠버지사</td>
	<td class="hit">1234</td>
 	<td class="date">2008/02/14</td>
	<td class="date">2008/02/14</td>
	</tr>
	
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
	<a href="#">Prev</a>
	<a href="#">1</a>
	<a href="#">Next</a>
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
