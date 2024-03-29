<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="icon" href="img/favicon.png" type="image/png" />
<title>글 쓰기</title>
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
	<section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="overlay"></div>
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-6">
              <div class="banner_content text-center">
              <h2>자유 게시판</h2>
	           </div>
            </div>
          </div>
        </div>
      </div>
    </section>
		
		
		<%String board_id =(String)request.getParameter("board_id"); 
		  String board_sid = (String)request.getParameter("board_sid");
		System.out.println(board_id);%>

	<div class="boardwrap">	
	<h1>게시판 글 쓰기 </h1>
	<form action="BoardWritePro.bo?board_id=<%=board_id%>&board_sid=<%=board_sid%>" method="post" enctype="multipart/form-data" name="boardform">
	<table id="boardwrite">
	<tr>
		<td class="ftwrite">제목</td>
	    <td class="fttitle">
	    	<input type="text" name="board_subject" id="board_subject" required="required" style="width:500px;">
	    	<%if(board_id.equals("qna")){ %>
	    	<input type="checkbox" name="board_issecret" id="board_issecret" value=1> 비밀글
	    	<%} %>
	   	</td>
	</tr>
	<tr>
		<td class="ftwrite">파일</td>
	    <td class="fttitle">
	    	<input type="file" name="board_file" id="board_file">
	    </td>
	</tr>  
	<tr>
		<td class="ftwrite">글내용</td>
	    <td class="fttitle">
	    	<textarea name="board_content" id="board_content" cols="40" rows="15" required="required"></textarea>
	    </td>

	</tr>
	</table>
	<div id="table_search">

	<input type="submit" value="글쓰기" class="btn">&nbsp;&nbsp;
	<input type="reset" value="다시쓰기" class="btn"/>&nbsp;&nbsp;
	<input type="button" value="글목록" class="btn" onclick="location.href='qnaboard.bo'">
	</div>
	</form>	
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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
    <script src="js/gmaps.min.js"></script>
    <script src="js/theme.js"></script>
 
	
	
</body>
</html>


