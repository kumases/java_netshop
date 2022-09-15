<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.HistoryDto"%>
<%--
-------------------------------------------------------------------------------------------------
■■■ファイル名：input_survey.jsp■■■
概要：JSP
詳細：HTML文書（回答入力画面）を出力する。
-------------------------------------------------------------------------------------------------
--%>


<%
//「history」テーブルからデータを抽出
List<HistoryDto> list = (List<HistoryDto>) request.getAttribute("HISTORIES_LIST");
%>

<html>
<head>
<title>回答入力</title>
</head>
<body   class="wrapper">
<%@ include file="header.jsp" %>
	<h2>購入履歴画面です</h2>
	<a href="CartItemShow" style="color: blue">カート</a>
	<%
	if (list.size() != 0) {
	%>
	<br>
	<a href="ShowAllItems">商品一覧</a>
	<table style="width: 100%;">
		<tr bgcolor="#c0c0c0"
			style="postion: -webkit-sticky; position: sticky; top: 0;">
			<th style="width: 16%">商品名</th>
			<th style="width: 16%">価格</th>
			<th style="width: 16%">数量</th>
			<th style="width: 16%">合計金額</th>
			<th style="width: 16%">購入日</th>
			<th style="width: 16%"></th>

		</tr>
		<%
		for (int i = 0; i < list.size(); i++) {
			HistoryDto dto = list.get(i);
		%>

		<tr>
			<td><p style="width: 100%; text-align: center"><a href="Detail?id=<%=dto.getItem_id()%>"><%=replaceEscapeChar(dto.getItem_name())%></a></p></td>
			<td><p style="width: 100%; text-align: center"><%=dto.getPrice()%>円</p></td>
			<td><p style="width: 100%; text-align: center"><%=dto.getNum()%></p></td>
			<td><p style="width: 100%; text-align: center"><%=dto.getPrice() * dto.getNum()%>円</p></td>
			<td><p style="width: 100%; text-align: center"><%=dto.getTime()%></p></td>
			<td><p style="width: 100%; text-align: center"><a href="InputReview?id=<%=dto.getItem_id()%>">レビューを書く</a></p></td>
		</tr>
		<%
}
%>
	</table>
	<%
	} else {
	%>
	<p>購入履歴がありません</p>
	<a href="ShowAllItems">一覧画面へ</a>
	<br>
	<%
	}
	%>
	<footer>
	<%@ include file="footer.jsp" %>
	</footer>
	<br>
	<br>
</body>
</html>

