<%@ page contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%><%@ page import="tauction.AskContent"%><%@ page import="tauction.AskContentPortfolio"%><%@page import="java.sql.*"%><%@page import="com.mysql.*"%><jsp:useBean id="portfolio" class="tauction.AskContentPortfolio" /><%
	System.out.println("This it ask_list.jsp");
	String serverURL = "jdbc:mysql://52.78.101.183/tauctionDB";
	String serverName = "tauction";
	String serverPW = "asoong";

	String sql = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;

	request.setCharacterEncoding("utf-8");
	String tmp = request.getParameter("ask_no");
	int ask_no = Integer.parseInt(tmp);
	System.out.println("ask_no = " + ask_no);
	String id = request.getParameter("mem_id");

	System.out.println("this is to get ask content");

     Date ask_date=null;
     String ask_title=null,ask_contents=null;
     int done=0,reg_no=0,ask_num=0;
     String ask_type=null,ask_gender=null,ask_trip=null;
     int ask_budget=0;
     String ask_convin=null;
     Date ask_startday=null;
     Date ask_endday=null;
     String ask_pay=null;
     int isLike=0;
     int ask_commentNo=0;
    
	try {
		System.out.println("start");
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(serverURL, serverName, serverPW);
		System.out.println("1");
		sql = "select ask_date, ask_title, ask_contents, ask_done, reg_no, ask_num,	ask_type, ask_gender, ask_trip, ask_budget, ask_convin, ask_startday, ask_endday, ask_pay";
		sql += " from Ask where ask_no = "+ask_no;
		System.out.println("2");
		pstmt = conn.prepareStatement(sql);
		System.out.println("3");
		//pstmt.setInt(1, ask_no);
		rs = pstmt.executeQuery(sql);
		System.out.println("4");
		while(rs.next()){
			System.out.println("while문 진입 : " + rs.getString(1));
			ask_date = rs.getDate(1);
			ask_title = rs.getString(2);
			ask_contents = rs.getString(3);
			done = rs.getInt(4);
			reg_no = rs.getInt(5);
			ask_num = rs.getInt(6);
			ask_type = rs.getString(7);
			ask_gender = rs.getString(8);
			ask_trip = rs.getString(9);
			ask_budget = rs.getInt(10);
			ask_convin = rs.getString(11);
			ask_startday = rs.getDate(12);
			ask_endday = rs.getDate(13);
			ask_pay = rs.getString(14);
		}
		//select Ask.ask_no, ask_date, ask_title, ask_contents, ask_done, reg_no, ask_num, ask_type, ask_gender, ask_trip, ask_budget, ask_convin, ask_startday, ask_endday, ask_pay, Member.mem_id from Ask, AskLike, Member, Comment where Ask.ask_no = AskLike.ask_no and Ask.ask_no = Comment.ask_no and Member.host_no = Comment.host_no;
		System.out.println("5");
		sql = "select count(*) from AskLike, Member where Member.mem_no = AskLike.mem_no and Member.mem_id = '"+id+"'";
		pstmt = conn.prepareStatement(sql);
		//pstmt.setString(1, id);
		rs = pstmt.executeQuery(sql);
		System.out.println("6");
		if(rs.next())
		if(rs.getInt(1)>0){
			isLike = 1;
		}else isLike = 0;
		System.out.println("7");
		sql = "select count(*) from Ask, Comment where Ask.ask_no = Comment.ask_no and Ask.ask_no = "+ask_no;
		pstmt = conn.prepareStatement(sql);
		//pstmt.setInt(1, ask_no);
		rs = pstmt.executeQuery(sql);
		if(rs.next())
		ask_commentNo = rs.getInt(1);
		System.out.println("8");
		portfolio.addElement(ask_no, ask_date, ask_title, ask_contents, done, reg_no, ask_num, ask_type, ask_gender, ask_trip, ask_budget, ask_convin, ask_startday, ask_endday, ask_pay, id, isLike, ask_commentNo);
		System.out.println("9");
		rs.close();
		pstmt.close();
		conn.close();
	} catch (Exception e) {
%><jsp:forward page="fail.xml" /><%
	System.out.println(e.toString());
	}
%><?xml version="1.0" encoding="UTF-8"?>
<portfolio> 
	<% 
	java.util.List<AskContent> folio = portfolio.getPortfolio();
	java.util.Iterator<AskContent> iter = folio.iterator();
		while(iter.hasNext()) {
			synchronized(folio) {
				AskContent askContent = (AskContent)iter.next();
 				System.out.println("export xml : " + askContent.getAsk_no());
 %> 
	 <askcontent> 
		<ask_no><%=askContent.getAsk_no()%></ask_no> 
		<ask_date><%=askContent.getAsk_date()%></ask_date>
		<ask_title><%=askContent.getAsk_title()%></ask_title> 
		<ask_contents><%=askContent.getAsk_contents()%></ask_contents>
		<done><%=askContent.getDone()%></done>
		<reg_no><%=askContent.getAsk_no()%></reg_no>
		<ask_num><%=askContent.getAsk_num()%></ask_num> 
		<ask_type><%=askContent.getAsk_type()%></ask_type>
		<ask_gender><%=askContent.getAsk_gender()%></ask_gender>
		<ask_trip><%=askContent.getAsk_trip()%></ask_trip>
		<ask_budget><%=askContent.getAsk_budget()%></ask_budget>
		<ask_convin><%=askContent.getAsk_convin()%></ask_convin>
		<ask_startday><%=askContent.getAsk_startday()%></ask_startday> 
		<ask_endday><%=askContent.getAsk_endday()%></ask_endday>
		<ask_pay><%=askContent.getAsk_pay()%></ask_pay> 
		<mem_no><%=askContent.getMem_id()%></mem_no>
		<idLike><%=askContent.getIsLike()%></idLike>
		<ask_commentNo><%=askContent.getAsk_commentNo()%></ask_commentNo>
	</askcontent><% }
 	}%> 
 </portfolio>