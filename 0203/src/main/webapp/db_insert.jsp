<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/style.css">
<meta charset="EUC-KR">
<title>�Ǹŵ��</title>
</head>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page ="nav.jsp"></jsp:include></nav>
	<section>
	<h3> �Ǹŵ�� </h3>
		<table border="1">
			<tr>
				<td>�ǸŹ�ȣ</td>
				<td><input type="text" name="saleno" value=""></td>
			</tr>
			<tr>
				<td>��ǰ�ڵ�</td>
				<td><input type="text" name="pcode" value=""></td>
			</tr>
			<tr>
				<td>���峯¥</td>
				<td><input type="date" name="saledate" value=""></td>
			</tr>
			<tr>
				<td>�����ڵ�</td>
				<td><input type="text" name="scode" value=""></td>
			</tr>
			<tr>
				<td>�Ǹż���</td>
				<td><input type="text" name="amount" value=""></td>
			</tr>
		</table>
	<pre style="text-align: left;">
���庰 Ŀ�� �����ϱ� ���� ���α׷��̴�.

���庰 Ŀ�� �ǸŸ� �����ϱ� ���� ���α׷��̴�.

1.��ǰ���̺�, �������̺�, �Ǹ����̺��� �߰��Ѵ�.
2.�Ǹŵ��, �Ǹ���Ȳ, ���庰 �Ǹž�, ��ǰ���Ǹž� �������� �ۼ��Ѵ�.
3.�ùٸ��� �����Ǿ����� Ȯ���Ѵ�.
	</section>
	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>