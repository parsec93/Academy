<%@page import="vo.AttendBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="vo.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
	ArrayList<MemberBean> applyMemberList = (ArrayList<MemberBean>) request.getAttribute("applyMemberList");
	String lecture_idx = (String)request.getAttribute("lecture_idx");
	ArrayList<AttendBean> todayCheck = (ArrayList<AttendBean>)request.getAttribute("todayCheck");
	
	DecimalFormat df = new DecimalFormat("00");
	Calendar cal = Calendar.getInstance();
	String year = Integer.toString(cal.get(Calendar.YEAR));
	String month = df.format(cal.get(Calendar.MONTH)+1);
	String day = df.format(cal.get(Calendar.DATE));
	String dayone = String.valueOf(day.charAt(0));
	int week = cal.get(Calendar.DAY_OF_WEEK);
	   String strWeek = "";
	   switch(week){
	      case 1:
	    	  strWeek = "일요일";
	         break;
	      case 2:
	    	  strWeek = "월요일";
	         break;
	      case 3:
	    	  strWeek = "화요일";
	         break;
	      case 4:
	    	  strWeek = "수요일";
	         break;
	      case 5:
	    	  strWeek = "목요일";
	         break;
	      case 6:
	    	  strWeek = "금요일";
	         break;
	      case 7:
	    	  strWeek = "토요일";
	         break;

	      }
	String date = year+" "+ month +" "+day+" "+ strWeek;
	 
	%>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="icon" href="img/favicon.png" type="image/png" />
<title>login</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/flaticon.css" />
<link rel="stylesheet" href="css/themify-icons.css" />
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
<!-- main css -->
<link rel="stylesheet" href="css/login.css" />
<link rel="stylesheet" href="css/style.css" />
</head>
<script src="js/jquery-3.4.1.js"></script>
<script type="text/JavaScript"
	src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/JavaScript"
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function attendCheck(mListSize) {
		var today = new Date();
		var attend_m_id = "";
		var checks = "";
		var dd = today.getDate();
		
		for(var i = 0; mListSize > i ; i++){
				attend_m_id += $("#m_id"+i).val();
				attend_m_id += "/";
				
			if($("#attendcheck"+i).is(":checked")){
				checks += dd +"/";
			}else{
				checks += "0/";
				
			}
			
		}
		
		document.getElementById('cYN').value = checks;
		document.getElementById('attendmember').value = attend_m_id;
	}
</script>

<body>

	<!--================ Start Login Area =================-->

	<div class="login_container">
		<article class="half">
			<a href="#">수강학생관리</a>
			<div class="tabs">
				<span class="tab signin active"><a href="#signin">수강학생목록</a></span>
				<span class="tab signup"><a href="#signup">출결 관리</a></span>
			</div>
			<div class="content">
				<div class="signin-cont cont">

					<table class="teacherwrap">
						<%
							if (applyMemberList == null) {
						%>
						<h1>수강한 학생이 없습니다</h1>
						<%
							} else {
						%>

						<tr>
							<td>이름</td>
							<td>아이디</td>
							<td>전화번호</td>

						</tr>
						<%
							for (int i = 0; i < applyMemberList.size(); i++) {
									MemberBean memberBean = (MemberBean) applyMemberList.get(i);
						%>
						<tr style="cursor: pointer;">
							<td class="code"><%=memberBean.getMember_name()%></td>
							<td class="code"><%=memberBean.getMember_id()%></td>
							<td class="phone"><%=memberBean.getMember_phone()%></td>
						</tr>
						<%
							}

						}
						%>

					</table>


				</div>
				<div class="signup-cont cont">
					<form action="ApplyAttendCheck.al" name="up" method="post" onsubmit="return attendCheck(<%=applyMemberList.size()%>)">
						<table class="teacherwrap">
							<%
								if (applyMemberList == null) {
							%>
							<h1>수강한 학생이 없습니다</h1>
							<%
								} else {
							%>

							<tr>
								<td>이름</td>
								<td>출석  <%=date %></td>

							</tr>
							<%
// 								for (int i = 0; i < applyMemberList.size(); i++) {
// 										MemberBean memberBean = (MemberBean) applyMemberList.get(i);
// 										AttendBean attendBean = new AttendBean();
// 										String[] tc = new String[applyMemberList.size()-1];
// 										if(attendBean.getAttend_check() != null){
// 											for(int j=0; j<applyMemberList.size(); j++){
// 												attendBean = (AttendBean) todayCheck.get(j);
// 												if(attendBean.getAttend_member_id().equals(memberBean.getMember_id())){
// 													tc = attendBean.getAttend_check().split("/");
// 												}
// 											}
// 										}
										String[] tc = new String[applyMemberList.size()];
										for (int i = 0; i < applyMemberList.size(); i++) {
											MemberBean memberBean = (MemberBean) applyMemberList.get(i);
											AttendBean attendBean = new AttendBean();
											
											for(int j = 0; j<applyMemberList.size(); j++){
												attendBean = (AttendBean) todayCheck.get(j);
												if(memberBean.getMember_id().equals(attendBean.getAttend_member_id())){
											    tc[i]  =  attendBean.getAttend_check();
											}
												
										}
												String[] tcs = tc[i].split("/");	
												tc[i] = tcs[tcs.length-1];
								
									

										
							%>
							<tr style="cursor: pointer;">
								<td class="code"><input type="hidden" id="m_id<%=i %>" name="m_id" value="<%=memberBean.getMember_id()%>">
								<%=memberBean.getMember_name()%></td>
								
								<%
									if(dayone.equals("0")){
										day = day.substring(1);
									}
								System.out.println(day);
								System.out.println(dayone);
								if (tc[i].equals(day) || tc[i].equals("la"+day)){
							    	%>
							    	<td class="code"><input type="checkbox" id="attendcheck<%=i %>" name="attendcheck" checked="checked"></td>
							    	<%
							    }else{							
								%>
								<td class="code"><input type="checkbox" id="attendcheck<%=i %>" name="attendcheck"></td>
								<% }%>
								<input type="hidden" id="attendmember" name="attendmember" >
								<input type="hidden" id="cYN" name="cYN">
								
							</tr>
							<%
								}

							}
							%>
							<input type="hidden" name="lecture_idx" value="<%=lecture_idx %>">
							<input type="hidden" name="attendDay" value="<%=day %>">
						</table>

						<div class="submit-wrap">
							<input type="submit" value="Sign up" class="submit"> <a
								href="#" class="more">Terms and conditions</a>
						</div>
					</form>
				</div>


			</div>
		</article>
		<div class="half bg"></div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript">
		$('.tabs .tab').click(function() {
			if ($(this).hasClass('signin')) {
				$('.tabs .tab').removeClass('active');
				$(this).addClass('active');
				$('.cont').hide();
				$('.signin-cont').show();
			}
			if ($(this).hasClass('signup')) {
				$('.tabs .tab').removeClass('active');
				$(this).addClass('active');
				$('.cont').hide();
				$('.signup-cont').show();
			}
		});
		$('.container .bg').mousemove(
				function(e) {
					var amountMovedX = (e.pageX * -1 / 30);
					var amountMovedY = (e.pageY * -1 / 9);
					$(this).css('background-position',
							amountMovedX + 'px ' + amountMovedY + 'px');
				});
		//=======아이디 중복체크 ========
	</script>

	<!--================ End Login Area =================-->
</body>
</html>