<%@page import="vo.NoticeBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
NoticeBean noticeBean = (NoticeBean)request.getAttribute("noticeBean");

String content =noticeBean.getNotice_content();
if(content != null){
	//   \r \n =><br> 바꾸기
	content = content.replace("\r\n", "<br>");
}


String sId = (String)session.getAttribute("sId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="icon" href="img/favicon.png" type="image/png" />
<title>공지사항/이벤트</title>
<!--   <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" /> -->
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->
<!-- <script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->

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
                <h2>공지사항/이벤트</h2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

	<!-- 게시판 글 등록 -->
		<div class="boardwrap">
		<form action="#" method="post" enctype="multipart/form-data" name="boardform">
			<table id="sub_news">
				<h1 id="bo_v_title"><b><%=noticeBean.getNotice_subject() %></b></h1>				
					<section id="bo_v_info">
					<div class="boardleft">

				<%if(noticeBean.getIsNotice() == 2){ %>
				 <span class="bo_v_date">
				<p class="boardlefttext">이벤트 시작일 :<span> <%=noticeBean.getEvent_start_day() %></span></p>
				
				<p class="boardlefttext">이벤트 종료일 :<span><%=noticeBean.getEvent_end_day() %></span></p>
				</span>
				<%} %>
					
		</div>
    	<div class="boardright">
					<p class="boardlefttext">파일첨부<span>
					<%if(noticeBean.getNotice_file() == null){ %>
					첨부된 파일이 없습니다.</span></p>
					<%}else{ %>
					<a href="notice_event/ne_File_down.jsp?ne_File_name=<%=noticeBean.getNotice_file()%>"><%=noticeBean.getNotice_file() %></a>
				<% } %></span></p>
				</div>
				</section>
				
			 <!-- 본문 내용 -->
				    <section id="bo_v_atc"> 
					<%if(noticeBean.getNotice_file() != null){ %>
					<img src="noticeUpload/<%=noticeBean.getNotice_file()%>"><br> <%} %>
					<%=content %>
				    </section>
			</table>
			<div id="table_search">
				<input type="button" value="공지사항 목록" class="btn" onclick="location.href='notice.no'"/>&nbsp;&nbsp;
				<input type="button" value="이벤트 목록" class="btn" onclick="location.href='event.no'"/>&nbsp;&nbsp;
				<%if(sId != null){if(sId.equals("admin1234")){ %>
					<a href="noticeUpdateForm.no?notice_idx=<%=noticeBean.getNotice_idx()%>">
					<input type="button" value="수정" class="btn" /></a>
					<%}} %>
			</div>
		</form>	
	</div>
</body>
</html>















