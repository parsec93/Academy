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
    <title>게시판글쓰기TEST</title>
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
    <jsp:include page="header_footer/header.jsp" />
    <!--================ End Header Menu Area =================-->
	  
    <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="overlay"></div>
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-6">
              <div class="banner_content text-center">
                <h2>게시판글쓰기</h2>
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
	<table id="boardwrite">
	<tr>
		<td class="ftwrite">글쓴이</td>
		<td class="fttitle">
			<input type="text" class="text" name="name" value="" readonly>
		</td>
	</tr>
	<tr>
		<td class="ftwrite">비밀번호</td>
	    <td class="fttitle">
	    	<input type="password" name="pass">
	    </td>
	</tr>
	<tr>
		<td class="ftwrite">제목</td>
	    <td class="fttitle">
	    	<input type="text" name="subject" style="width:500px;">
	   	</td>
	</tr>
	<tr>
		<td class="ftwrite">파일</td>
	    <td class="fttitle">
	    	<input type="file" name="file">
	    </td>
	</tr>  
	<tr>
		<td class="ftwrite">글내용</td>
	    <td class="fttitle">
	    	<textarea name="content" rows="10" cols="20"></textarea>
	    </td>
	</tr>
	</table>
	<div id="table_search">
	<input type="submit" value="글쓰기" class="btn">
	</div>
	
	</div>
	<!-- 리스트 게시판 끝-->


    <!--================ Start footer Area  =================-->
    <jsp:include page="header_footer/footer.jsp" />
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
