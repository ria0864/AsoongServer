<%@ page contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="tauction.TalkPosting"%>
<%@ page import="tauction.PostingPortfolio"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.*" %>
<jsp:useBean id="portfolio" class="tauction.PostingPortfolio"/>
<%
	String serverURL = "jdbc:mysql://52.78.101.183/tauctionDB"; //흠?
	String serverName = "tauction";
	String serverPW = "asoong";
	
	String sql = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	java.util.Iterator folio = portfolio.getPortfolio();
	TalkPosting posting = null;
	
	request.setCharacterEncoding("utf-8");
	String action = request.getParameter("action");
	System.out.println(action);
	
	if(action.equals("getTalkPosting")) {
		System.out.println("this is to get talk posting");
		String talkpost_no = request.getParameter("posting_no");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(serverURL, serverName, serverPW);
			sql = "select talkpost_no, talkpost_type, talkpost_date, talkpost_title, talkpost_content, mem_no, mem_id from TalkPosting, Member where TalkPosting.mem_no = Member.mem_no and talkpost_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, talkpost_no);
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				portfolio.addElement(rs.getInt("talkpost_no"), rs.getString("talkpost_type"), rs.getString("talkpost_date"),
						rs.getString("talkpost_title"), rs.getString("talkpost_content"), rs.getInt("mem_no"),
						rs.getString("mem_id"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
%>
<?xml version="1.0" encoding="UTF=8"?>
<portfolio>
	<% while(folio.hasNext()) {
		posting = (TalkPosting)folio.next();
	%>
	<posting>
		<talkpost_no><%=posting.getTalkpost_no()%></talkpost_no>
		<talkpost_type><%=posting.getTalkpost_type()%></talkpost_type>
		<talkpost_date><%=posting.getTalkpost_date()%></talkpost_date>
		<talkpost_title><%=posting.getTalkpost_title()%></talkpost_title>
		<talkpost_content><%=posting.getTalkpost_title()%></talkpost_content>
		<mem_no><%=posting.getMem_no()%></mem_no>
		<mem_id><%=posting.getMem_id()%></mem_id>
	</posting>
	<% } %>
</portfolio>