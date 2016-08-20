<%@ page contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="tauction.TalkPostList"%>
<%@ page import="tauction.PostListPortfolio"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.*" %>
<jsp:useBean id="portfolio" class="tauction.PostListPortfolio"/>
<%
	String serverURL = "jdbc:mysql://52.78.15.170/tauctionDB"; //흠?
	String serverName = "tauction";
	String serverPW = "asoong";
	
	String sql = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	java.util.Iterator folio = portfolio.getPortfolio();
	TalkPostList postList = null;
	
	request.setCharacterEncoding("utf-8");
	String action = request.getParameter("action");
	System.out.println(action);
	
	if(action.equals("getTalkPostList")) {
		System.out.println("this is to get talk post list");
		String talkpost_title = request.getParameter("title");
		String talkpost_type = request.getParameter("type");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(serverURL, serverName, serverPW);
			sql = "select talkpost_no, talkpost_type, talkpost_date, talkpost_title, mem_id from TalkPosting, Member where TalkPosting.mem_no = Member.mem_no and talkpost_title like ? and talkpost_type = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+talkpost_title+"%");
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				portfolio.addElement(rs.getInt("talkpost_no"), rs.getString("talkpost_type"), rs.getString("talkpost_date"),
						rs.getString("talkpost_title"), rs.getString("mem_id"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
%>
<?xml version="1.0" encoding="UTF=8"?>
<portfolio>
	<% while(folio.hasNext()) {
		postList = (TalkPostList)folio.next();
	%>
	<postlist>
		<talkpost_no><%=postList.getTalkpost_no()%></talkpost_no>
		<talkpost_type><%=postList.getTalkpost_type()%></talkpost_type>
		<talkpost_date><%=postList.getTalkpost_date()%></talkpost_date>
		<talkpost_title><%=postList.getTalkpost_title()%></talkpost_title>
		<mem_id><%=postList.getMem_id()%></mem_id>
	</postlist>
	<% } %>
</portfolio>