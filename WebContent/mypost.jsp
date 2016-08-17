<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sql = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	System.out.println("this is my post!");
	String pos_date = null;
	String pos_title = null;
	String pos_contents = null;
	String pos_num = null;
	String pos_type = null;
	String pos_gender = null;
	String pos_trip = null;
	String pos_budget = null;
	String pos_convin = null;
	String pos_startday = null;
	String pos_endday = null;
	String pos_pay = null;
	try {

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://52.78.15.170/tauctionDB", "tauction", "asoong");
		stmt = conn.createStatement();

		sql = "select mem_no from Member where mem_id=?";
		rs = stmt.executeQuery(sql);
		String mem_no = null;
		mem_no = rs.getString("mem_no");

		sql = "select * from Posting where mem_no=?";
		rs = stmt.executeQuery(sql);
		String mypost = null;
		while (rs.next()) {
			System.out.println(rs.getString(1));
			pos_date += rs.getString(2) + "|";
			pos_title += rs.getString(3) + "|";
			pos_contents += rs.getString(4) + "|";
			pos_num += rs.getString(6) + "|";
			pos_type += rs.getString(7) + "|";
			pos_gender += rs.getString(8) + "|";
			pos_trip += rs.getString(9) + "|";
			pos_budget += rs.getString(10) + "|";
			pos_convin += rs.getString(11) + "|";
			pos_startday += rs.getString(12) + "|";
			pos_endday += rs.getString(13) + "|";
			pos_pay += rs.getString(14) + "|";
			%><%=pos_date%><%=pos_title%><%=pos_contents%><%=pos_num%><%=pos_type%><%=pos_gender%><%=pos_trip%><%=pos_budget%><%=pos_convin%><%=pos_startday%><%=pos_endday%><%=pos_pay%>
	<%	}
			mypost += "$";
		} catch (Exception e) {
		System.out.println(e);
	}
%>