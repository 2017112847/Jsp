<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학생목록</title>
	</head>
	<body>
		<h3>학생목록</h3>
		
		<a href="/erdcollege">처음으로</a>
		<a href="/erdcollege/student/register.do">등록하기</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>주소</th>
				<th>가입일</th>
				<th>관리</th>
			</tr>			
	<c:forEach var="dto" items="${dtoList}">
				<tr>
					<td>${dto.lecNo}</td>
					<td>${dto.lecName}</td>
					<td>${dto.lecCredit}</td>
					<td>${dto.lecTime}</td>
					<td>${dto.lecClass}</td>
					<td>					
						<a href="">수정</a>					
						<a href="">삭제</a>
					</td>
				</tr>
			</c:forEach>		
		</table>		
	</body>
</html>