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
	document.neform.action='member/updateForm.jsp';
	}
	if (index == 2) {
	document.neform.action='member/updatePassword.jsp';
	}
	if(index == 3){
// 		document.neform.action ='member/deleteForm.jsp'; 
			window.open("member/deleteForm.jsp?member_idx="+<%=memberBean.getMember_idx()%>, "", "width=400,height =300");

	}
	document.neform.submit();
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
		<form name='neform' method="post" >
			<table id="boardwrite">
				<tr>
					<td class="ftwrite"><label for="notice_subject">이름</label></td>
					<td class="fttitle"><label for="notice_subject"><%=memberBean.getMember_name() %></label></td>
					<input type="hidden" name="name" id="name" class="inpt" value="<%=memberBean.getMember_name() %>" >
					<input type="hidden" name="member_idx" id="member_idx" class="inpt" value="<%=memberBean.getMember_idx() %>" >
				</tr>
				<tr>
					<td class="ftwrite"><label for="notice_subject">아이디</label></td>
					<td class="fttitle"><label for="notice_subject"><%=sId %></label></td>
					<input type="hidden" name="id" id="id" class="inpt_02" value="<%=sId %>" required="required" placeholder="Your id">
					<input type="hidden" name="password" id="password" class="inpt" value="<%=memberBean.getMember_pass() %>" >
				</tr>
				<%//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
				<tr><td class="ftwrite">E-mail</td>
					<td class="fttitle"><label for="notice_subject"><%=memberBean.getMember_email() %></label></td>
					<input type="hidden" name="email" id="email" class="inpt_04" value="<%=memberBean.getMember_email() %>" required="required" placeholder="Your email">
				</tr>
				<tr><td class="ftwrite">주소</td>
					<td class="fttitle"><label for="notice_subject"><%=memberBean.getMember_postcode() %>&nbsp;번지<br>
					<%=memberBean.getMember_add1() %>&nbsp;<%=memberBean.getMember_add2() %></label></td>
					<input type="hidden" name="postcode" id="postcode" class="inpt_02" value="<%=memberBean.getMember_postcode() %>" required="required" placeholder="우편번호">
					<input type="hidden" name="add1" id="address_more1" class="inpt" value="<%=memberBean.getMember_add1() %>" required="required" placeholder="상세주소">
                    <input type="hidden" name="add2" id="address_more2" class="inpt" value="<%=memberBean.getMember_add2() %>" required="required" placeholder="상세주소">
				</tr>
				<tr>
					<td class="ftwrite"><label for="notice_content">전화번호</label></td>
					<td class="fttitle"><label for="notice_content"><%=memberBean.getMember_phone() %></label></td>
					<input type="hidden" name="phone" id="phone" class="inpt" value="<%=memberBean.getMember_phone() %>" required="required" placeholder="휴대폰 번호">
				</tr>
			</table>
               <div  id="table_search">
					<input type='button' value="회원 수정" onClick='mySubmit(1)' class="btn">
					<input type='button' value="비밀번호 수정" onClick='mySubmit(2)' class="btn">
					<input type='button' value="탈퇴하기" onClick='mySubmit(3)' class="btn">
               </div>
         
		</form>	
	</div>
</body>
</html>















