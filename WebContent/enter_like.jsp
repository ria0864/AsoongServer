<?xml version= '1.0' encoding='UTF-8'?>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	String serverURL = "jdbc:mysql://52.78.101.183/tauctionDB";
	String serverName = "tauction";
	String serverPW = "asoong";
	
	String enter_like = request.getParameter("enter_like");
	String enter_like_num = request.getParameter("enter_like_num");
	System.out.println(enter_like);
	System.out.println(enter_like_num);
	//<result>succuss$1234|</result>
	
%>

<result>enter_like/<%=enter_like_num%>|<%=enter_like%></result> 