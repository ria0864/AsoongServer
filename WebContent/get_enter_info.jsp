<?xml version= '1.0' encoding='UTF-8'?>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	String serverURL = "jdbc:mysql://52.78.101.183/tauctionDB";
	String serverName = "tauction";
	String serverPW = "asoong";
	
	String enter_name = request.getParameter("enter_name");
	System.out.println(enter_name);
	//<result>enter_search$기|업|정|보$기|업|정|보</result>
%>

<result>get_enter_info$<%
	
	String enter_addr,enter_phone,enter_like,enter_intro;
	Connection conn = null;
	PreparedStatement pstmt = null;
		
	try{
		System.out.println("11");
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(serverURL, serverName, serverPW);
		System.out.println("22");
		String sql="select * from Enterprise where enter_name ='?'";
		System.out.println("33");
		pstmt = conn.prepareStatement(sql);
		System.out.println("44");
		pstmt.setString(1,enter_name);
		System.out.println("55");
		ResultSet rs = pstmt.executeQuery();
		System.out.println("66");
		
		while(rs.next()){
			System.out.println("DB에서 가져온 업체정보");
			System.out.println(rs.getString(1));//no
			System.out.println(rs.getString(2));//name
			System.out.println(rs.getString(3));//addr
			System.out.println(rs.getString(4));//phone
			System.out.println(rs.getString(5));//like
			
			enter_name = rs.getString(2);
			enter_addr = rs.getString(3);
			enter_phone = rs.getString(4);
			enter_like = rs.getString(5); 
			enter_intro = rs.getString(6);
			
		%><%=enter_name%>|<%=enter_addr%>|<%=enter_phone%>|<%=enter_like%>|<%=enter_intro%>$<%				
		}
		System.out.println("while문 나옴");
	}
	catch(Exception e) {
		System.out.println(e);
		%><jsp:forward page="fail.xml"/><%
	}
%></result> 