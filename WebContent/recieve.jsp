<%@page import="java.util.Date"%>
<%@page import="com.mysql.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.ParsePosition"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello, This is Tauction</title>
</head>
<body>
	<%
		String id = "";
		String pw = "";

		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;

		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		System.out.println(action);

		if (action == null) {

		} else if (action.equals("login")) {

			id = request.getParameter("ID");
			pw = request.getParameter("PW");
			System.out.println(id);
			System.out.println(pw);

			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://52.78.15.170/tauctionDB", "tauction", "asoong");

				sql = "select mem_id,mem_pw from Member where mem_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				if (true == rs.next()) {
					System.out.println("DB에서 가져온 id, pw");
					System.out.println(rs.getString(1));
					System.out.println(rs.getString(2));

					//아이디와 비밀번호 일치확인
					if (pw.equals(rs.getString(2))) {
						//성공
	%>
	<jsp:forward page="success.xml" />
	<%
		} else {
						System.out.println("로그인실패");
						//실패
	%>
	<jsp:forward page="fail.xml" />
	<%
		}
				} else {
					System.out.println("로그인실패");
	%>
	<jsp:forward page="fail.xml" />
	<%
		}

			} catch (Exception e) {
				System.out.println(e);
			}

		} else if (action.equals("signup")) {

			id = request.getParameter("ID");
			pw = request.getParameter("PW");

			System.out.println(id);
			System.out.println(pw);

			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://52.78.15.170/tauctionDB", "tauction", "asoong");

				if (!id.equals("")) {

					//id 중복 확인
					sql = "select mem_id from Member where mem_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();

					//중복된 아이디가 있을 경우
					if (true == rs.next()) {
	%>
	<jsp:forward page="signup_fail_duplicate_id.xml" />
	<%
		} else {

						sql = "insert into Member(mem_id,mem_pw) values(?,?)";
						pstmt = conn.prepareStatement(sql);

						pstmt.setString(1, id);
						pstmt.setString(2, pw);

						pstmt.executeUpdate();
	%>
	<jsp:forward page="success.xml" />
	<%
		}
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		} else if (action.equals("myPost")) { //내 모든 문의글 받아오기
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
				conn = DriverManager.getConnection("jdbc:mysql://52.78.15.170/tauctionDB", "tauction", "asoong");
				stmt = conn.createStatement();

				sql = "select mem_no from Member where mem_id=?";
				rs = stmt.executeQuery(sql);
				mem_no = rs.getString("mem_no");
				%>
				<jsp:forward page="mypost.jsp">
				<jsp:param name="mem_no" value="<%=mem_no%>" />
				</jsp:forward>
	<%

				sql = "select * from Posting where mem_no=?";
				rs = stmt.executeQuery(sql);
				String mypost = null;
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
	%><%=pos_date%><%=pos_title%><%=pos_contents%><%=pos_num%><%=pos_type%><%=pos_gender%><%=pos_trip%><%=pos_budget%><%=pos_convin%><%=pos_startday%><%=pos_endday%><%=pos_pay%>
	<%%>
	<jsp:forward page="mypost.jsp">
		<jsp:param name="pos_no" value="<%=pos_no%>" />
		<jsp:param name="pos_date" value="<%=pos_date%>" />
		<jsp:param name="pos_title" value="<%=pos_title%>" />
		<jsp:param name="pos_contents" value="<%=pos_contents%>" />
		<jsp:param name="reg_no" value="<%=reg_no%>" />
		<jsp:param name="pos_num" value="<%=pos_num%>" />
		<jsp:param name="pos_type" value="<%=pos_type%>" />
		<jsp:param name="pos_gender" value="<%=pos_gender%>" />
		<jsp:param name="pos_trip" value="<%=pos_trip%>" />
		<jsp:param name="pos_budget" value="<%=pos_budget%>" />
		<jsp:param name="pos_convin" value="<%=pos_convin%>" />
		<jsp:param name="pos_startday" value="<%=pos_startday%>" />
		<jsp:param name="pos_endday" value="<%=pos_endday%>" />
		<jsp:param name="pos_pay" value="<%=pos_pay%>" />
	</jsp:forward>
	<%
		}
			} catch (Exception e) {
				System.out.println(e);
			}
		} else if (action.equals("postAdd")) { //문의글 올리기
			System.out.println("this is my post add!");
			String pos_date = request.getParameter("pos_date");
			String pos_title = request.getParameter("pos_title");
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
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://52.78.15.170/tauctionDB", "tauction", "asoong");

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
				pstmt.executeUpdate(); //뀨?

			} catch (Exception e) {

			}

		} else if (action.equals("")) {
			System.out.println("this is ");
		}
	%>ㄹ

</body>
</html>