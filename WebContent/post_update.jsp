<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String serverURL = "jdbc:mysql://52.78.15.170/tauctionDB";
	String serverName = "tauction";
	String serverPW = "asoong";

	String pos_no = request.getParameter("pos_no");
	String pos_date = request.getParameter("pos_no");
	String pos_title = request.getParameter("pos_title");
	String pos_contents = request.getParameter("pos_contents");
	String reg_no = request.getParameter("reg_no");
	String pos_num = request.getParameter("pos_num");
	String pos_type = request.getParameter("Pos_type");
	String pos_gender = request.getParameter("pos_gender");
	String pos_trip = request.getParameter("pos_trip");
	String pos_budget = request.getParameter("pos_budget");
	String pos_convin = request.getParameter("pos_convin");
	String pos_startday = request.getParameter("pos_startday");
	String pos_endday = request.getParameter("pos_endday");
	String pos_pay = request.getParameter("pos_pay");
	System.out.println(pos_no);
%>
<result>post_update<%
	String sql = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	System.out.println("this is my post update!");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(serverURL, serverName, serverPW);
		pstmt = conn.prepareStatement(sql);
		sql = "update Posting set pos_date=?,pos_title=?,pos_contents=?,pos_num=?,pos_type=?,pos_gender=?,pos_trip=?,pos_budget=?,pos_convin=?,pos_startday=?,pos_endday=?,pos_pay=? where post_no=?";
		pstmt.setString(1, pos_date);
		pstmt.setString(2, pos_title);
		pstmt.setString(3, pos_contents);
		pstmt.setString(4, pos_num);
		pstmt.setString(5, pos_type);
		pstmt.setString(6, pos_gender);
		pstmt.setString(7, pos_trip);
		pstmt.setString(8, pos_budget);
		pstmt.setString(9, pos_convin);
		pstmt.setString(10, pos_startday);
		pstmt.setString(11, pos_endday);
		pstmt.setString(12, pos_pay);
		pstmt.setString(13, pos_no);
		int pf = pstmt.executeUpdate(sql);
		if (pf != 1) {
%> <jsp:forward page="success.xml" /> <%
 	} else {
 %> <jsp:forward page="fail.xml" /> <%
 	}
 	} catch (Exception e) {
 		System.out.println(e);
 	}
 %> </result>