<%@ page contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%><%@ page import="tauction.AskList"%><%@ page import="tauction.AskListPortfolio"%><%@page import="java.sql.*"%><%@page import="com.mysql.*"%><jsp:useBean id="portfolio" class="tauction.AskListPortfolio" /><%
	System.out.println("This it ask_list.jsp");
	String serverURL = "jdbc:mysql://52.78.101.183/tauctionDB";
	String serverName = "tauction";
	String serverPW = "asoong";
	// insert into Ask (ask_no,ask_date,ask_title,ask_contents,ask_done,reg_no,ask_num,ask_type,ask_gender,ask_trip,ask_budget,ask_convin,ask_startday,ask_endday,ask_pay,mem_no) values(1,'2015-01-01',"title","contents",1,3,3,"type","gender","trip",10000,"convin",'2015-01-01','2015-01-02',"pay",2);
	String sql = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;

	request.setCharacterEncoding("utf-8");
	String reg_name = request.getParameter("reg_name");
	System.out.println("reg_name = " + reg_name);

	System.out.println("this is to get ask list");

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

			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(serverURL, serverName, serverPW);
				int like = 0;
				System.out.println("2");
				if(reg_no==1)
					sql = "select Ask.ask_no, ask_done, reg_no, ask_startday, ask_endday, ask_budget, ask_num, mem_id, count(*) from Ask, AskLike, Member where Ask.ask_no = AskLike.ask_no and Ask.mem_no = Member.mem_no group by Ask.ask_no";
				else{
					sql = "select Ask.ask_no, ask_done, reg_no, ask_startday, ask_endday, ask_budget, ask_num, mem_id, count(*) from Ask, AskLike, Member where Ask.reg_no ='"+reg_no+"' and Ask.ask_no = AskLike.ask_no and Ask.mem_no = Member.mem_no group by Ask.ask_no";
					//pstmt.setInt(1, reg_no);
				}
				System.out.println("3");
				pstmt = conn.prepareStatement(sql);
				System.out.println("4");
				rs = pstmt.executeQuery();
				System.out.println("5");
				while (rs.next()) {
					System.out.println("while문 진입 : " + rs.getString(1));
					portfolio.addElement(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDate(4),
							rs.getDate(5), rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getInt(9));
				}
				System.out.println("while문 빠져나옴");
			} catch (Exception e) {
				%><jsp:forward page="fail.xml" />
				<%
				System.out.println("fail");
				System.out.println(e.toString());
			}
		rs.close();
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		%><jsp:forward page="fail.xml" />
		<%
		System.out.println(e.toString());
	}
%><?xml version="1.0" encoding="UTF-8"?>
<portfolio><%
 	java.util.List<AskList> folio = portfolio.getPortfolio();
 	java.util.Iterator<AskList> iter = folio.iterator();
 	while (iter.hasNext()) {
 		synchronized (folio) {
 			AskList askList = (AskList) iter.next();
 			System.out.println("export xml : " + askList.getAsk_no());
 %><asklist> 
 		<ask_no><%=askList.getAsk_no()%></ask_no>
		<done><%=askList.getDone()%></done>
		<reg_no><%=askList.getAsk_no()%></reg_no>
		<ask_startday><%=askList.getAsk_startday()%></ask_startday>
		<ask_endday><%=askList.getAsk_endday()%></ask_endday>
		<ask_budget><%=askList.getAsk_budget()%></ask_budget>
		<ask_num><%=askList.getAsk_num()%></ask_num>
		<mem_id><%=askList.getMem_id()%></mem_id>
		<ask_commentNo><%=askList.getAsk_commentNo()%></ask_commentNo>
	</asklist> <%
 		}
 	}
 %> </portfolio>