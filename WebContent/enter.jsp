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
		} else if (action.equals("search")) {

			enter_name = request.getParameter("enter_name");
			System.out.println(enter_name);

%>				<jsp:forward page="enter_search.jsp">
				<jsp:param name="enter_name" value="<%=enter_name%>"/>
				</jsp:forward>
<%
		}else if(action.equals("")){
			
		}

%>
</body>
</html>