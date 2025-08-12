<%@page import="vo.User6VO"%>
<%@page import="vo.User5VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%
  
	String host = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "dydwns";
	String pass = "1234";
	
	

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection(host, user, pass);
	Statement stmt = conn.createStatement();
	String sql = "SELECT * FROM USER6";
	ResultSet rs = stmt.executeQuery(sql);
	
	List<User6VO> userList = new ArrayList<User6VO>();
	
	while(rs.next()) {
		User6VO user6 = new User6VO();
		user6.setSeq(rs.getInt(1));
		user6.setName(rs.getString(2));
		user6.setGender(rs.getString(3));
		user6.setAge(rs.getInt(4));
		user6.setAddr(rs.getString(5));
		
		userList.add(user6);
	}
	
	rs.close();
	stmt.close();
	conn.close();
	

    
  %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user6::list</title>
</head>
<body>
	<h3>User6 목록</h3>
	<a href="../jdbc.jsp">처음으로</a>
	<a href="./register.jsp">등록하기</a>
	
	<table border ="1">
		<tr>
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
		<% for(User6VO user6 : userList){ %>
		<tr>
			<td><%= user6.getSeq() %></td>
			<td><%= user6.getName() %></td>
			<td><%= user6.getGender()%>></td>
			<td><%= user6.getAge() %>></td>
			<td><%= user6.getAddr() %></td>
			<td>
				<!--  수정 하고자 하는 사용자 아이디를 modify.jsp로 전송 -->
				<a href="./modify.jsp?user_id=<%= user6.getSeq() %>">수정</a>
				<a href="./delete.jsp?name=<%= user6.getSeq() %>">삭제</a>
			</td>		
		</tr>
		<% } %>
	
	</table>
</body>
</html>