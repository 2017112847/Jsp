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
	
	List<User5VO> users = new ArrayList<>();
	

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection(host, user, pass);
	Statement stmt = conn.createStatement();
	String sql = "SELECT * FROM USER5";
	ResultSet rs = stmt.executeQuery(sql);
	
	List<User5VO> userList = new ArrayList<User5VO>();
	
	while(rs.next()){
		
		User5VO vo = new User5VO();
		vo.setName(rs.getString(1));
		vo.setGender(rs.getString(2));
		vo.setAge(rs.getInt(3));
		vo.setAddr(rs.getString(4));
		
		users.add(vo);
	}
	
	rs.close();
	stmt.close();
	conn.close();
	

    
  %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user5::list</title>
</head>
<body>
	<h3>User5 목록</h3>
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
		<% for(User5VO user5 : users){ %>
		<tr>
			<td><%= user5.getName() %></td>
			<td><%= user5.getGender()%>></td>
			<td><%= user5.getAge() %>></td>
			<td><%= user5.getAddr() %></td>
			<td>
				<!--  수정 하고자 하는 사용자 아이디를 modify.jsp로 전송 -->
				<a href="./modify.jsp?user_id=<%= user5.getName() %>">수정</a>
				<a href="./delete.jsp?name=<%= user5.getName() %>">삭제</a>
			</td>		
		</tr>
		<% } %>
	
	</table>
</body>
</html>