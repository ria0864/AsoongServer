<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String serverURL = "jdbc:mysql://52.78.15.170/tauctionDB";
	String serverName = "tauction";
	String serverPW = "asoong";
	
	String sql = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String ask_no = request.getParameter("ask_no");
	String ask_date = request.getParameter("ask_no");
	String ask_title = request.getParameter("ask_title");
	String ask_contents = request.getParameter("ask_contents");
	String reg_no = request.getParameter("reg_no");
	String ask_num = request.getParameter("ask_num");
	String ask_type = request.getParameter("ask_type");
	String ask_gender = request.getParameter("ask_gender");
	String ask_trip = request.getParameter("ask_trip");
	String ask_budget = request.getParameter("ask_budget");
	String ask_convin = request.getParameter("ask_convin");
	String ask_startday = request.getParameter("ask_startday");
	String ask_endday = request.getParameter("ask_endday");
	String ask_pay = request.getParameter("ask_pay");
	System.out.println(ask_no);
%>
<result>ask_update$<%

	System.out.println("this is my ask update!");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(serverURL, serverName, serverPW);
		sql = "update Ask set ask_date=?,ask_title=?,ask_contents=?,ask_num=?,ask_type=?,ask_gender=?,ask_trip=?,ask_budget=?,ask_convin=?,ask_startday=?,ask_endday=?,ask_pay=? where post_no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ask_date);
		pstmt.setString(2, ask_title);
		pstmt.setString(3, ask_contents);
		pstmt.setString(4, ask_num);
		pstmt.setString(5, ask_type);
		pstmt.setString(6, ask_gender);
		pstmt.setString(7, ask_trip);
		pstmt.setString(8, ask_budget);
		pstmt.setString(9, ask_convin);
		pstmt.setString(10, ask_startday);
		pstmt.setString(11, ask_endday);
		pstmt.setString(12, ask_pay);
		pstmt.setString(13, ask_no);
		int pf = pstmt.executeUpdate(sql);
		if (pf != 1) {
%> <jsp:forward page="success.xml" /> <%
 	} else {
 %> <jsp:forward page="fail.xml" /> <%
 	}
		rs.close();
		pstmt.close();
		conn.close();
 	} catch (Exception e) {
 		System.out.println(e);
 	}
 %> </result>