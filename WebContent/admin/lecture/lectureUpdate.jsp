<%@page import="vo.LectureBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	LectureBean article = (LectureBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업정보등록</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

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
<script type="text/javascript">
	function num_check() {
		var num = document.up;
		if(!((event.keyCode>=48 && event.keyCode<=57)||(event.keyCode >= 96 && event.keyCode<=105)||event.keyCode==8)){
			alert("숫자를 입력하세요.");
	        document.getElementById('lecture_fee').value = "";
			event.returnValue=false;
		}
		
	}
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
                <h2>수업정보등록</h2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

	<!-- 게시판 글 등록 -->
	<div class="boardwrap">
    <h1>수업 정보</h1>
     
				<form action="lectureUpdate.le"  name="up" method="post" >
    	<table id="boardwrite">
                        <tr>
                        <td class="ftwrite"><label for="lecture_subject">수업명</label></td> 
                        <td class="fttitle"><input type="text" name="lecture_subject" id="lecture_subject"  required="required" placeholder="수업명" value="<%=article.getLecture_subject()%>"></td>
                        </tr> 
                        
                        <tr>
                        <td class="ftwrite"><label for="lecture_course">과목명</label> </td> 
                        <td class="fttitle"><input type="text" name="lecture_course" id="lecture_course"  required="required" placeholder="과목명" value="<%=article.getLecture_course()%>"> </td></tr>
                        
                        <tr>
                        <td class="ftwrite"><label for="lecture_teacher">수업강사</label> </td> 
                        <td class="fttitle"><input type="text" name="lecture_teacher" id="lecture_teacher"  required="required" placeholder="수업강사" value="<%=article.getLecture_teacher()%>"> </td></tr>
                        
                        
                        <tr>
                        <td class="ftwrite"><label for="lecture_content">수업기간</label></td> 

                        <td class="fttitle"><input type="text" id="date_start"  placeholder="이벤트시작일" name="lecture_start_day" value="<%=article.getLecture_start_day()%>">
                        <script>
$(function() {
  $( "#date_start" ).datepicker({
    dateFormat: 'yy-mm-dd'
  });
});
</script>
                        &nbsp;~&nbsp;
                        <input type="text" id="date_end" placeholder="이벤트 종료일" name="lecture_end_day" value="<%=article.getLecture_end_day()%>"></td></tr>
                        <script>
$(function() {
  $( "#date_end" ).datepicker({
    dateFormat: 'yy-mm-dd'
  });
});
</script>
                        <tr>
                        <td class="ftwrite"><label for="weekday">수업요일</label></td> 
                        <td class="fttitle"><select name="weekday">
									<%
										if (article.getLecture_week_day() == "1") {
									%>
									<option value="1" selected="selected">월,수,금</option>
									<option value="2">화,목</option>
									<%
										} else {
									%>
									<option value="1">월,수,금</option>
									<option value="2" selected="selected">화,목</option>
									<%
										}
									%>
                        </select></td></tr>
                                                
                        <tr>
                        <td class="ftwrite"><label for="lecture_content">수업내용</label> </td> 
                        <td class="fttitle"><textarea name="lecture_content" rows="5" cols="100"><%=article.getLecture_content()%></textarea></td></tr>
                        
             			<tr>
             			<td class="ftwrite"><label for="lecture_fee">회비</label></td> 
             			<td class="fttitle"><input type="text" name="lecture_fee" id="lecture_fee"  required="required" placeholder="회비" value="<%=article.getLecture_fee()%>" onkeydown=num_check() > </td></tr>

                  
					
                    </table>

						<div id="table_search">
									<input type="submit" value="수업수정" class="btn">
								</div>
                    </form>	
	
	</div>
</body>
</html>















