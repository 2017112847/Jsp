<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bank</title>

</head>
<body>
		<h3>미니 bank 프로젝트</h3>		
		
		
		<c:if test="${empty sessionScore.sessCustomer}">
			<p>
				그린 bank에 오신것을 환영합니다.<br/>
				께좌이체을 하려면 로그인을 하시기 바랍니다.<br/>
				로그인을 해야 서비스를 이용할 수 있습니다.
			</p>
			
				
		<h4>로그인</h4>
		<form action="/Erdbank/customer/login.do" method="post">
			<table border="1">
				<tr>
					<td>주민번호</td>
					<td><input type="text" name="c_no" placeholder="주민번호 입력 하세요"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="c_name" placeholder="이름 입력 하세요"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="로그인"/>
					</td>
				</tr>			
			</table>		
		</form>
		</c:if>
		<c:if test="${not empty sessionScore.sessCustomer}">
		<p>
			${sessCustomer.c_name}(${sessCustomer.c_no})님 반갑습니다. 서비스를 이용하시기 바랍니다.<br/>
			<a href="/Erdbank/customer/logout.do">로그아웃</a>			
		</p>
	 
		<a href="/Erdbank/account/list.do">계좌목록</a>
		<a href="/Erdbank/customer/list.do">고객목록</a>
		<a href="/Erdbank/transaction/list.do">거래내역</a>
</c:if>
	
		
</body>
</html>