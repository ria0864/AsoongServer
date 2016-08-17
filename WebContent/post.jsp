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
		String serverURL = "jdbc:mysql://52.78.15.170/tauctionDB";
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
		} else if (action.equals("post_my_list")) { //�� ��� ���Ǳ� �޾ƿ���
			System.out.println("this is my post!");
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
				stmt = conn.createStatement();

				sql = "select mem_no from Member where mem_id=?";
				rs = stmt.executeQuery(sql);
				mem_no = rs.getString("mem_no");
			%>
			<jsp:forward page="post_my_list.jsp">
				<jsp:param name="mem_no" value="<%=mem_no%>" />
			</jsp:forward>
			<%
		} catch (Exception e) {
				System.out.println(e);
			}
		}else if (action.equals("post_add")) { //���Ǳ� �ø���
			System.out.println("this is my post add!");
			String pos_date = request.getParameter("pos_date");
			String pos_title = request.getParameter("pos_title");
			System.out.println(pos_title);
			String pos_contents = request.getParameter("pos_contents");
			String pos_num = request.getParameter("pos_num");
			String pos_type = request.getParameter("pos_type");
			String pos_gender = request.getParameter("pos_gender");
			String pos_trip = request.getParameter("pos_trip");
			String pos_budget = request.getParameter("pos_budget");
			String pos_convin = request.getParameter("pos_convin");
			String pos_startday = request.getParameter("pos_startday");
			String pos_endday = request.getParameter("pos_endday");
			String pos_pay = request.getParameter("pos_pay");
			String mem_no = request.getParameter("mem_no");
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(serverURL, serverName, serverPW);

				sql = "insert into Posting (pos_date,pos_title,pos_contents,pos_num,pos_type,pos_gender,pos_trip,pos_budget,pos_convin,pos_startday,pos_endday,pos_pay) values(?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
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
				pstmt.setString(13, mem_no);
				int tf = pstmt.executeUpdate(); //��?
				if (tf != 1) {
			%>
			<jsp:forward page="success.xml" />
			<%
				} else {
			%>
			<jsp:forward page="fail.xml" />
			<%
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if (action.equals("post_update")) { // �� ���Ǳ� ����
			System.out.println("this is post update");
			String pos_title = request.getParameter("pos_title");
			String mem_no = request.getParameter("mem_no");
			String pos_no = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(serverURL, serverName, serverPW);

				sql = "select pos_no from Posting where pos_title=? and mem_no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pos_title);
				pstmt.setString(2, mem_no);
				rs = stmt.executeQuery(sql);
				pos_no = rs.getString(1);
			%>
			<jsp:forward page="post_update.jsp">
				<jsp:param name="pos_no" value="<%=pos_no%>" />
			</jsp:forward>
			<%
		} catch (Exception e) {
				System.out.println(e);
			}
		}else if(action.equals("post_like")){//mem_no�� �ش��ϴ� ��� �ֵ� �޾ƿ���
			String mem_no = request.getParameter("mem_no");
			
		}