<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	    
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String age = request.getParameter("age");
String addr = request.getParameter("addr");
	    
	        
   
   	String host = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "dydwns";
	String pass = "1234";
	
		 
   	Class.forName("oracle.jdbc.driver.OracleDriver");
   	Connection conn = DriverManager.getConnection(host, user, pass);
   	
   	PreparedStatement psmt;
   	Statement stmt = conn.createStatement();
	
		
	String sql = "UPDATE USER5 SET GENDER = ?, AGE = ?, ADDR =? WHERE NAME = ?";
	psmt = conn.prepareStatement(sql);
	psmt.setString(1, gender);
	psmt.setString(2, age);
	psmt.setString(3, addr);
	psmt.setString(4, name);
	
	psmt.executeUpdate();
   	
   	stmt.close();
   	conn.close();
   	
	    	
 
   response.sendRedirect("../list.jsp");
   
   %>