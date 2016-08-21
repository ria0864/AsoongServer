<?xml version= '1.0' encoding='UTF-8'?>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	String serverURL = "jdbc:mysql://52.78.101.183/tauctionDB";
	String serverName = "tauction";
	String serverPW = "asoong";
	
	String reg_no = request.getParameter("reg_no");
	String enter_type = request.getParameter("enter_type");
	String enter_convin = request.getParameter("enter_convin");
	System.out.println(reg_no);
	System.out.println(enter_type);
	System.out.println(enter_convin);
	//<result>enter_search$기|업|정|보$기|업|정|보</result>  
%>

<result>enter_search_filter/<%  
	
	String enter_name,enter_addr,enter_phone,enter_like,enter_intro;
	Connection conn = null;
	PreparedStatement pstmt = null;
		
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(serverURL, serverName, serverPW);
		
		String sql="select * from Enterprise where reg_no=? and enter_type=? and enter_convin=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,reg_no);
		pstmt.setString(2,enter_type);
		pstmt.setString(3,enter_convin);
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
			//enter_intro = rs.getString(6);
			
		%><%=enter_name%>|<%=enter_addr%>|<%=enter_like%>$<%				
		}
		System.out.println("while문 나옴");
	}
	catch(Exception e) {
		System.out.println(e);
		%><jsp:forward page="fail.xml"/><%
	}
%></result> 