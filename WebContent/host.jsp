<!--  
		**host 관련 요청받는 main**
		
		- add_host			: 판매자 등록	[host_name, host_id, host_phone] -> success.xml
		- set_host 			: 판매자 수정	[host_name, host_id, host_phone] -> success.xml
		- delete_host		: 판매자 삭제	[host_id] -> success.xml
		- get_host			: 판매자 정보보기	[host_id]

-->

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

		String sql = "";
		String host_no ="";
		String host_name ="";
		String host_id ="";
		String host_phone="";
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;

		request.setCharacterEncoding("utf-8");

		String action = request.getParameter("action");
		System.out.println(action);

		if (action == null) {
			//null
		} else if (action.equals("add_host")) {

			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(serverURL, serverName, serverPW);
				
				host_name = request.getParameter("host_name");
				System.out.println(host_name);
	
				sql = "insert into Host(host_name, host_id, host_phone) values(?,?,?)";
				pstmt = conn.prepareStatement(sql);
			 
		 		pstmt.setString(1,host_name);
				pstmt.setString(2,host_id);
				pstmt.setString(3,host_phone);
	
				pstmt.executeUpdate();
			}
			catch(Exception e) {
				System.out.println(e);
				%><jsp:forward page="fail.xml"/><%
			}
			%><jsp:forward page="success.xml"/><%
				
		} else if (action.equals("set_host")) {

			
			//아직못함
			
				
		} else if (action.equals("delete_host")) {

			host_id = request.getParameter("host_id");
			System.out.println(host_id);

			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(serverURL, serverName, serverPW);
				
				sql="select host_no from Host where host_id =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,host_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					System.out.println("DB에서 가져온 업체no");
					System.out.println(rs.getString(1));//no
					
					host_no = rs.getString(1);			
				}else{
					%><jsp:forward page="fail.xml"><%					
				}
				
				sql = "delete from Host where host_no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, host_no);
				pstmt.executeUpdate();
				%><jsp:forward page="success.xml"/><% 
			
			}
			catch(Exception e) {
				System.out.println(e);
				%><jsp:forward page="fail.xml"><%	
			}
				
		} else if (action.equals("get_host")) {

			host_id = request.getParameter("host_id");
			System.out.println(host_id);
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(serverURL, serverName, serverPW);
				
				sql="select * from Host where host_id =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,host_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					System.out.println("DB에서 가져온 host정보");
					System.out.println(rs.getString(1));//no
					System.out.println(rs.getString(2));//name
					System.out.println(rs.getString(3));//id
					System.out.println(rs.getString(4));//phone
									
					host_name = rs.getString(2);
					host_id = rs.getString(3);
					host_phone = rs.getString(4);
					
				}else{
					%><jsp:forward page="fail.xml"><%					
				}
			}
			catch(Exception e) {
				System.out.println(e);
				%><jsp:forward page="fail.xml"><%	
			}
			%><jsp:forward page="get_host.jsp">
			<jsp:param name="host_name" value="<%=host_name%>"/>
			<jsp:param name="host_id" value="<%=host_id%>"/>
			<jsp:param name="host_phone" value="<%=host_phone%>"/>
			</jsp:forward><%
				
		}
			

%>
</body>
</html>