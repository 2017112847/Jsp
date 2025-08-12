<%@page import="vo.User6VO"%>
<%@page import="vo.User5VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    //전송 데이터 수신
    String seq = request.getParameter("seq");
    
    String host = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "dydwns";
	String pass = "1234"; 
	
	
   	Class.forName("oracle.jdbc.driver.OracleDriver");
   	Connection conn = DriverManager.getConnection(host, user, pass);
   	
   	String sql = "SELECT * FROM USER6 WHERE SEQ=?";
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
   	}else {
   	    out.println("afsd");
   	}

   	
   	rs.close();
   	psmt.close();
   	conn.close();
   	
   	

    
    
    
    %>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user6::modify</title>
</head>
<body>
	<h3>User6 수정</h3>
	<a href="../jdbc.jsp">처음으로</a>
	<a href="./list.jsp">목록이동</a>
	
	
	  <form action="./proc/modify.jsp" method="post">
    <table border="1">
        <tr>
            <td>이름</td>
            <td><input type="text" name="NAME" value="<%= user6.getName() %>" readonly /></td>
        </tr>
        <tr>
            <td>성별</td>
            <td><input type="text" name="GENDER" value="<%= user6.getGender() %>" /></td>
        </tr>
        <tr>
            <td>나이</td>
            <td><input type="number" name="AGE" value="<%= user6.getAge() %>" /></td>
        </tr>
        <tr>
            <td>주소</td>
            <td><input type="text" name="ADDR" value="<%= user6.getAddr() %>" /></td>
        </tr>
        <tr>
            <td colspan="2" align="right"><input type="submit" value="수정하기" /></td>
        </tr>
    </table>
</form>


</body>
</html>