<?xml version= '1.0' encoding='UTF-8'?>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	String serverURL = "jdbc:mysql://52.78.101.183/tauctionDB";
	String serverName = "tauction";
	String serverPW = "asoong";
	
	String review_date = request.getParameter("review_date");
	String review_contents = request.getParameter("review_contents");
	String enter_no = request.getParameter("enter_no");
	String mem_no = request.getParameter("mem_no");
	System.out.println(review_date);
	System.out.println(review_contents);
	System.out.println(enter_no);
	System.out.println(mem_no);
	//<result>succuss</result>
%>

<result>enter_set_review$<%

	String mem_id="";	
	Connection conn = null;
	PreparedStatement pstmt = null;
		
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(serverURL, serverName, serverPW);
		
 		String sql = "insert into Review(review_date, review_contents, enter_no, mem_no) values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
 
 		pstmt.setString(1,review_date);
		pstmt.setString(2,review_contents);
		pstmt.setString(3,enter_no);
 		pstmt.setString(4,mem_no);

		pstmt.executeUpdate();
		
		sql="select * from Review where enter_no=?";
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
	}
%></result> 