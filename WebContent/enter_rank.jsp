<?xml version= '1.0' encoding='UTF-8'?>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	String serverURL = "jdbc:mysql://52.78.15.170/tauctionDB";
	String serverName = "tauction";
	String serverPW = "asoong";
	
	//<result>succuss$기|업|정|보$기|업|정|보</result>
%>

<result>success$<%
	
	String enter_name, enter_addr,enter_phone,enter_like,enter_intro;
	Connection conn = null;
	PreparedStatement pstmt = null;
		
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(serverURL, serverName, serverPW);
		
		String sql="select * from Enterprise order by enter_like desc";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
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
			
		%>|<%=enter_name%>|<%=enter_addr%>|<%=enter_phone%>|<%=enter_like%>|<%=enter_intro%><%				
		}
		System.out.println("while문 나옴");
	}
	catch(Exception e) {
		System.out.println(e);
	}
%></result> 