<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String serverURL = "jdbc:mysql://52.78.15.170/tauctionDB";
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

	try {

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(serverURL, serverName, serverPW);
		sql = "select reg_no from Region where reg_name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, reg_name);
		rs = pstmt.executeQuery(sql);
		reg_no = rs.getString(1);

		if (reg_name.equals("전체")) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(serverURL, serverName, serverPW);
				sql = "select * from Ask";
				pstmt = null;
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery(sql);
				while (rs.next()) {
					System.out.println(rs.getString(1));
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
 		} else {
 			try {
 				//Class.forName("com.mysql.jdbc.Driver");
 				//conn = DriverManager.getConnection(serverURL, serverName, serverPW);
 				sql = "select * from Ask where reg_no=?";
 				pstmt = conn.prepareStatement(sql);
 				pstmt.setString(1, reg_no);
 				rs = pstmt.executeQuery(sql);
 				while (rs.next()) {
 					System.out.println(rs.getString(1));
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
 %> </result>