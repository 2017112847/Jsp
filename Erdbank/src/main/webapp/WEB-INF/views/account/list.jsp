<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌목록</title>
</head>
<body>
	<h3>계좌목록</h3>
	<a href="/Erdbank/index.jsp">처음으로</a>
	<a href="/Erdbank/account/register.do">등록하기</a>
	
	<table border ="1">
		<tr>
			<th>강좌번호</th>
				<th>꼐좌번호</th>
				<th>계좌종루</th>
				<th>상품명</th>
				<th>현재 잔액</th>
				<th>계좌개설일</th>
				<th>작업</th>
		</tr>
		<c:forEach var="acc" items="${accounts}">
				<tr>
					<td>${acc.a_no}</td>
					<td>${acc.a_item_dist}</td>
					<td>${acc.a_item_name}</td>
					<td>${acc.a_c_name}(${acc.a_c_no})</td>
					<td>${acc.a_balance}</td>
					<td>${acc.a_open_date}</td>
					<td>					
						<a href="#">입금</a>					
						<a href="#">출금</a>					
						<a href="#">조회</a>					
						<a href="#">이체</a>					
					
					</td>
				</tr>
			</c:forEach>	
	</table>
</body>
</html>