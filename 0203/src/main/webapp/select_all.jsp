<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="DBPKG.Util" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>매장별 커피 판매관리 프로그램</title>
</head>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	<section>
	<h3>판매현황</h3>
	<table border=1>
	<tr>
		<td>비번호</td><td>상품코드</td><td>판매날짜</td><td>매장코드</td><td>상품명</td><td>상품명</td><td>판매수량</td><td>총판매액</td>
	</tr>
<%
	Connection conn = null;
	Statement stmt = null;
	try{
		conn = Util.getConnection ();
		stmt = conn.createStatement ();
		String sql = "select B.saleno, A.pcode, TO_CHAR(B.saledate, 'YYYY-MM-DD') SALEDATE, " +
				"C.scode, A.name, A.amount, TO_CHAR(B.amount*A.cost, '999,999,999') cost" +
				"from tbl_product_01 A, tbl_salelist_01 B, tbl_shop_01 C" +
				"where A.pcode =B.pcode AND C.scode = B.scode;";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
%>
	<tr>
		<td><%= rs.getInt("saleno") %></td>			
		<td><%= rs.getString("pcode") %></td>		
		<td><%= rs.getString("saledate") %></td>
		<td><%= rs.getString("scode") %></td>
		<td><%= rs.getString("name") %></td>
		<td><%= rs.getInt("amount") %></td>
		<td><%= rs.getString("cost") %></td>
	</tr>
<% 			
		}
	}catch (Exception e) {
		e.printStackTrace();
	}
%>
	
	</table>
	</section>
</body>
</html>