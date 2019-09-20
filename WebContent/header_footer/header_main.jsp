<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	// 세션값 가져 오기 
	String sId = (String)session.getAttribute("sId");
	
	%>
<header class="header_area">
	<div class="main_menu">
<!-- 		<div class="search_input" id="search_input_box"> -->
<!-- 			<div class="container"> -->
<!-- 				<form class="d-flex justify-content-between" method="" action=""> -->
<!-- 					<input type="text" class="form-control" id="search_input" -->
<!-- 						placeholder="Search Here" /> -->
<!-- 					<button type="submit" class="btn"></button> -->
<!-- 					<span class="ti-close" id="close_search" title="Close Search"></span> -->
<!-- 				</form> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div class="nav-topwrap">
		<ul class="nav-top">
			<%
		if(sId == null){ 
%> 
			<li><a class="nav-top-link" href="member/loginForm.jsp">로그인</a></li>
		<%}else if(sId.equals("admin1234")){
%> 
			<li><a class="nav-top-link" href="admin/adminMain.jsp">관리자페이지</a></li>
			<li><a class="nav-top-link" href="InfoPro.me"><%=sId %>님</a></li>
			<li><a class="nav-top-link" href="LogoutPro.me">로그아웃</a></li>
		<%}else {%>
			<li><a class="nav-top-link" href="InfoPro.me"><%=sId %>님</a></li>
			<li><a class="nav-top-link" href="ApplyInfo.al">내 강의실</a></li>
			<li><a class="nav-top-link" href="LogoutPro.me">로그아웃</a></li>
		<%}%>
		</ul>
		</div>
		

<!-- 		<nav class="navbar navbar-expand-lg navbar-light"> -->
		<nav class="navbar navbar-expand-lg navbar-light">
		
			<div class="container">
		
				<!-- Brand and toggle get grouped for better mobile display -->
				<a class="navbar-brand" href="index.jsp"><img
					src="img/logo.png" alt="" /></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse offset"
					id="navbarSupportedContent">
					<ul class="nav navbar-nav menu_nav ml-auto">
<!-- 						<li class="nav-item active"><a class="nav-link" -->
<!-- 							href="index.jsp">Home</a></li> -->
						<li class="nav-item"><a class="nav-link" href="about-us.jsp">수강신청</a></li>
						<li class="nav-item"><a class="nav-link" href="contact.jsp">오시는 길</a></li>	
						<li class="nav-item"><a class="nav-link" href="about-us.jsp">학원소개</a></li>
<!-- 						<li class="nav-item submenu dropdown"> -->
<!-- 							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" -->
<!-- 							role="button" aria-haspopup="true" aria-expanded="false">강의안내</a> -->
<!-- 							<ul class="dropdown-menu"> -->
<!-- 								<li class="nav-item"><a class="nav-link" href="courses.jsp">Courses</a> -->
<!-- 								</li> -->
<!-- 								<li class="nav-item"><a class="nav-link" -->
<!-- 									href="course-details.jsp">Course -->
<!-- 										Details</a></li> -->
<!-- 								<li class="nav-item"><a class="nav-link" -->
<!-- 									href="elements.jsp">Elements</a></li> -->
<!-- 							</ul></li> -->
							<li class="nav-item"><a class="nav-link" href="courses.jsp">강의안내</a></li>
							<li class="nav-item"><a class="nav-link" href="test.jsp">test</a></li>

						
						<li class="nav-item submenu dropdown"><a class="nav-link dropdown-toggle"
							href="#"data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">자유게시판</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="freeboard.bo">자유게시판</a></li>
								<li class="nav-item"><a class="nav-link" href="qnaboard.bo">Q&A게시판</a></li>
							</ul></li>
						

						<li class="nav-item submenu dropdown"><a class="nav-link dropdown-toggle"
							href="#"data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">학원소식</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="notice.no">공지사항</a></li>
								<li class="nav-item"><a class="nav-link" href="event.no">이벤트</a></li>
							<%if(sId != null){if(sId.equals("admin1234")) {%>
								<li class="nav-item"><a class="nav-link" href="noticeWriteForm.no">공지사항&이벤트입력</a></li>
							<% }}%>
							</ul></li>
						<!-- <li class="nav-item submenu dropdown">
                  <a
                    href="#"
                    class="nav-link dropdown-toggle"
                    data-toggle="dropdown"
                    role="button"
                    aria-haspopup="true"
                    aria-expanded="false"
                    >로그인</a
                  >
                 <ul class="dropdown-menu">
                    <li class="nav-item">
                      <a class="nav-link" href="blog.html">Blog</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="single-blog.html"
                        >Blog Details</a
                      >
                    </li>
                  </ul> 
                </li> -->
						<!-- 190805 김미경 html 로그인 드롭다운 효과 필요없다고 생각되서 백업 -->
<!-- 						<li class="nav-item"><a href="#" class="nav-link search" -->
<!-- 							id="search"> <i class="ti-search"></i> -->
<!-- 						</a></li> -->
					</ul>
				</div>
			</div>
		</nav>
	</div>
</header>