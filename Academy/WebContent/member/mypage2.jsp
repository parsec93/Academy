<%@page import="vo.MemberBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sId = (String)session.getAttribute("sId");
if(sId==null){
	out.println("<script>");
	out.println("alert('로그인필요!')");
	out.println("location.href='index.jsp'");
	out.println("</script>");
}
MemberBean memberBean = (MemberBean)request.getAttribute("memberBean");
// out.println(memberBean.getMember_name());
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항/이벤트 작성</title>


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
<script>
function mySubmit(index) {
	if (index == 1) {
	document.myForm.action='member/updateForm.jsp';
	}
	if (index == 2) {
	document.myForm.action='member/updatePassword.jsp';
	}
	document.myForm.submit();
}
</script>
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
                <h2>마이페이지</h2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->




	<!-- 게시판 글 등록 -->
	<div class="boardwrap">
		<h1>마이페이지</h1>
		<form action="NoticeWritePro.no" method="post" enctype="multipart/form-data" name="neform" onsubmit="return noticeCheck()">
			<table id="boardwrite">
				<tr>
					<td class="ftwrite"><label for="notice_subject">이름</label></td>
					<td class="fttitle"><label for="notice_subject"><%=memberBean.getMember_name() %></label></td>
					<input type="hidden" name="name" id="name" class="inpt" value="<%=memberBean.getMember_name() %>" >
				</tr>
				<tr>
					<td class="ftwrite"><label for="notice_subject">아이디</label></td>
					<td class="fttitle"><label for="notice_subject"><%=sId %></label></td>
					<input type="hidden" name="password" id="password" class="inpt" value="<%=memberBean.getMember_pass() %>" >
				</tr>
				<%//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
				<tr><td class="ftwrite">이벤트 시작일</td><td class="fttitle"><input type="text" id="date_start" placeholder="이벤트시작일" name="event_start_day"></td>

				</tr>
				<tr><td class="ftwrite"> 이벤트 종료일</td><td class="fttitle"><input type="text" id="date_end" placeholder="이벤트 종료일" name="event_end_day"></td>

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
				<input type="reset" value="다시쓰기" class="btn"/>
			</div>
		</form>	
	</div>
</body>
</html>















