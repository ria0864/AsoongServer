<%@page import="java.util.Date"%>
<%@page import="com.mysql.*" %>
<%@page import="java.sql.*"%>
<%@page import="java.text.ParsePosition"%>
<%@page import="java.text.DateFormat"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 

	String id="";
	String pw="";
	
	String sql ="";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	request.setCharacterEncoding("utf-8");
	String action = request.getParameter("action"); 
	System.out.println(action);
	
	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    conn=DriverManager.getConnection("jdbc:mysql://52.78.15.170/tauctionDB","tauction","asoong");
	
	    sql = "select mem_id,mem_pw from Member where mem_id=?";
	    pstmt = conn.prepareStatement(sql);    
	     pstmt.setString(1,id);
	    rs = pstmt.executeQuery();
	    
	    if(true == rs.next()){
	       System.out.println("DB에서 가져온 id, pw");
	       System.out.println(rs.getString(1));
	       System.out.println(rs.getString(2));
	       
	       //아이디와 비밀번호 일치확인
	       if(pw.equals(rs.getString(2))){
	          //성공             
	%>               <jsp:forward page="success.xml"/><% 
				
	       }
	       else{
	          System.out.println("로그인실패");
	          //실패
	%>               <jsp:forward page="fail.xml"/><%      
	       }
	    }
	    else{
	       System.out.println("로그인실패");
	%>            <jsp:forward page="fail.xml"/><%
	    }
	
	 }
	 catch(Exception e) {
	    System.out.println(e);
	 }            
	 
%>
</body>
</html>