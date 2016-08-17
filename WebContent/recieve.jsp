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
		String serverURL = "jdbc:mysql://52.78.15.170/tauctionDB"; //흠?
		String serverName = "tauction";
		String serverPW = "asoong";

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
				conn = DriverManager.getConnection(serverURL, serverName, serverPW);
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
				conn = DriverManager.getConnection(serverURL, serverName, serverPW);

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
		}   else if (action.equals("postRemove")) { // 내 문의글 삭제
			System.out.println("this is post remove");
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

				sql = "delete from Postring where pos_no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pos_no);
				boolean pf = stmt.execute(sql);
				if (pf == true) {
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
		} 
	%>

</body>
</html>