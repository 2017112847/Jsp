<%@page import="vo.User4VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    //전송 데이터 수신
    String user_id = request.getParameter("user_id");
    
    String host = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "dydwns";
	String pass = "1234";
	
	// 수정할 사용자 객체
	User4VO user4 = null;
	
    try{
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection conn = DriverManager.getConnection(host, user, pass);
    	
    	String sql = "SELECT * FROM USER4 WHERE USER_ID=?";
    	PreparedStatement psmt = conn.prepareStatement(sql);
    	psmt.setString(1, user_id);
    	
    	ResultSet rs = psmt.executeQuery();
    	
    	if(rs.next()){
    		user4 = new User4VO();
    		user4.setName(rs.getString(1));
    		user4.setGender(rs.getString(2));
    		user4.setAge(rs.getInt(3));
    		user4.setAddr(rs.getString(4));
    	}
    	
    	rs.close();
    	conn.close();
    	psmt.close();
    	
    }catch(Exception e){
    	e.printStackTrace()	;
    }
    
    
    
    %>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user4::modify</title>
</head>
<body>
	<h3>User4 수정</h3>
	<a href="../jdbc.jsp">처음으로</a>
	<a href="./list.jsp">목록이동</a>
	
	<form action="./proc/modify.jsp" method ="post">
		<table border ="1">
		<tr>
	<td>이름</td>
	<td>
		<% if(user4 != null) { %>
			<input type="text" name="name" readonly value ="<%=user4.getName() %>" placeholder="이름 입력"/>
		<% } else { %>
			<input type="text" name="name" readonly value ="사용자 정보 없음" />
		<% } %>
	</td>
</tr>

<tr>
	<td>성별</td>
	<td>
		<% if(user4 != null) { %>
			<label><input type="radio" name="gender" value="M" <%= "M".equals(user4.getGender()) ? "checked" : "" %> />남자</label>
			<label><input type="radio" name="gender" value="F" <%= "F".equals(user4.getGender()) ? "checked" : "" %> />여자</label>
		<% } else { %>
			<label><input type="radio" name="gender" value="M" />남자</label>
			<label><input type="radio" name="gender" value="F" />여자</label>
		<% } %>
	</td>
</tr>

<tr>
	<td>나이</td>
	<td>
		<% if(user4 != null) { %>
			<input type="number" name="age" value="<%=user4.getAge() %>" placeholder="숫자 입력"/>
		<% } else { %>
			<input type="number" name="age" value="" placeholder="숫자 입력"/>
		<% } %>
	</td>
</tr>

<tr>
	<td>주소</td>
	<td>
		<select name="address">
			<option <%= (user4 != null && "김해시".equals(user4.getAddr())) ? "selected" : "" %>>김해시</option>
			<option <%= (user4 != null && "경주시".equals(user4.getAddr())) ? "selected" : "" %>>경주시</option>
			<option <%= (user4 != null && "강릉시".equals(user4.getAddr())) ? "selected" : "" %>>강릉시</option>
			<option <%= (user4 != null && "부산시".equals(user4.getAddr())) ? "selected" : "" %>>부산시</option>
		</select>
	</td>
</tr>
		<tr>
			<td colspan ="2" align="right">
				<input type="submit" value="수정하기"/>
			</td>			 		
		</tr>		
		</table>	
	</form>
</body>
</html>