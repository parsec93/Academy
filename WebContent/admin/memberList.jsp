<%@page import="vo.MemberBean"%>
<%@page import="vo.NoticePageInfo"%>
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
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="icon" href="img/favicon.png" type="image/png" />
    <title>회원관리</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/flaticon.css" />
    <link rel="stylesheet" href="css/themify-icons.css" />
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
    <!-- main css -->
    <link rel="stylesheet" href="css/style.css" />
     <!-- board css -->
	<link rel="stylesheet" href="css/board.css" />
	<script type="text/javascript">
	
	function ne(op){
		location.href="Member.me?mList="+op;
	}
	</script>
	
  </head>
<%

ArrayList<MemberBean> memberList = (ArrayList<MemberBean>)request.getAttribute("memberList");// 멤버목록을 위한 객체 
NoticePageInfo noticePageInfo = (NoticePageInfo)request.getAttribute("memberPageInfo");

//pageInfo 객체로부터 페이징 정보 가져오기 
 int listCount = noticePageInfo.getListCount();
 int nowPage = noticePageInfo.getPage();
 int startPage = noticePageInfo.getStartPage();
 int endPage = noticePageInfo.getEndPage();
 int maxPage = noticePageInfo.getMaxPage();

String sid = (String)session.getAttribute("sid");

%>

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
                <h2>회원명단</h2>
                </div>
              </div>
            </div>
          </div>
        </div>
    </section>
    <!--================End Home Banner Area =================-->
	<!-- 리스트 공지사항 시작-->
	<div class="boardwrap">
	<h1>회원명단</h1>
	<div>
 	<form action="Member.me" name="fr" method="get" onchange="ne(mList.value)"> 
	<%-- <select name = "mList">
	<option value = "0" <%if(mList.equals("0")){ %> selected="selected"<%//} %>>[전체 회원]</option>
	<option value = "1" <%if(mList.equals("1")){ %> selected="selected"<%//} %>>[수강중]</option>
	<option value="2" <%if(mList.equals("2")){ %> selected="selected"<%//} %>>[강의완료]</option>
	</select> --%>
</form> 
	</div>
	<table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
	<caption>회원 명단</caption>
    <colgroup>
	<col width="10%">
	<col width="6%">
	<col width="20%">
	<col width="30%">
	<col width="40%">

	</colgroup>
              <%if(memberList == null) {%>
              <h1><b>회원이 없습니다.</b></h1>
              <%}else{ %>
				<thead>
				<tr>
					<th scope="col">회원번호</th>
					<th scope="col">회원이름</th>
					<th scope="col">회원ID</th>
					<th scope="col">연락처</th>
					<th scope="col">E-mail</th>
				</tr>
					</thead>
					<%
 					for(int i =0 ; i<memberList.size(); i++){
 						MemberBean memberBean = (MemberBean)memberList.get(i);
						%>
					<tbody>
						<tr onclick="location.href='ApplyInfo.al?listType=all&studentId=<%=memberBean.getMember_id()%>'">
							<td class="num"><%=memberBean.getMember_idx() %></td>
							<td class="num"><%=memberBean.getMember_name() %></td>
							<td class="num"><%=memberBean.getMember_id() %></td>
							<td class="num"><%=memberBean.getMember_phone() %></td>
							<td class="num"><%=memberBean.getMember_email() %></td>
						</tr>
						<%
					}
					%>	
				<%} %>

				</tbody>
				</table>

<!-- // 페이징 처리 구역  -->
	<div id="page_control">

		<%
		if(nowPage <= 1 ) { %>
			[이전]&nbsp;
		<%} else { %>
			<a href="Member.me?page=<%=nowPage -1 %>">[이전]</a>&nbsp;
		<%} %>
		
		<%for(int i = startPage ; i <= endPage; i++) {
			if(i == nowPage) {%>
				[<%=i %>]
			<%} else { %>
				<a href = "Member.me?page=<%=i %>">[<%=i %>]</a>&nbsp;
			<%} %>
		<%} %>
		
		<%if(nowPage >= maxPage){ %>
			&nbsp;[다음]
		<%} else {  %>
			<a href="Member.me?page=<%=nowPage +1 %>"> &nbsp;[다음]</a>
		<%} %> 



<input type="button" class="btn" value="메인으로" onclick="location.href='../Academy'">
<!-- 페이징 처리 구역 종료 -->
                    </div>
                      </div>
 
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