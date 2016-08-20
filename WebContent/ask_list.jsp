<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String serverURL = "jdbc:mysql://52.78.101.183/tauctionDB";
	String serverName = "tauction";
	String serverPW = "asoong";
	String reg_name = request.getParameter("reg_name");
%>
<result>ask_list$<%
	System.out.println("this is ask list!");
	String sql = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String ask_no = null;
	String ask_date = null;
	String ask_title = null;
	String ask_contents = null;
	String reg_no = null;
	String ask_num = null;
	String ask_type = null;
	String ask_gender = null;
	String ask_trip = null;
	String ask_budget = null;
	String ask_convin = null;
	String ask_startday = null;
	String ask_endday = null;
	String ask_pay = null;
	String mem_no = null;
	String tf ="all";
	if(tf.equals(reg_name))	System.out.println(tf);
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(serverURL, serverName, serverPW);
		sql = "select reg_no from Region where reg_name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, reg_name);
		rs = pstmt.executeQuery(); //니기 문제야 이 문제아 녀석아!
		System.out.println(rs);
		System.out.println("7");
		if (true == rs.next()) {
			System.out.println("DB에서 가져온 reg_no");
			System.out.println(rs.getString(1));
		}
		//reg_no = 
		System.out.println("8");
		
		if (reg_name.equals("all")) {
			try {
				System.out.println("9");
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(serverURL, serverName, serverPW);
				sql = "select * from Ask";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				System.out.println("10");
				while (rs.next()) {
					System.out.println("11");
					System.out.println(rs.getString(1));
					ask_no += rs.getString(1) + "|";
					System.out.println(ask_no);
					ask_date += rs.getString(2) + "|";
					ask_title += rs.getString(3) + "|";
					ask_contents += rs.getString(4) + "|";
					reg_no += rs.getString(5) + "|";
					ask_num += rs.getString(6) + "|";
					ask_type += rs.getString(7) + "|";
					ask_gender += rs.getString(8) + "|";
					ask_trip += rs.getString(9) + "|";
					ask_budget += rs.getString(10) + "|";
					ask_convin += rs.getString(11) + "|";
					ask_startday += rs.getString(12) + "|";
					ask_endday += rs.getString(13) + "|";
					ask_pay += rs.getString(14) + "|";
					mem_no += rs.getString(15) + "|" + "$";
%><context><%=ask_no%><%=ask_date%><%=ask_title%><%=ask_contents%><%=reg_no%><%=ask_num%><%=ask_type%><%=ask_gender%><%=ask_trip%><%=ask_budget%><%=ask_convin%><%=ask_startday%><%=ask_endday%><%=ask_pay%><%=mem_no%>
</context><%
	}
				%> <jsp:forward page="success.xml" /> <%
			} catch (Exception e) {
			%> <jsp:forward page="fail.xml" /> <%
					System.out.println("fail");
 				System.out.println(e.toString());
 			}
 		} else {
 			try {
 				Class.forName("com.mysql.jdbc.Driver");
 				conn = DriverManager.getConnection(serverURL, serverName, serverPW);
 				sql = "select * from Ask where reg_no=?";
 				pstmt = conn.prepareStatement(sql);
 				pstmt.setString(1, reg_no);
 				rs = pstmt.executeQuery();
 				while (rs.next()) {
 					//System.out.println(rs.getString(1));
 					ask_no += rs.getString(1) + "|";
 					ask_date += rs.getString(2) + "|";
 					ask_title += rs.getString(3) + "|";
 					ask_contents += rs.getString(4) + "|";
 					reg_no += rs.getString(5) + "|";
 					ask_num += rs.getString(6) + "|";
 					ask_type += rs.getString(7) + "|";
 					ask_gender += rs.getString(8) + "|";
 					ask_trip += rs.getString(9) + "|";
 					ask_budget += rs.getString(10) + "|";
 					ask_convin += rs.getString(11) + "|";
 					ask_startday += rs.getString(12) + "|";
 					ask_endday += rs.getString(13) + "|";
 					ask_pay += rs.getString(14) + "|";
 					mem_no += rs.getString(15) + "|" + "$";
 %><%=ask_no%><%=ask_date%><%=ask_title%><%=ask_contents%><%=reg_no%><%=ask_num%><%=ask_type%><%=ask_gender%><%=ask_trip%><%=ask_budget%><%=ask_convin%><%=ask_startday%><%=ask_endday%><%=ask_pay%><%=mem_no%>
<%
	}
			} catch (Exception e) {
%> <jsp:forward page="fail.xml" /> <%
 	System.out.println(e.toString());
 			}
 		}
 	} catch (Exception e) {
 %> <jsp:forward page="fail.xml" /> <%
 	}
 	rs.close();
 	pstmt.close();
 	conn.close();
 %></result>