<%@page import="vo.LectureBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업정보수정</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./css/bootstrap.css" />
    <link rel="stylesheet" href="./css/flaticon.css" />
    <link rel="stylesheet" href="./css/themify-icons.css" />
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
    <!-- login css -->
    <link rel="stylesheet" href="./css/style.css" />
    <!-- board css -->
    <link rel="stylesheet" href="./css/board.css" />
</head>
<%
	LectureBean article = (LectureBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page");
	System.out.println("티처코드는"+article.getLecture_teacher_code());
	
// 	String weekday = request.getParameter("weekday");
// 	String time = request.getParameter("time");
// 	String lecture_count = request.getParameter("lecture_count");
// 	String lecture_room = request.getParameter("lecture_room");
// 	String lecture_month = request.getParameter("lecture_month");
	ArrayList<MemberBean> tc = (ArrayList<MemberBean>)request.getAttribute("tc");
	String listType = request.getParameter("listType");
%>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">

// $(document).ready(function(){
// 	$("#lecture_course").change(function() {
// 		$.ajax('admin/lecture/test123.jsp',{
			
// 			data:{selCourse:$("#lecture_course option:selected").val()},
// 			success : function(data) {
// 				console.log(data);
// 				$("#lecture_teacher").append("<option value='1'>"+data+"</option>");
// 			}
// 		});
// 	});
// });	


$(document).ready(function(){
	$("#lecture_course").change(function() {
		
		$.ajax({
			type: "POST", //POST로 넘길 것 
			url: "selectTeacher.le",
			data: {'selCourse':$("#lecture_course option:selected").val()}, 
			success: function(data) { 
				$("#lecture_teacher option").remove();
				$("#lecture_teacher").append("<option>선택</option>");
				 $.each(JSON.parse(data)	, function(index, item) { 
					 console.log(data)
					 if(data!="[]"){
						 $("#lecture_teacher").append("<option value=" +item.member_teacher_code+ ">" +item.member_name+ "</option>");
					 }
				 });
			}
		});
	});
});	


function selectTeacher() {
	var sel_lecture_course = lecture_course.options[lecture_course.selectedIndex].text;
	var sel_teacher_code = lecture_teacher.options[lecture_teacher.selectedIndex].value;
	var sel_teacher_name = lecture_teacher.options[lecture_teacher.selectedIndex].text;
	document.up.lecture_course_name.value = sel_lecture_course;
	document.up.lecture_teacher_code.value = sel_teacher_code;
	document.up.lecture_teacher_name.value = sel_teacher_name;
}
function feeCheck(val){
	if(!val.match(/([0-9])/)){
		alert('숫자만 입력하세요.');
		//document.getElementById('result3').value = "숫자만 입력하세요.";
		document.up.lecture_fee.value="";
		document.up.lecture_fee.focus();
}
}
</script>
<body>
	  

	<!-- 게시판 글 등록 -->
	<div class="boardwrap">
    <h1>수업 수정</h1>
     
				<form action="lectureUpdate.le" name="up" method="get" >
    	<table id="boardwrite">
                        <tr>
                        <td class="ftwrite"><label for="lecture_subject">수업명</label></td> 
                        <td class="fttitle"><input type="text" name="lecture_subject" id="lecture_subject"  required="required" placeholder="수업명" value="<%=article.getLecture_subject()%>"></td>
                        </tr> 
                        
                        <tr>
                        <td class="ftwrite"><label for="lecture_course">과목명</label></td>
                        <td class="fttitle">
                        
                        <select name="lecture_course" id="lecture_course" >
                        	<option>선택</option>
  							<option value="j_">java</option>
 							<option value="s_">jsp</option>
  							<option value="o_" >oracle</option>
  							<option value="w_" >web</option>
  							<option value="n_" >network</option>
						</select>
                        </td>
                        </tr>
                        
                        <tr>
                         <td class="ftwrite"><label for="lecture_teacher">수업강사</label> </td> 
                         <td class="fttitle">
                         <select name="lecture_teacher" id="lecture_teacher" onChange="selectTeacher()" >
                         	<option>선택</option>
                         </select>
                         </td>
                        </tr>
                        
<!--                         <tr> -->
<!--                         <td class="ftwrite"><label for="lecture_teacher">수업강사</label> </td>  -->
<!--                         <td class="fttitle"><input type="text" name="lecture_teacher" id="lecture_teacher"  required="required" placeholder="수업강사"> </td></tr> -->
                        
                        <tr>
                        <td class="ftwrite"><label for="lecture_content">수업내용</label> </td> 
                        <td class="fttitle"><textarea name="lecture_content" rows="10" cols="50" style="resize: none;"><%=article.getLecture_content()%></textarea></td>
                        </tr>
                        
             			<tr>
             			<td class="ftwrite"><label for="lecture_fee">회비</label></td> 
             			<td class="fttitle"><input type="text" name="lecture_fee" id="lecture_fee"  required="required" placeholder="회비" value="<%=article.getLecture_fee()%>" onKeyup="feeCheck(this.value)"> </td>
             			</tr>
						
<%-- 						<input type="hidden" name="weekday" value="<%=weekday %>" > --%>
<%-- 						<input type="hidden" name="time" value="<%=time %>" > --%>
<%-- 						<input type="hidden" name="lecture_count" value="<%=lecture_count %>" > --%>
<%--                         <input type="hidden" name="lecture_room" value="<%=lecture_room %>" > --%>
<%--                         <input type="hidden" name="lecture_month" value="<%=lecture_month %>" > --%>
                        <input type="hidden" name="lecture_idx" value="<%=article.getLecture_idx()%>">
                        <input type="hidden" name="page" value="<%=nowPage%>">
                        <input type="hidden" name="listType" value="<%=listType%>">
                        <input type="hidden" name="lecture_course_name"  >
                        <input type="hidden" name="lecture_teacher_code"  >
                        <input type="hidden" name="lecture_teacher_name"  >
                    </table>
                    <div id="table_search">
				<input type="submit" value="수정" class="btn" onClick="updateSubmit()"/>&nbsp;&nbsp;
				<input type="reset" value="취소" class="btn"/>
				</div>
                    </form>	
	
	</div>
	
</body>
</html>





