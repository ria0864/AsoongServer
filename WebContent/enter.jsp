<!--  
		**enterprise 업체관련 요청받는 main**
		
		- enter_search 			: 업체 검색		[enter_name]
		- enter_search_filter	: 업체 필터검색	[reg_name, enter_type, enter_convin, enter_pay]
		- enter_rank			: 업체 랭킹		[reg_name,enter_type, enter_convin, enter_]
		- enter_rank_region		: 지역별 업체 랭킹 [reg_name]
		- enter_like			: 업체좋아요수 & 내가 좋아요하는지 [enter_name, mem_id]
		
		
		- get_review 			: 해당업체 review목록 불러오기	[enter_name]	
		- add_review			: review 등록		[enter_name, review_contents, mem_id] -> success.xml
		- delete_review 		: review 삭제		[enter_name, mem_id] ->success.xml
		-

-->

<%@page import="java.util.Date"%>
<%@page import="com.mysql.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.ParsePosition"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String serverURL = "jdbc:mysql://52.78.101.183/tauctionDB";
		String serverName = "tauction";
		String serverPW = "asoong";
		
		SimpleDateFormat df;
		Calendar cal;
		int yyyy,MM,dd;

		String sql = "";
		String enter_name ="";
		String enter_no ="";
		String mem_id ="";
		String mem_no="";
		String review_contents ="";
		String review_date="";
		String review_no="";
		String reg_name="";
		String reg_no="";
		String enter_like_num="";
		boolean enter_like = false;
		String enter_type = "";
		String enter_convin ="";
		String enter_pay = "";

		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;

		request.setCharacterEncoding("utf-8");

		String action = request.getParameter("action");
//		String action = "enter_search";
		System.out.println(action);

		if (action == null) {
			//null
		} else if (action.equals("enter_search")) {

			enter_name = request.getParameter("enter_name");
			System.out.println(enter_name);

			%><jsp:forward page="enter_search.jsp">
			<jsp:param name="enter_name" value="<%=enter_name%>"/>
			</jsp:forward><%
				
		} else if (action.equals("enter_search_filter")) {

			reg_name = request.getParameter("reg_name");
			enter_type = request.getParameter("enter_type");
			enter_convin =request.getParameter("enter_convin");
			enter_pay = request.getParameter("enter_pay");
			System.out.println("");
			System.out.println("");
			System.out.println("");
			System.out.println("");
			
				
		} else if (action.equals("enter_rank")) {

			%><jsp:forward page="enter_rank.jsp"/><%
				
		} else if (action.equals("enter_rank_region")) {

			reg_name = request.getParameter("reg_name");
			System.out.println(reg_name);
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(serverURL, serverName, serverPW);
				System.out.println("11");

				sql="select reg_no from Region where reg_name =?";
				System.out.println("22");

				pstmt = conn.prepareStatement(sql);
				
				System.out.println("33");

				pstmt.setString(1,reg_name);
				
				System.out.println("44");

				rs = pstmt.executeQuery();
				
				System.out.println("sql쿼리문실행끝남");
				if(rs.next()){
					System.out.println("DB에서 가져온 업체no");
					System.out.println(rs.getString(1));//no
					
					reg_no = rs.getString(1);			
				}else{
%>					
					<jsp:forward page="fail.xml"/>
<%					
				}
			}
			catch(Exception e) {
				System.out.println(e);
				%><jsp:forward page="fail.xml"/><%
			}

			%><jsp:forward page="enter_rank_region.jsp">
			<jsp:param name="reg_no" value="<%=reg_no%>"/>
			</jsp:forward><%
				
		}else if (action.equals("enter_like")) {

			enter_name = request.getParameter("enter_name");
			mem_id = request.getParameter("mem_id");
			System.out.println(enter_name);
			System.out.println(mem_id);
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(serverURL, serverName, serverPW);
				
				sql="select enter_no from Enterprise where enter_name =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,enter_name);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					System.out.println("DB에서 가져온 업체no");
					System.out.println(rs.getString(1));//no
					
					enter_no = rs.getString(1);			
				}else{
					%><jsp:forward page="fail.xml"/><%					
				}
				
				sql="select mem_no from Member where mem_id =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,mem_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					System.out.println("DB에서 가져온 mem_no");
					System.out.println(rs.getString(1));//no
					
					mem_no = rs.getString(1);			
				}else{
					%><jsp:forward page="fail.xml"/><%					
				}
				
				sql="select enter_like_no from EnterLike where mem_no =? and enter_no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,mem_no);
				pstmt.setString(2,enter_no);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					System.out.println("DB에서 가져온 enter_like_no 그리고 나는 이 숙소를 좋아함");
					System.out.println(rs.getString(1));//no
					
					enter_like = true;
					System.out.println(enter_like);
				}else{
					System.out.println("나는 이 숙소를 좋아하지않음");
					System.out.println(enter_like);
				}
				
				sql="select enter_like from Enterprise where enter_no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,enter_no);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					System.out.println("DB에서 가져온 enter_like수");
					System.out.println(rs.getString(1));//like
					
					enter_like_num = rs.getString(1);	
				}else{
					%><jsp:forward page="fail.xml"/><%					
				}
				
				%><jsp:forward page="enter_like.jsp">
				<jsp:param name="enter_like" value="<%=enter_like%>"/>
				<jsp:param name="enter_like_num" value="<%=enter_like_num%>"/>
				</jsp:forward><%
				
			}
			catch(Exception e) {
				System.out.println(e);
				%><jsp:forward page="fail.xml"/><%
			}
			%><jsp:forward page="success.xml"/><%
			
				
		}else if(action.equals("get_review")){
			
			enter_name = request.getParameter("enter_name");
			System.out.println(enter_name);
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(serverURL, serverName, serverPW);
				
				sql="select enter_no from Enterprise where enter_name =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,enter_name);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					System.out.println("DB에서 가져온 업체no");
					System.out.println(rs.getString(1));//no
					
					enter_no = rs.getString(1);			
				}else{
					%><jsp:forward page="fail.xml"/><%					
				}
			}
			catch(Exception e) {
				System.out.println(e);
				%><jsp:forward page="fail.xml"/><%
			}
			%><jsp:forward page="enter_get_review.jsp">
			<jsp:param name="enter_no" value="<%=enter_no%>"/>
			</jsp:forward><%
			
		}else if(action.equals("add_review")){
			
			enter_name = request.getParameter("enter_name");
			enter_name = request.getParameter("review_contents");
			enter_name = request.getParameter("mem_id");
			System.out.println(enter_name);
			System.out.println(review_contents);
			System.out.println(mem_id);
			//date contents enterno memno
			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(serverURL, serverName, serverPW);
				
				sql="select enter_no from Enterprise where enter_name =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,enter_name);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					System.out.println("DB에서 가져온 업체no");
					System.out.println(rs.getString(1));//no
					
					enter_no = rs.getString(1);			
				}else{
					%><jsp:forward page="fail.xml"/><%					
				}
				
				sql="select mem_no from Member where mem_id =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,mem_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					System.out.println("DB에서 가져온 mem_no");
					System.out.println(rs.getString(1));//no
					
					mem_no = rs.getString(1);			
				}else{
					%><jsp:forward page="fail.xml"/><%					
				}
				
				df = new SimpleDateFormat("yyyy-MM-dd");
				cal = Calendar.getInstance();
				yyyy = cal.get(Calendar.YEAR);
				MM = cal.get(Calendar.MONTH);
				dd = cal.get(Calendar.DATE);
				System.out.println(df.format(cal.getTime()));
				review_date = df.format(cal.getTime());
				
		 		sql = "insert into Review(review_date, review_contents, enter_no, mem_no) values(?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
		 
		 		pstmt.setString(1,review_date);
				pstmt.setString(2,review_contents);
				pstmt.setString(3,enter_no);
		 		pstmt.setString(4,mem_no);

				pstmt.executeUpdate();
			
			}
			catch(Exception e) {
				System.out.println(e);
				%><jsp:forward page="fail.xml"/><%
			}
			%><jsp:forward page="success.xml"/><%
					
		}else if(action.equals("delete_review")){
			
			enter_name = request.getParameter("enter_name");
			mem_id = request.getParameter("mem_id");
			System.out.println(enter_name);
			System.out.println(mem_id);

			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(serverURL, serverName, serverPW);
				
				sql="select enter_no from Enterprise where enter_name =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,enter_name);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					System.out.println("DB에서 가져온 업체no");
					System.out.println(rs.getString(1));//no
					
					enter_no = rs.getString(1);			
				}else{
					%><jsp:forward page="fail.xml"/><%					
				}
				
				sql="select mem_no from Member where mem_id =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,mem_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					System.out.println("DB에서 가져온 mem_no");
					System.out.println(rs.getString(1));//no
					
					mem_no = rs.getString(1);			
				}else{
					%><jsp:forward page="fail.xml"/><%					
				}
				
				sql="select review_no from Review where mem_no =? and enter=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,mem_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					System.out.println("DB에서 가져온 review_no");
					System.out.println(rs.getString(1));//no
					
					review_no = rs.getString(1);		
				}else{
					%><jsp:forward page="fail.xml"/><%					
				}
				
				sql = "delete from Review where review_no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, review_no);
				pstmt.executeUpdate();
				%><jsp:forward page="success.xml"/><% 
			
			}
			catch(Exception e) {
				System.out.println(e);
				%><jsp:forward page="fail.xml"/><%
			}
		}
			

%>
</body>
</html>