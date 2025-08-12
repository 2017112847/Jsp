<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Servlet</title>
</head>
<body>
	<h3>Servlet</h3>
	
	<a href="/ch08/hello.do">Hello Servlet</a><br/>
	<a href="/ch08/welcome.do">Welcome Servlet</a><br/>
	<a href="/ch08/Greeting.do">Greeting Servlet</a>
	
	<form action="/ch08/hello.do" method="post">
		<input type ="text" name="id"/><br/>
		<input type ="password" name="pw"/><br/>
		<input type ="submit" value="전송하기"/><br/>
	
	</form>
	
</body>
</html>