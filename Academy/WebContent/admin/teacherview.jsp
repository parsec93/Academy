<%@page import="vo.MemberBean"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDAO memberDAO = MemberDAO.getInstance();
	MemberBean memberBean = (MemberBean) request.getAttribute("teacher");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 정보</title>

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

<script type="text/javascript">
// function TeacherDelete(){
// 	if (confirm("해당 계정을 삭제 하겠습니까?")){ 
// 		document.up.action='techerDelete.jsp';
// // 		location.href='TeacherList.me';
// 		}else{ 
// 		alert("삭제 취소 되었습니다."); 
// 		return; 
// 		}	
// }
</script>
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
                <h2>교직원 정보</h2>
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
		<form action="TeacherDeleteForm.me?member_idx=<%=memberBean.getMember_idx() %>" name='up' method="post" >
		<input type="hidden" name="id"  value="<%=memberBean.getMember_id()%>">
<%-- 		<input type="hidden" name="name"  value="<%=memberBean.getMember_name()%>"> --%>
			<table id="boardwrite">
				<tr>
					<td class="ftwrite"><label for="notice_subject">이름</label></td>
					<td class="fttitle"><label for="notice_subject"><%=memberBean.getMember_name() %></label></td>
					<input type="hidden" name="name" id="name" class="inpt" value="<%=memberBean.getMember_name() %>" >
					
					<td class="ftwrite" rowspan="4" colspan="1" >
					<% if(memberBean.getMember_picture() != null){%>
					<img alt="증명사진" src="memberUpload/<%=memberBean.getMember_picture()%>" width="250" height="300">
					<%}else{ %> 사진을 첨부하세요<%} %></td>
					</tr>
					<tr>
					<td class="ftwrite"><label for="notice_subject">아이디</label></td>
					<td class="fttitle"><label for="notice_subject"><%=memberBean.getMember_id()%></label></td>
					<input type="hidden" name="id" id="id" class="inpt_02" value="<%=memberBean.getMember_id()%>" required="required" placeholder="Your id">
					<input type="hidden" name="password" id="password" class="inpt" value="<%=memberBean.getMember_pass() %>" >
				</tr>
				<%//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
				
				<tr><td class="ftwrite">주민등록번호</td>
					<td class="fttitle"><label for="notice_subject"><%=memberBean.getMember_jumin() %></label></td>
					<input type="hidden" name="jumin" id="jumin" class="inpt_04" value="<%=memberBean.getMember_jumin() %>" required="required" placeholder="Your email">
				</tr>
				
				<tr><td class="ftwrite">E-mail</td>
					<td class="fttitle"><label for="notice_subject"><%=memberBean.getMember_email()%></label></td>
					<input type="hidden" name="email" id="email" class="inpt_04" value="<%=memberBean.getMember_email()%>" required="required" placeholder="Your email">
				</tr>
				<tr><td class="ftwrite">주소</td>
					<td class="fttitle"><label for="notice_subject">우편번호 &nbsp; : &nbsp;<%=memberBean.getMember_postcode()%>&nbsp;<br>
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
				
				<tr><td class="ftwrite">계좌번호</td>
					<td class="fttitle"><label for="notice_subject">
					<% String bank = "";
					switch(memberBean.getMember_bank()){
					case "1" : 
						bank = "부산은행"; 
						break;
					case "2" : 
						bank = "국민은행"; 
						break;
					case "3" : 
						bank = "우리은행"; 
						break;
					case "4" : 
						bank = "하나은행"; 
						break;
					case "5" : 
						bank = "농협"; 
						break;
					default : 
						bank = "은행을 입력하세요.";
					}%>
					<%=bank%>
					<br>
					<%=memberBean.getMember_accno()%></label></td>
					<input type="hidden" name="bank" id="bank" class="inpt_02" value="<%=memberBean.getMember_bank() %>" required="required" placeholder="은행">
					<input type="hidden" name="accno" id="accno" class="inpt" value="<%=memberBean.getMember_accno()%>" required="required" placeholder="계좌번호">
				</tr>

			</table>
               <div  id="table_search">
					<input type="submit" value="계정 삭제" class="btn">
					<input type='button' value="교사 목록" onClick="location.href='TeacherList.me'" class="btn">
<!-- 					<input type='button' value="비밀번호 수정" onClick='mySubmit(2)' class="btn"> -->
               </div>
         
		</form>	
	</div>



</body>
</html>















