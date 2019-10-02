<%@page import="vo.AttendBean"%>
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
  ArrayList<ApplyBean> applyList2 = (ArrayList<ApplyBean>)request.getAttribute("applyList2");
  ArrayList<AttendBean> applyList3 = (ArrayList<AttendBean>)request.getAttribute("applyList3");
  LecturePageInfo applyPageInfo = (LecturePageInfo)request.getAttribute("applyPageInfo");
  String sId = (String)session.getAttribute("sId");
  String isMember =(String)request.getAttribute("isMember"); 
 
  int listCount = applyPageInfo.getListCount();
  int nowPage = applyPageInfo.getPage();
  int startPage = applyPageInfo.getStartPage();
  int endPage = applyPageInfo.getEndPage();
  int maxPage = applyPageInfo.getMaxPage();
  
	String listType = (String)request.getAttribute("listType");
	Calendar cal =Calendar.getInstance();
	double day = (double)cal.get(cal.DATE);
	int progress=0;
  %>
  
<!-- 	선택된 select value 값 넘기기 -->
  <script type="text/javascript">
  
  	function changePeriod() {
  		
  		var langSelect = document.getElementById("period"); 		
  		var lt = langSelect.options[langSelect.selectedIndex].value
  		if(lt == "now"){
  			location.href = "./ApplyInfo.al?listType=now&isMember=<%=isMember%>";
  		}else if(lt == "end"){
  			location.href = "./ApplyInfo.al?listType=end&isMember=<%=isMember%>";
  		}else if(lt == "all"){
  			location.href = "./ApplyInfo.al?listType=all&isMember=<%=isMember%>";
  		}
		
	}

  	function applyReview() {
  		var lecture_idx = document.getElementById("lecture_idx").value; 
  		window.open("./apply/applyReview.jsp?lecture_idx="+lecture_idx ,"","width=800,height=300");	
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
	<select name = "period" id ="period" onchange="changePeriod()">
		<option value="all" <%if(listType.equals("all")){ %> selected="selected"<%} %>>전체 수업</option>
		<option value="now" <%if(listType.equals("now")){ %> selected="selected"<%} %>>진행중인 수업</option>
		<option value="end" <%if(listType.equals("end")){ %> selected="selected"<%} %>>종료된 수업</option>
	</select>
<!-- 		<tr> -->
<!-- 			<td> -->
<!-- 			<a href="lectureList.le?listType=now">진행중</a></td> -->
<!-- 			<td> -->
<!-- 			<a href="lectureList.le?listType=end">종료</a></td></td> -->
<!-- 		</tr> -->

	<table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
	
	<%if(listType.equals("end")){%>
		<colgroup>
			<col width="5%">
			<col width="35%">
			<col width="10%">
			<col width="10%">
			<col width="15%">
			<col width="15%">
			<col width="10%">

	</colgroup>
	<%}else{%>
		<colgroup>
		<col width="5%">
		<col width="45%">
		<col width="10%">
		<col width="10%">
		<col width="15%">
		<col width="15%">
		</colgroup>
	<%}%>
	<%if(applyList.size() == 0) {%>
    <h1><b>작성된 글이 없습니다.</b></h1>
    <%}else{ %>
	<thead>
	<tr>
	<th scope="col">글번호</th>
	<th scope="col">제목</th>
	<th scope="col">과목</th>
	<th scope="col">구매일</th>
	<th scope="col">시작일</th>
	<th scope="col">종료일</th>
	<%if(listType.equals("end")){%>
		<th scope="col">후기</th>
	<%}%>
	</tr>
	</thead>
    <%
    String[] tc = new String[applyList.size()];
    int attend = 0;
    int absent = 0;
    int late = 0;
    System.out.println(applyList.size());
  	//과목 하나당 열 
    for(int i =0; i<applyList.size(); i++){
	LectureBean lectureBean = (LectureBean)applyList.get(i);
	ApplyBean applyBean = (ApplyBean)applyList2.get(i);
	AttendBean attendBean = (AttendBean)applyList3.get(i);
	
	//apply 테이블 과 attend 테이블의 수업이 같은 수업인지 비교
	for(int j=0; j<applyList2.size(); j++ ){
	if(applyBean.getApply_lecture_idx()==attendBean.getAttend_lecture_idx()){
		
	
		tc[i] = attendBean.getAttend_check();
		String[] tcNums =  tc[i].split("/");
		//출석 체크 자른 갯수
		for(int t=0; t<tcNums.length; t++){

			if(!tcNums[t].equals("null")){
				if(String.valueOf(tcNums[t].charAt(0)).equals("0")){
					absent++;
				}else if(String.valueOf(tcNums[t].charAt(0)).equals("l")){
					late++;
				}else{
					attend++;
				}
			}
			
		}
	}
	
	
}
		
		
	%>	
	
	<tbody>
	<tr>
	<td class="num"><%=listCount-i-(10*(nowPage-1))%></td>
	<td class="title">

	<a href="#=<%=lectureBean.getLecture_idx()%>&page=<%=nowPage%>"><%=lectureBean.getLecture_subject() %><br>
	<%if(listType.equals("now")){
		
		String[] en = lectureBean.getLecture_end_day().toString().split("-");
		progress = (int)(day/Integer.parseInt(en[2])*100);
	%>
      <progress id="progress"  max="100" style="width: 100%; height: 2em; " value="<%=progress%>"></progress>
      <%=progress%>% 출석 : <%=attend %> 결석 : <%=absent %> 지각 : <%=late %></a>
      
   <%}%>

	</td>
	<td class="name"><%=lectureBean.getLecture_course() %></td>
	<td class="hit"><%=applyBean.getApply_purchase_date() %></td>
	<td class="date"><%=lectureBean.getLecture_start_day() %></td>
	<td class="date"><%=lectureBean.getLecture_end_day() %></td>
	<%if(listType.equals("end")){
		if(applyBean.getApply_review() != null){%>
			<td>등록완료</td>
		<%}else{ %>
			<td><input type="button" name="review" value="후기등록" onClick="applyReview()"></td>
			<td><input type="hidden" id="lecture_idx" value="<%=lectureBean.getLecture_idx()%>"></td>
		<%}
	}%>
	</tr>
	<%
		}
	} %>
	
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
			<a href="ApplyInfo.al?page=<%=nowPage -1 %>">[이전]</a>&nbsp;
		<%} %>
		
		<%for(int i = startPage ; i <= endPage; i++) {
			if(i == nowPage) {%>
				[<%=i %>]
			<%} else { %>
				<a href = "ApplyInfo.al?page=<%=i %>&listType=<%=listType%>">[<%=i %>]</a>&nbsp;
			<%} %>
		<%} %>
		
		<%if(nowPage >= maxPage){ %>
			&nbsp;[다음]
		<%} else {  %>
			<a href="ApplyInfo.al?page=<%=nowPage +1 %>"> &nbsp;[다음]</a>
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
