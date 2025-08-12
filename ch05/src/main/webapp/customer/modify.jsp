<%@page import="vo.User6VO"%>
<%@page import="vo.CustomerDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
		<%
		
	String seq = request.getParameter("seq");

	//DBCP 커넥션풀 객체 가져오기
	Context ctx = (Context) new InitialContext().lookup("java:comp/env"); // java 기본 환경 객체 검색
	DataSource ds = (DataSource) ctx.lookup("jdbc/dydwns"); // jdbc/dydwns 커넥션을 객체 섬색
	
	// 커넥션풀에서 접속 커넥션 가져오기
	Connection conn = ds.getConnection();

	String sql = "SELECT * FROM USER6 WHERE SEQ = ?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, seq);
	ResultSet rs = psmt.executeQuery();
	
	User6VO user6 = new User6VO();
	
	if(rs.next()){
		user6.setSeq(rs.getInt(1));
		user6.setName(rs.getString(2));
		user6.setGender(rs.getString(3));
		user6.setAge(rs.getInt(4));
		user6.setAddr(rs.getString(5));
	}
	
	
	
	
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customer 수정</title>
</head>
<body>
	<h3>customer 수정</h3>

	<a href="../jdbc.jsp">처음으로</a>
	<a href="./list.jsp">목록이동</a>

	<form action="./proc/modify.jsp" method="POST">
		<table border="1">
			<tr>
				<td>번호</td>
				<td><input type="text" name="seq" value=<%= user6.getSeq() %> readonly /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value=<%= user6.getName() %> /></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<%if( user6.getGender().equals("M")) { %>
						<label><input type="radio" name="ge" value="M" checked/>M</label>
						<label><input type="radio" name="ge" value="F" />F</label>
					<%} else { %>
						<label><input type="radio" name="ge" value="M" />M</label>
						<label><input type="radio" name="ge" value="F" checked/>F</label>
					<%} %>
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" value=<%= user6.getAge() %> /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value=<%= user6.getAddr() %> /></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="수정하기" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>