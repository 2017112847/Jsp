<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    //전송 데이터 수신
    String name = request.getParameter("name");
    
    String host = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "dydwns";
	String pass = "1234";
	
	
		
    try{
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection conn = DriverManager.getConnection(host, user, pass);
    	    	
    	PreparedStatement psmt = conn.prepareStatement("DELETE FROM USER4 WHERE NAME = ?");
    	psmt.setString(1, name);
    	
    	
    	psmt.executeUpdate()	;
    	
    	//rs.close();
    	conn.close();
    	psmt.close();
    	
    }catch(Exception e){
    	e.printStackTrace()	;
    }
        
    response.sendRedirect("./list.jsp");
    %>  
    