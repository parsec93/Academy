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
	<table id="sub_news">
    <h1 id="bo_v_title">리스트 제목</h1>
    <section id="bo_v_info">
        <h2>페이지 정보</h2>
        작성자 <strong>닉네임</strong>
        <span class="bo_v_date">작성일</span><strong>2000.00.00</strong>
        조회<strong>0회</strong>
        댓글<strong>0건</strong>
    </section>
    <section id="bo_v_atc">
    	내용~
    </section>
    <section id ="bo_v_can">
    	
		<form action="" method="post" name="fr">
		<input type="hidden" name="num" value="">
		<ul>
		<li>비밀번호 : 
		<input type="password" name="pass">
		<input type="submit" value="글삭제" class="btn">
		</li>
		</ul>
	</form>
	</section>
	</table>
	<div id="table_search">
		<input type="button" value="글수정" class="btn" onclick="location.href='updateForm.jsp'">
 		<input type="button" value="글삭제" class="btn" onclick="location.href='testdelete.jsp'">
		<input type="button" value="답글쓰기" class="btn" onclick="location.href='reWriteForm.jsp'">    
		<input type="button" value="글목록" class="btn" onclick="location.href='test.jsp'">
	</div>
	
	<div class="comment">
		<h1>댓글</h1>
		<div class="comment_more">
			<p class="comment_more_text">작성자</p>
			<p class="comment_more_text">:</p>
			<p class="comment_more_text">내용내용</p>
		</div>
		
		<div class="comment_more">
			<p class="comment_more_text">작성자2</p>
			<p class="comment_more_text">:</p>
			<p class="comment_more_text">내용내용2</p>
		</div>
		
		<div class="comment_more">
			<p class="comment_more_text">작성자3</p>
			<p class="comment_more_text">:</p>
			<p class="comment_more_text">내용내용3</p>
		</div>
			
		
		
		<p class="mainuser">작성자 닉네임</p>
	   <textarea name="comment" rows="10" cols="20"></textarea>
	</div>
	<div id="table_search">
		<input type="button" value="댓글등록" class="btn" onclick="">
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
