<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="tauction.AskList"%>
<%@ page import="tauction.AskListPortfolio"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.*"%>
<jsp:useBean id="portfolio" class="tauction.AskListPortfolio" />
<%
	String serverURL = "jdbc:mysql://52.78.101.183/tauctionDB";
	String serverName = "tauction";
	String serverPW = "asoong";

	String sql = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;

	java.util.Iterator folio = portfolio.getPortfolio();
	AskList askList = null;

	request.setCharacterEncoding("utf-8");
	String reg_name = request.getParameter("reg_name");
	System.out.println(reg_name);

	System.out.println("this is to get ask list");

	/*int ask_no=0;
	String ask_date = null;
	String ask_title = null;
	String ask_contents = null;
	int done=0;
	int reg_no=0;
	int ask_num=0;
	String ask_type = null;
	String ask_gender = null;
	String ask_trip = null;
	int ask_budget=0;
	String ask_convin = null;
	String ask_startday = null;
	String ask_endday = null;
	String ask_pay = null;
	int mem_no=0;
	String tf ="all";
	if(tf.equals(reg_name))	System.out.println(tf);*/

	int reg_no = 0;

	try {
		System.out.println("start");
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(serverURL, serverName, serverPW);
		sql = "select reg_no from Region where reg_name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, reg_name);
		rs = pstmt.executeQuery();

		if (true == rs.next()) {
			System.out.print("DB에서 가져온 reg_no : ");
			System.out.println(rs.getString(1));
			reg_no = rs.getInt(1);
		}

		if (reg_name.equals("all")) System.out.println("같아요~~~");
		
		if (reg_name.equals("all")) {
			try {
				System.out.println("같아요~~~");
				Class.forName("com.mysql.jdbc.Driver");
				System.out.println("1");
				conn = DriverManager.getConnection(serverURL, serverName, serverPW);
				System.out.println("2");
				sql = "select * from Ask";
				System.out.println("3");
				//stmt = conn.createStatement();
				//rs = stmt.executeQuery();
				pstmt = conn.prepareStatement(sql);
				System.out.println("4");
				rs = pstmt.executeQuery();
				System.out.println("5");
				while (rs.next()) {
					System.out.println("while문 진입 : "+rs.getString(1));

					portfolio.addElement(rs.getInt(1), rs.getDate(2), rs.getDate(3).toString(),
							rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getString(8),
							rs.getString(9), rs.getString(10), rs.getInt(11), rs.getString(12),
							rs.getString(13).toString(), rs.getString(14).toString(), rs.getString(15),
							rs.getInt(16));
				}
				System.out.println("while문 빠져나옴");
			} catch (Exception e) {
				%><jsp:forward page="fail.xml" />
				<%
				System.out.println("fail");
				System.out.println(e.toString());
			}
		} else {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(serverURL, serverName, serverPW);
				sql = "select * from Ask where reg_no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, reg_no);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					System.out.println(rs.getString(1));
					portfolio.addElement(rs.getInt(1), rs.getDate(2), rs.getDate(3).toString(),
							rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getString(8),
							rs.getString(9), rs.getString(10), rs.getInt(11), rs.getString(12),
							rs.getString(13).toString(), rs.getString(14).toString(), rs.getString(15),
							rs.getInt(16));
					/*System.out.println(rs.getString(1));
					ask_no += rs.getInt(1);
					ask_date += rs.getDate(2).toString();
					ask_title += rs.getString(3);
					ask_contents += rs.getString(4);
					done += rs.getInt(5);
					reg_no += rs.getInt(6);
					ask_num += rs.getInt(7);
					ask_type += rs.getString(8);
					ask_gender += rs.getString(9);
					ask_trip += rs.getString(10);
					ask_budget += rs.getInt(11);
					ask_convin += rs.getString(12);
					ask_startday += rs.getString(13).toString();
					ask_endday += rs.getString(14).toString();
					ask_pay += rs.getString(15);
					mem_no += rs.getInt(16);*/

				}
			} catch (Exception e) {
				%><jsp:forward page="fail.xml" /><%
				System.out.println(e.toString());
			}
		} 
	rs.close();
	pstmt.close();
	conn.close();
	}catch (Exception e) {
	%><jsp:forward page="fail.xml" /><%
	System.out.println(e.toString());
}
%>
<?xml version="1.0" encoding="UTF-8"?>
<portfolio>
	<% while(folio.hasNext()) {
		askList = (AskList)folio.next();
		System.out.println("export xml : " + askList.getAsk_no());
	%> 
	<asklist>
		<ask_no><%=askList.getAsk_no()%></ask_no>
		<ask_date><%=askList.getAsk_date()%></ask_date>
		<ask_title><%=askList.getAsk_title()%></ask_title>
		<ask_contents><%=askList.getAsk_contents()%></ask_contents>
		<done><%=askList.getDone()%></done>	
		<reg_no><%=askList.getAsk_no()%></reg_no>
		<ask_num><%=askList.getAsk_num()%></ask_num>
		<ask_type><%=askList.getAsk_type()%></ask_type>	
		<ask_gender><%=askList.getAsk_gender()%></ask_gender>
		<ask_trip><%=askList.getAsk_trip()%></ask_trip>
		<ask_budget><%=askList.getAsk_budget()%></ask_budget>
		<ask_convin><%=askList.getAsk_convin()%></ask_convin>
		<ask_startday><%=askList.getAsk_startday()%></ask_startday>
		<ask_endday><%=askList.getAsk_endday()%></ask_endday>
		<ask_pay><%=askList.getAsk_pay()%></ask_pay>
		<mem_no><%=askList.getMem_no()%></mem_no>
	</asklist>
<% } %>
</portfolio>