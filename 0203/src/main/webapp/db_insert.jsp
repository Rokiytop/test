<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/style.css">
<meta charset="EUC-KR">
<title>판매등록</title>
</head>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page ="nav.jsp"></jsp:include></nav>
	<section>
	<h3> 판매등록 </h3>
		<table border="1">
			<tr>
				<td>판매번호</td>
				<td><input type="text" name="saleno" value=""></td>
			</tr>
			<tr>
				<td>상품코드</td>
				<td><input type="text" name="pcode" value=""></td>
			</tr>
			<tr>
				<td>매장날짜</td>
				<td><input type="date" name="saledate" value=""></td>
			</tr>
			<tr>
				<td>매장코드</td>
				<td><input type="text" name="scode" value=""></td>
			</tr>
			<tr>
				<td>판매수량</td>
				<td><input type="text" name="amount" value=""></td>
			</tr>
		</table>
	<pre style="text-align: left;">
매장별 커피 관리하기 위한 프로그램이다.

매장별 커피 판매를 관리하기 위한 프로그램이다.

1.상품테이블, 매장테이블, 판매테이블을 추가한다.
2.판매등록, 판매현황, 매장별 판매액, 상품별판매액 페이지를 작성한다.
3.올바르게 구현되었는지 확인한다.
	</section>
	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>