<%@page import="com.mysql.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String serverURL = "jdbc:mysql://52.78.101.183/tauctionDB";
		String serverName = "tauction";
		String serverPW = "asoong";

		String hayeonURL = "jdbc:mysql://localhost/tauction";
		String enter_name = "";

		String sql = "";

		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;

		request.setCharacterEncoding("utf-8");

		String action = request.getParameter("action");
		System.out.println(action);
		if (action == null) {
			//null
			System.out.println("action is null");
		} else if (action.equals("ask_my_list")) { //내 모든 문의글 받아오기
			System.out.println("this is my ask!");
			String mem_no = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(serverURL, serverName, serverPW);
				stmt = conn.createStatement();

				sql = "select mem_no from Member where mem_id=?";
				rs = stmt.executeQuery(sql);
				mem_no = rs.getString("mem_no");
	%>
	<jsp:forward page="ask_my_list.jsp">
		<jsp:param name="mem_no" value="<%=mem_no%>" />
	</jsp:forward>
	<%
		rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		} else if (action.equals("ask_add")) { //문의글 올리기
			System.out.println("this is my ask add!");
			String ask_date = request.getParameter("ask_date");
			String ask_title = request.getParameter("ask_title");
			System.out.println(ask_title);
			String ask_contents = request.getParameter("ask_contents");
			String ask_num = request.getParameter("ask_num");
			String ask_type = request.getParameter("ask_type");
			String ask_gender = request.getParameter("ask_gender");
			String ask_trip = request.getParameter("ask_trip");
			String ask_budget = request.getParameter("ask_budget");
			String ask_convin = request.getParameter("ask_convin");
			String ask_startday = request.getParameter("ask_startday");
			String ask_endday = request.getParameter("ask_endday");
			String ask_pay = request.getParameter("ask_pay");
			String mem_no = request.getParameter("mem_no");
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(serverURL, serverName, serverPW);

				sql = "insert into Ask (ask_date,ask_title,ask_contents,ask_num,ask_type,ask_gender,ask_trip,ask_budget,ask_convin,ask_startday,ask_endday,ask_pay) values(?,?,?,?,?,?,?,?,?,?,?,?)";
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
				pstmt.setString(13, mem_no);
				int tf = pstmt.executeUpdate(); //뀨?
				if (tf != 1) {
	%>
	<jsp:forward page="success.xml" />
	<%
		} else {
	%>
	<jsp:forward page="fail.xml" />
	<%
		}
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		} else if (action.equals("ask_update")) { // 내 문의글 수정
			System.out.println("this is ask update");
			String ask_title = request.getParameter("ask_title");
			String mem_no = request.getParameter("mem_no");
			String ask_no = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(serverURL, serverName, serverPW);

				sql = "select ask_no from Ask where ask_title=? and mem_no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ask_title);
				pstmt.setString(2, mem_no);
				rs = stmt.executeQuery(sql);
				ask_no = rs.getString(1);
	%>
	<jsp:forward page="ask_update.jsp">
		<jsp:param name="ask_no" value="<%=ask_no%>" />
	</jsp:forward>
	<%
		rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		} else if (action.equals("ask_like")) {//mem_no에 해당하는 모든 애들 받아오기
			String mem_no = request.getParameter("mem_no");
	%>
	<jsp:forward page="ask_like.jsp">
		<jsp:param name="mem_no" value="<%=mem_no%>" />
	</jsp:forward>
	<%
		} else if (action.equals("ask_list")) {

			String reg_name = request.getParameter("reg_name");
			System.out.println("ask.jsp에서의 reg_name = "+reg_name);
	%>
	<jsp:forward page="ask_list.jsp">
		<jsp:param name="reg_name" value="<%=reg_name%>" />
	</jsp:forward><%
		}else if(action.equals("ask_content")){
			String ask_no = request.getParameter("ask_no");
			String mem_id = request.getParameter("mem_id");
			System.out.println("ask.jsp에서의 ask_no = "+ask_no);
			%>
			<jsp:forward page="ask_content.jsp">
				<jsp:param name="ask_no" value="<%=ask_no%>" />
				<jsp:param name="mem_id" value="<%=mem_id%>" />
			</jsp:forward><%
		}
	%>