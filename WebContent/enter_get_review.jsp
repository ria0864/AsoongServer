<?xml version= '1.0' encoding='UTF-8'?>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	String serverURL = "jdbc:mysql://52.78.15.170/tauctionDB";
	String serverName = "tauction";
	String serverPW = "asoong";
	
	String enter_no = request.getParameter("enter_no");
	System.out.println(enter_no);
	//<result>succuss$리|뷰|정|보$리|뷰|정|보</result>
	
	String review_date, review_contents, mem_no, mem_id="";
%>

<result>enter_get_review$<%
	
	Connection conn = null;
	PreparedStatement pstmt = null;
		
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(serverURL, serverName, serverPW);
		
		String sql="select * from Review where enter_no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,enter_no);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			System.out.println("DB에서 가져온 업체정보");
			System.out.println(rs.getString(1));//no
			System.out.println(rs.getString(2));//date
			System.out.println(rs.getString(3));//contents
			System.out.println(rs.getString(4));//enter_no
			System.out.println(rs.getString(5));//mem_no
			
			review_date = rs.getString(2);
			review_contents = rs.getString(3);
			mem_no = rs.getString(5);
			
			sql = "select mem_id from Member where mem_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,enter_no);
			ResultSet rs2 = pstmt.executeQuery();
			
			if(rs2.next()){
				System.out.println(rs2.getString(1));//mem_id
				mem_id = rs2.getString(1);
			}
			
		%>|<%=mem_id%>|<%=review_date%>|<%=review_contents%>|<%				
		}
		System.out.println("while문 나옴");
	}
	catch(Exception e) {
		System.out.println(e);
		%><jsp:forward page="fail.xml"/><%
	}
%></result> 