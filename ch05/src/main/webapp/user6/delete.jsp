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
    	    	
    	PreparedStatement psmt = conn.prepareStatement("DELETE FROM USER6 WHERE SEQ = ?");
    	psmt.setString(1, seq);
    	
    	
    	psmt.executeUpdate()	;
    	
    	//rs.close();
    	conn.close();
    	psmt.close();
    	

        
    response.sendRedirect("./list.jsp");
    %>  
    