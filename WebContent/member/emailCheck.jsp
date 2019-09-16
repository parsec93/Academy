<%@page import="vo.Email"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email1")+ "@" +request.getParameter("email2");
	Email em = new Email();
	int rNum = ((int)(Math.random()*90000)+10000);
	em.send(email,rNum);
%>
<%=rNum%>