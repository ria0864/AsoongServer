<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String serverURL = "jdbc:mysql://52.78.101.183/tauctionDB"; //Èì?
	String serverName = "tauction";
	String serverPW = "asoong";
	
	String sql = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");
	System.out.println(action);
	
	if(action != null && action.equals("addTalkPosting")) {
		System.out.println("this is to add talk posting");
		int talkpost_no = 0;
		String talkpost_type = request.getParameter("type");
		String talkpost_date = request.getParameter("date");
		String talkpost_title = request.getParameter("title");
		String talkpost_content = request.getParameter("content");
		int mem_no = 0;
		String mem_id = request.getParameter("mem_id");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("before conn");
			conn = DriverManager.getConnection(serverURL, serverName, serverPW);
			
			// get next posting number
			sql = "select count(*) from TalkPosting";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			if(rs.next()) {
				talkpost_no = rs.getInt(1)+1;
			}
			
			if(mem_id == null || mem_id.equals("Anonymous")) {
				%>
				<jsp:forward page="no_login.xml" />
				<%
			} else {
				sql = "select mem_no from Member where mem_id = '" + mem_id + "'";
				System.out.println(sql);
				if(pstmt != null) {
					pstmt.close();
				}
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery(sql);
				if(rs.next()) {
					mem_no = rs.getInt(1);
				}
				
				// insert posting
				String values = talkpost_no+",'"+talkpost_type+"','"+talkpost_date+"','"+talkpost_title+"','"+talkpost_content+"',"+mem_no;  
				sql = "insert into TalkPosting (talkpost_no, talkpost_type, talkpost_date, talkpost_title, talkpost_contents, mem_no) values ("+values+")";
				if(pstmt != null) {
					pstmt.close();
				}
				pstmt = conn.prepareStatement(sql);
				boolean pf = pstmt.execute(sql);
			
				if (pf == false) {
			%>
			<jsp:forward page="success.xml" />
			<%	} else {
			%>
			<jsp:forward page="fail.xml" />
			<%
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	else {
		
	}
%>
</body>
</html>