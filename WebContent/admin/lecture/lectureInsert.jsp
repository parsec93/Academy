<%@page import="java.util.List"%>
<%@page import="vo.LectureBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업정보등록</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

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
<script type="text/javascript">
	function insert(weekday, time, count){
		var lecture_room_val = lecture_room.options[lecture_room.selectedIndex].value;
		window.open("admin/lecture/lectureInsertForm.jsp?weekday="+weekday+"&time="+time+"&lecture_count="+count+"&lecutre_room=?"+lecture_room_val,"","width=600,height=550");	
	}
	function changeRoom() {
		var lecture_room_val = lecture_room.options[lecture_room.selectedIndex].value;
		location.href='lectureInsert.le?lecture_room=' + lecture_room_val;
	}
</script>
<%
	List<LectureBean> list = (List<LectureBean>)request.getAttribute("list");
	int[] lecture_counts = (int[])request.getAttribute("lecture_counts");
	int indexCount = 0;
	String lecture_room = (String)request.getAttribute("lecture_room");
	System.out.println("lecture_room은 "+lecture_room);
	if(lecture_room == null){
		lecture_room="1";
	}
%>
<body>
    <!--================ Start Header Menu Area =================-->
    <jsp:include page="/header_footer/header.jsp" />
    <!--================ End Header Menu Area =================-->
	  
    <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="overlay"></div>
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-6">
              <div class="banner_content text-center">
                <h2>수업정보등록</h2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

	<!-- 게시판 글 등록 -->
	<div class="boardwrap">
    <h1>수업 정보</h1>
     
				<form action="lectureInsertPro.le" name="up" method="post" >
                    
                    <select name="lecture_room" id="lecture_room" onchange="changeRoom()">
                        <option value="1" <%if(lecture_room.equals("1")){ %> selected="selected"<%} %>>1 강의실</option>
                        <option value="2" <%if(lecture_room.equals("2")){ %> selected="selected"<%} %>>2 강의실</option>
                    </select>
                    <table id="boardwrite">
                    
                    	<tr>
                    	<td>시간</td>
                    	<td>월,수,금</td> 
                    	<td>화,목</td> 
                    	</tr>
                    	<tr>
                    	<td class="ftwrite">오전</td>
                    	<td onClick="insert(1,1,1)">
                    	<%if(lecture_counts[indexCount] == 1){ 
                    		LectureBean lb = list.get(indexCount);%>
                    		<%=lb.getLecture_subject() %>    
                    		<%=lb.getLecture_teacher() %>  
                    	<%indexCount++;
                    		}else{ %>
                    		수업등록
                    	<%} %>
                    	</td> 
                    	<td onClick="insert(2,1,2)">
                    	<%if(lecture_counts[indexCount] == 2){ 
                    		LectureBean lb = list.get(indexCount);%>
                    		<%=lb.getLecture_subject() %>    
                    		<%=lb.getLecture_teacher() %>  
                    	<%indexCount++;
                    	}else{ %>
                    		수업등록
                    	<%} %>
                    	</td> 
                    	</tr>
                    	<tr>
                    	<td class="ftwrite">오후</td>
                    	<td onClick="insert(1,2,3)">
                    	<%if(lecture_counts[indexCount] == 3){ 
                    		LectureBean lb = list.get(indexCount);%>
                    		<%=lb.getLecture_subject() %>    
                    		<%=lb.getLecture_teacher() %>  
                    	<%indexCount++;
                    	}else{ %>
                    		수업등록
                    	<%} %>
                    	</td> 
                    	<td onClick="insert(2,2,4)">
                    	<%if(lecture_counts[indexCount] == 4){ 
                    		LectureBean lb = list.get(indexCount);%>
                    		<%=lb.getLecture_subject() %>    
                    		<%=lb.getLecture_teacher() %>  
                    	<%indexCount++;
                    	}else{ %>
                    		수업등록
                    	<%} %>
                    	</td> 
                    	</tr>
                    	<tr>
                    	<td class="ftwrite">저녁</td>
                    	<td onClick="insert(1,3,5)">
                    	<%if(lecture_counts[indexCount] == 5){ 
                    		LectureBean lb = list.get(indexCount);%>
                    		<%=lb.getLecture_subject() %>    
                    		<%=lb.getLecture_teacher() %>  
                    	<%indexCount++;
                    	}else{ %>
                    		수업등록
                    	<%} %>
                    	</td> 
                    	<td onClick="insert(2,3,6)">
                    	<%if(lecture_counts[indexCount] == 6){ 
                    		LectureBean lb = list.get(indexCount);%>
                    		<%=lb.getLecture_subject() %>    
                    		<%=lb.getLecture_teacher() %>  
                    	<%indexCount++;
                    	}else{ %>
                    		수업등록
                    	<%} %>
                    	</td> 
                    	</tr>
                    </table>
                    
                    <div id="table_search">
				<input type="submit" value="등록" class="btn"/>&nbsp;&nbsp;
				<input type="reset" value="취소" class="btn"/>
				</div>
                    </form>	
	
	</div>
</body>
</html>















