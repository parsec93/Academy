<%@page import="vo.ContactEmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String subject = request.getParameter("subject");
	String body = request.getParameter("message");
	
	ContactEmail em = new ContactEmail();
	em.send(name, email, subject, body);
	
	
%>
