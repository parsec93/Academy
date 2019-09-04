<%@page import="vo.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
ArrayList<MemberBean> teacherList = (ArrayList<MemberBean>)request.getAttribute("teacherList");

%>
<body>
<table>
              <%if(teacherList == null) {%>
              <h1>등록된 선생님이 없습니다</h1>
              <%}else{ %>
				
				<tr>
					<td>교사코드</td>
					<td>이름</td>
					<td>전화번호</td>
					
					
				</tr>
				
					<%
					for(int i =0 ; i<teacherList.size(); i++){
						MemberBean memberBean = (MemberBean)teacherList.get(i);
						%>	
						<tr style="cursor:pointer;" onclick="location.href='TeacherView.me?member_teacher_code=<%=memberBean.getMember_teacher_code()%>'" >
							<td class="code"><%=memberBean.getMember_teacher_code() %></td>
							<td class="name"><%=memberBean.getMember_name() %></td>
							<td class="phone"><%=memberBean.getMember_phone()%></td>
						</tr>
						<%
					}
					%>
				<%} %>
			

				</table>


</body>
</html>