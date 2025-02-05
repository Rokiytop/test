<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="DBPKG.Util" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���庰 Ŀ�� �ǸŰ��� ���α׷�</title>
</head>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	<section>
	<h3>�Ǹ���Ȳ</h3>
	<table border=1>
	<tr>
		<td>���ȣ</td><td>��ǰ�ڵ�</td><td>�Ǹų�¥</td><td>�����ڵ�</td><td>��ǰ��</td><td>��ǰ��</td><td>�Ǹż���</td><td>���Ǹž�</td>
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