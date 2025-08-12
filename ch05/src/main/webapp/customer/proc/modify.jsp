<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%	    
	String seq = request.getParameter("seq");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String address = request.getParameter("address");
	String rdate = request.getParameter("rdate");
	
	
	//DBCP 커넥션풀 객체 가져오기
	Context initCtx = new InitialContext();	//환경 객체 생성
	Context ctx = (Context) initCtx.lookup("java:comp/env"); // java 기본 환격 객체 검색
	DataSource ds = (DataSource) ctx.lookup("jdbc/dydwns");	// jdbc/dydwns 커넥션풀 객체 검색	
	
	// 커넥션풀에서 접속 커넥션 가져오기
	Connection conn = ds.getConnection();
	
	//sql 실행객체 생성
	String sql = "UPDATE CUSTOMER SET NAME= ?, HP=?, ADDRESS=?, RDATE=? WHERE CID=?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, name);
	psmt.setString(2, gender);
	psmt.setString(3, age);
	psmt.setString(4, address);
	psmt.setString(5, seq);
	
	//SQL 실행
	psmt.executeUpdate();
	
	//종료(커넥션 반납)
	psmt.close();
	conn.close();
	
	
	response.sendRedirect("/ch05/customer/list.jsp");
	    
	    %>