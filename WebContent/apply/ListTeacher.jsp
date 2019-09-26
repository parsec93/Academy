<%@page import="java.util.Calendar"%>
<%@page import="vo.ApplyBean"%>
<%@page import="vo.LecturePageInfo"%>
<%@page import="vo.LectureBean"%>
<%@page import="java.util.ArrayList"%>
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
    <title>내강의실</title>
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
    
   <!--  progress 바 css  -->
    <style type="text/css">
  	body#progress { 
        position:absolute;
        left:50%;
        top:8px;
        font-weight:bold;
        margin-left:-40px;
    }
</style>
  </head>
  <%
  ArrayList<LectureBean> applyList = (ArrayList<LectureBean>)request.getAttribute("applyList");
  LecturePageInfo applyPageInfo = (LecturePageInfo)request.getAttribute("applyPageInfo");
  String isMember =(String)request.getAttribute("isMember"); 
 
  int listCount = applyPageInfo.getListCount();
  int nowPage = applyPageInfo.getPage();
  int startPage = applyPageInfo.getStartPage();
  int endPage = applyPageInfo.getEndPage();
  int maxPage = applyPageInfo.getMaxPage();
  
	Calendar cal =Calendar.getInstance();
	double day = (double)cal.get(cal.DATE);
	int progress=0;
	
	String Lecture_week_day="";

  %>
  
<!-- 	선택된 select value 값 넘기기 -->
  <script type="text/javascript">
  	function applyListMember(lecture_idx) {
		window.open("ApplyMemberList.al?lecture_idx="+lecture_idx,"","width=600,height=550");		
	}

  </script>

  <body>
    <!--================ Start Header Menu Area =================-->
    <jsp:include page="/header_footer/header.jsp" >
    	<jsp:param name="isMember" value="<%=isMember %>"/>
    </jsp:include>
    <!--================ End Header Menu Area =================-->
	  
    <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="overlay"></div>
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-6">
              <div class="banner_content text-center">
                <h2>수강 목록</h2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->
	
	

	<!-- 리스트 게시판 시작-->
	
	<div class="boardwrap">
	<h1>수강 목록</h1>

<!-- 		<tr> -->
<!-- 			<td> -->
<!-- 			<a href="lectureList.le?listType=now">진행중</a></td> -->
<!-- 			<td> -->
<!-- 			<a href="lectureList.le?listType=end">종료</a></td></td> -->
<!-- 		</tr> -->

	<table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
	

		<colgroup>
		<col width="5%">
		<col width="45%">
		<col width="15%">
		<col width="15%">
		<col width="20%">

		</colgroup>
	<%if(applyList.size() == 0) {%>
    <h1><b>작성된 글이 없습니다.</b></h1>
    <%}else{ %>
	<thead>
	<tr>
	<th scope="col">글번호</th>
	<th scope="col">제목</th>
	<th scope="col">강의실</th>
	<th scope="col">강의시간</th>
	<th scope="col">요일</th>
	</tr>
	</thead>
    <%
    for(int i =0 ; i<applyList.size(); i++){
	LectureBean lectureBean = (LectureBean)applyList.get(i);

	%>	
	
	<tbody>
	<tr>
	<td class="num"><%=listCount-i-(10*(nowPage-1))%></td>
	<td class="title">

	<a onclick="applyListMember(<%=lectureBean.getLecture_idx()%>)"><%=lectureBean.getLecture_subject() %>

		<% 	String[] en = lectureBean.getLecture_end_day().toString().split("-");
		progress = (int)(day/Integer.parseInt(en[2])*100);
	%>
      <progress id="progress"  max="100" style="width: 100%; height: 2em; " value="<%=progress%>"></progress><%=progress%>%
	</a>
	</td>
	<td class="name"><%=lectureBean.getLecture_room() %>강의실</td>
	<td class="hit"><%=lectureBean.getLecture_time() %></td>
	 <%if(lectureBean.getLecture_week_day().equals("1")) {
    		Lecture_week_day =  "월,수,금";
    }else if(lectureBean.getLecture_week_day().equals("2")){
    	 		 Lecture_week_day =  "화,목";
    } %>
	<td class="date"><%=Lecture_week_day%></td>
	</tr>
	
	<%
		}
    }
	%>
	
	<!-- tr이 제목 1줄입니다 보일 list 갯수만큼 li반복합니다.-->
	</tbody>
	</table>
	<div id="table_search">
<!-- 	<input type="button" value="수업등록" class="btn" onclick="location.href='lectureInsert.le'"> -->
	</div>

	
	
	<div id="page_control">
	
		<%
		if(nowPage <= 1 ) { %>
			[이전]&nbsp;
		<%} else { %>
			<a href="InfoTeacher.al?page=<%=nowPage -1 %>">[이전]</a>&nbsp;
		<%} %>
		
		<%for(int i = startPage ; i <= endPage; i++) {
			if(i == nowPage) {%>
				[<%=i %>]
			<%} else { %>
				<a href = "InfoTeacher.al?page=<%=i %>">[<%=i %>]</a>&nbsp;
			<%} %>
		<%} %>
		
		<%if(nowPage >= maxPage){ %>
			&nbsp;[다음]
		<%} else {  %>
			<a href="InfoTeacher.al?page=<%=nowPage +1 %>"> &nbsp;[다음]</a>
		<%} %>


<!-- 페이징 처리 구역 종료 -->
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
