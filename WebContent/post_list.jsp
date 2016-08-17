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
<result>post_list$<%
	System.out.println("this is post list!");
	String sql = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String pos_no = null;
	String pos_date = null;
	String pos_title = null;
	String pos_contents = null;
	String reg_no = null;
	String pos_num = null;
	String pos_type = null;
	String pos_gender = null;
	String pos_trip = null;
	String pos_budget = null;
	String pos_convin = null;
	String pos_startday = null;
	String pos_endday = null;
	String pos_pay = null;
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
				sql = "select * from Posting";
				pstmt = null;
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery(sql);
				while (rs.next()) {
					System.out.println(rs.getString(1));
					pos_no += rs.getString(1) + "|";
					pos_date += rs.getString(2) + "|";
					pos_title += rs.getString(3) + "|";
					pos_contents += rs.getString(4) + "|";
					reg_no += rs.getString(5) + "|";
					pos_num += rs.getString(6) + "|";
					pos_type += rs.getString(7) + "|";
					pos_gender += rs.getString(8) + "|";
					pos_trip += rs.getString(9) + "|";
					pos_budget += rs.getString(10) + "|";
					pos_convin += rs.getString(11) + "|";
					pos_startday += rs.getString(12) + "|";
					pos_endday += rs.getString(13) + "|";
					pos_pay += rs.getString(14) + "|";
					mem_no += rs.getString(15) + "|" + "$";
%><%=pos_no%><%=pos_date%><%=pos_title%><%=pos_contents%><%=reg_no%><%=pos_num%><%=pos_type%><%=pos_gender%><%=pos_trip%><%=pos_budget%><%=pos_convin%><%=pos_startday%><%=pos_endday%><%=pos_pay%><%=mem_no%>
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
 				sql = "select * from Posting where reg_no=?";
 				pstmt = conn.prepareStatement(sql);
 				pstmt.setString(1, reg_no);
 				rs = pstmt.executeQuery(sql);
 				while (rs.next()) {
 					System.out.println(rs.getString(1));
 					pos_no += rs.getString(1) + "|";
 					pos_date += rs.getString(2) + "|";
 					pos_title += rs.getString(3) + "|";
 					pos_contents += rs.getString(4) + "|";
 					reg_no += rs.getString(5) + "|";
 					pos_num += rs.getString(6) + "|";
 					pos_type += rs.getString(7) + "|";
 					pos_gender += rs.getString(8) + "|";
 					pos_trip += rs.getString(9) + "|";
 					pos_budget += rs.getString(10) + "|";
 					pos_convin += rs.getString(11) + "|";
 					pos_startday += rs.getString(12) + "|";
 					pos_endday += rs.getString(13) + "|";
 					pos_pay += rs.getString(14) + "|";
 					mem_no += rs.getString(15) + "|" + "$";
 %><%=pos_no%><%=pos_date%><%=pos_title%><%=pos_contents%><%=reg_no%><%=pos_num%><%=pos_type%><%=pos_gender%><%=pos_trip%><%=pos_budget%><%=pos_convin%><%=pos_startday%><%=pos_endday%><%=pos_pay%><%=mem_no%>
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