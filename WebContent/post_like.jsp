<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String serverURL = "jdbc:mysql://52.78.15.170/tauctionDB";
	String serverName = "tauction";
	String serverPW = "asoong";

	String sql = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String mem_no = request.getParameter("mem_no");
%>
<result>post_like$<%
	System.out.println("this is my like posts!");

	ArrayList<String> num = null;
	int i = 0, j = 0;
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
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(serverURL, serverName, serverPW);
		sql = "select pos_no from Posting where mem_no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mem_no);
		rs = pstmt.executeQuery(sql);
		while (rs.next()) {
			num.add(i, rs.getString(1));
			i++;
		}
		while ((i - 1) != j) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(serverURL, serverName, serverPW);
				sql = "select * from Posting where pos_no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num.get(j));
				j++;
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
					pos_pay += rs.getString(14) + "|" + "$";
%><%=pos_no%><%=pos_date%><%=pos_title%><%=pos_contents%><%=pos_num%><%=pos_type%><%=pos_gender%><%=pos_trip%><%=pos_budget%><%=pos_convin%><%=pos_startday%><%=pos_endday%><%=pos_pay%><%=mem_no%>
<%
	}
			} catch (Exception e) {
				%>
				<jsp:forward page="fail.xml" />
				<%
			}
		}
		rs.close();
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		System.out.println(e);
	}
%> </result>