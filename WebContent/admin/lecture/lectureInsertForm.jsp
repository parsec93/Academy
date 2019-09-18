<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
	String weekday = request.getParameter("weekday");
	String time = request.getParameter("time");
	String lecture_count = request.getParameter("lecture_count");
	String lecutre_room = request.getParameter("lecutre_room");
%>
<%
if(request.getParameter("lecture_course")!=null){
	%>

<script type="text/javascript">
		opener.location.href="lectureInsert.le";
		window.close();
	
</script>
<%}%>
<body>
	  

	<!-- 게시판 글 등록 -->
	<div class="boardwrap">
    <h1>수업 정보</h1>
     
				<form action="../../lectureInsertPro.le" name="up" method="get" >
    	<table id="boardwrite">
                        <tr>
                        <td class="ftwrite"><label for="lecture_subject">수업명</label></td> 
                        <td class="fttitle"><input type="text" name="lecture_subject" id="lecture_subject"  required="required" placeholder="수업명"></td>
                        </tr> 
                        
                        <tr>
                        <td class="ftwrite"><label for="lecture_course">과목명</label> </td> 
                        <td class="fttitle"><input type="text" name="lecture_course" id="lecture_course"  required="required" placeholder="과목명"> </td></tr>
                        
                        <tr>
                        <td class="ftwrite"><label for="lecture_teacher">수업강사</label> </td> 
                        <td class="fttitle"><input type="text" name="lecture_teacher" id="lecture_teacher"  required="required" placeholder="수업강사"> </td></tr>
                        
                        
                        <tr>
                        <td class="ftwrite"><label for="lecture_content">수업기간</label></td> 

                        <td class="fttitle"><input type="text" id="date_start"  placeholder="이벤트시작일" name="lecture_start_day">
                        <script>
$(function() {
  $( "#date_start" ).datepicker({
    dateFormat: 'yy-mm-dd'
  });
});
</script>
                        &nbsp;~&nbsp;
                        <input type="text" id="date_end" placeholder="이벤트 종료일" name="lecture_end_day"></td></tr>
                        <script>
$(function() {
  $( "#date_end" ).datepicker({
    dateFormat: 'yy-mm-dd'
  });
});
</script>
                       
                                                
                        <tr>
                        <td class="ftwrite"><label for="lecture_content">수업내용</label> </td> 
                        <td class="fttitle"><textarea name="lecture_content" rows="10" cols="50" style="resize: none;"></textarea></td>
                        </tr>
                        
             			<tr>
             			<td class="ftwrite"><label for="lecture_fee">회비</label></td> 
             			<td class="fttitle"><input type="text" name="lecture_fee" id="lecture_fee"  required="required" placeholder="회비"> </td>
             			</tr>
						
						<input type="hidden" name="weekday" value="<%=weekday %>" >
						<input type="hidden" name="time" value="<%=time %>" >
						<input type="hidden" name="lecture_count" value="<%=lecture_count %>" >
                        <input type="hidden" name="lecutre_room" value="<%=lecutre_room %>" >
                    </table>
                    <div id="table_search">
				<input type="submit" value="등록" class="btn" onClick="insertSubmit()"/>&nbsp;&nbsp;
				<input type="reset" value="취소" class="btn"/>
				</div>
                    </form>	
	
	</div>
</body>
</html>















