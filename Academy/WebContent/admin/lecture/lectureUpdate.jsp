<%@page import="vo.LectureBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	LectureBean article = (LectureBean)request.getAttribute("article");
    String nowPage = (String)request.getAttribute("page");
%>
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
 <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
  </head>
<script>
$(function() {
     $( "#date_start" ).datepicker({
       dateFormat: 'yy-mm-dd'
     });
   });
</script>
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
                <h2>수업수정</h2>
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
    <h1 id="bo_v_title">수업 정보</h1>
    
    <div>
            <form action="lectureUpdate.le" name="up" method="post" >
       <table>
                        <tr><td><label for="lecture_subject">수업명</label></td> 
                        <td><input type="text" name="lecture_subject" id="lecture_subject" value="<%=article.getLecture_subject() %>" required="required"></td></tr> 
                        
                        <tr><td><label for="lecture_course">과목명</label> </td> 
                        <td><input type="text" name="lecture_course" id="lecture_course" value="<%=article.getLecture_course() %>" required="required" > </td></tr>
                        
                        <tr><td><label for="lecture_teacher">수업강사</label> </td> 
                        <td><input type="text" name="lecture_teacher" id="lecture_teacher" value="<%=article.getLecture_teacher() %>" required="required" > </td></tr>
                        
                        <tr><td><label for="lecture_content">수업기간</label></td> 
                        <td><input type="text" id="date_start" value="<%=article.getLecture_start_day() %>" name="lecture_start_day">
                        &nbsp;~&nbsp;
                        <input type="text" id="date_end" value="<%=article.getLecture_end_day() %>" name="lecture_end_day"></td></tr>
                        
                        <tr><td><label for="weekday">수업요일</label></td> 
                        <td><select name="lecture_week_day">
                        <%if(article.getLecture_week_day() == "1"){ %>
                        <option value="1" selected="selected">월,수,금</option>
                        <option value="2">화,목</option>
                        <%}else { %>
                            <option value="1" >월,수,금</option>
                            <option value="2" selected="selected">화,목</option>
                       <%  }%>
                        </select></td></tr>
                        
<!--                         <input type="text" name="lecture_content" id="lecture_content"  required="required" placeholder="수업내용">  -->
                        
                        <tr><td><label for="lecture_content">수업내용</label> </td> 
                        <td><textarea name="lecture_content" rows="5"  cols="100"><%=article.getLecture_content() %></textarea></td></tr>
                        
                      <tr><td><label for="lecture_fee">회비</label></td> 
                      <td><input type="text" name="lecture_fee" id="lecture_fee" value="<%=article.getLecture_fee() %>" required="required" > </td></tr>
						
						<tr><td><input type="hidden" name="page" value="<%=nowPage %>"></td>
						<td><input type="hidden" name="lecture_idx" value="<%=article.getLecture_idx() %>"></td></tr>
                        
                        <tr><td cols="2"><div class="submit-wrap">
                            <input type="submit" value="수업수정" class="submit"> 
                        </div></td></tr>
                    </table>
                    </form>
                </div>
    
   </table>
   <div id="table_search">
      <input type="button" value="글목록" class="btn" onclick="location.href='lectureList.le?page=<%=nowPage%>'">
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