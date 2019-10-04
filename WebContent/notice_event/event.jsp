<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.NoticeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="icon" href="img/favicon.png" type="image/png" />
<title>Event</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/flaticon.css" />
<link rel="stylesheet" href="css/themify-icons.css" />
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
<!-- main css -->
<link rel="stylesheet" href="css/style.css" />
</head>
<style>
.col-lg-5{width:1200px; margin:0 auto; max-width:none;}
</style>
<%
	//이벤트 목록 가져오기
	ArrayList<NoticeBean> eventList = (ArrayList<NoticeBean>) request.getAttribute("eventList");
%>
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
							<h2>Courses</h2>
							<div class="page_link">
								<a href="index.jsp">Home</a> <a href="event.jsp">Event</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->
	<div class="popular_courses section_gap_top">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<div class="main_title">
						<h2 class="mb-3">EVENT</h2>
						<p style="padding-bottom: 70px;">이벤트</p>

						<table>
							<%
							
								if (eventList.size() != 0) {
							%>
							<tr>
								<%
									for (int i = 0; i < eventList.size(); i++) {//이벤트 갤러리 형식으로 보이기 (가로 2)
											NoticeBean noticeBean = (NoticeBean) eventList.get(i);
													int a = 1 + i;
													if (a % 2 >= 0) {
								%>
								<td><a href="noticeView.no?notice_idx=<%=noticeBean.getNotice_idx()%>"><img src="noticeUpload/<%=noticeBean.getNotice_file()%>" 
								width="400" height="200" style="padding: 20px 50px 20px 0;"><br>
									<%=noticeBean.getNotice_subject()%><br>
									 <b>이벤트 종료일 :</b><%=noticeBean.getEvent_end_day()%></a></td>
								<%
									}
													if (a % 2 == 0) {
								%>
							</tr>
							<tr>
								<%
									}
									}
								%>
							</tr>
							<%
								}else{
							%>
								<h1><b>현재 진행중인 이벤트가<br> 없습니다.</b></h1>
						<%} %>


						</table>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!--================ Start Popular Courses Area =================-->

	<!--================ End Popular Courses Area =================-->

	<!--================ Start Registration Area =================-->

	<!--================ End Registration Area =================-->

	<!--================ Start Feature Area =================-->

	<!--================ End Feature Area =================-->

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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="js/gmaps.min.js"></script>
	<script src="js/theme.js"></script>
</body>
</html>
