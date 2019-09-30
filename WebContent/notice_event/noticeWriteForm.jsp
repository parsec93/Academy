<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항/이벤트 작성</title>
    <script type="text/javascript">
    function noticeCheck(){
    	if(document.neform.isNotice[0].checked == false && document.neform.isNotice[1].checked == false){
    		alert("공지사항/ 이벤트 중 하나를 선택하세요.");
    		return false;
    	}
    	if(document.neform.isNotice[1].checked == true){
    		if( document.neform.event_start_day.value == "" || document.neform.event_end_day.value == ""){
    			alert("이벤트 시작일과 종료일을 적어주세요.");
    			return false;
    		}
    		if( document.neform.event_start_day.value > document.neform.event_end_day.value){
    			alert("이벤트 종료일은 시작일과 같거나 더 뒤에 종료되어야합니다.");
    			return false;
    		}
    		if(document.neform.notice_file.value == "" ){
    			alert("파일을 첨부하세요.");
    			return false;
    		}
    	}
    	return;
    }
    </script>
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
                <h2>공지사항/이벤트 작성</h2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->




	<!-- 게시판 글 등록 -->
	<div class="boardwrap">
		<h1>공지사항/이벤트 글 등록</h1>
		<form action="NoticeWritePro.no" method="post" enctype="multipart/form-data" name="neform" onsubmit="return noticeCheck()">
			<table id="boardwrite">
				<tr>
					<td class="ftwrite"><label for="notice_subject">제목</label></td>
					<td class="fttitle"><input type="text" name="notice_subject" id="notice_subject" required="required" /></td>
				</tr>
				<tr>
					<td class="ftwrite"><label for="notice_subject">구분</label></td>
					<td class="fttitle"><input type="radio" name="isNotice" value="1">공지사항
													<input type="radio" name="isNotice" value="2">이벤트</td>
				</tr>
				<%//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
				<tr><td class="ftwrite">이벤트 시작일</td><td class="fttitle"><input type="text" id="date_start" placeholder="이벤트시작일" name="event_start_day"></td>
						<script>
$(function() {
  $( "#date_start" ).datepicker({
    dateFormat: 'yy-mm-dd'
  });
});
</script>
				</tr>
				<tr><td class="ftwrite"> 이벤트 종료일</td><td class="fttitle"><input type="text" id="date_end" placeholder="이벤트 종료일" name="event_end_day"></td>
						<script>
$(function() {
  $( "#date_end" ).datepicker({
    dateFormat: 'yy-mm-dd'
  });
});
</script>
				</tr>
				<tr>
					<td class="ftwrite"><label for="notice_content">내용</label></td>
					<td class="fttitle"><textarea name="notice_content" id="notice_content" cols="40" rows="15" required="required" ></textarea></td>
				</tr>
				<tr>
					<td class="ftwrite"><label for="notice_file">파일첨부</label></td>
					<td class="fttitle"><input type="file" name="notice_file" id="notice_file" /></td>
				</tr>
			</table>
			<div id="table_search">
				<input type="submit" value="등록" class="btn"/>&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" class="btn"/>&nbsp;&nbsp;
				<input type="button" value="공지사항 목록" class="btn" onclick="location.href='notice.no'"/>
			</div>
		</form>	
	</div>
</body>
</html>















