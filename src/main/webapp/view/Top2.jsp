<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.ItemsDto"%>
<%--
-------------------------------------------------------------------------------------------------
■■■ファイル名：input_survey.jsp■■■
概要：JSP
詳細：HTML文書（回答入力画面）を出力する。
-------------------------------------------------------------------------------------------------
--%>

<%
//セッションからユーザーデータを取得

%>

<%
//「items」テーブルからデータを全件抽出
List<ItemsDto> list = (List<ItemsDto>)request.getAttribute("ALL_ITEMS_LIST");
String param = request.getParameter("search");
%>

<html>
<head>
<title>TOP</title>

</head>
<body class="wrapper">
<%@ include file="header.jsp" %>

	<h2>TOP画面</h2>
	<form action="ShowAllItems<%if(param !=null && param.length() !=0) { %>?search=<%= param %> <%} %>" method="post">
	<select name="order">
		<option value="asc">値段が低い順</option>
		<option value="desc">値段が高い順</option>
	</select>
	<input type="submit" value="適用">
	</form>
	<table style="width: 100%;text-align:center">
		<tr bgcolor="#c0c0c0"
			style="postion: -webkit-sticky; position: sticky; top: 0;">
			<th style="width: 15%">商品画像</th>
			<th style="width: 15%">名前</th>
			<th style="width: 15%">価格</th>
			<th style="width: 15%">商品説明</th>
			<th style="width: 15%">在庫</th>

		</tr>
		<%
for (int i = 0; i < list.size(); i++) {
	ItemsDto dto = list.get(i);
%>

		<tr>
			<% if(dto.getPicture() != null && dto.getPicture().length() != 0) { %>
			<td><a href="Detail?id=<%= dto.getId() %>"><img
					style="width: 100%"
					src="view/img/<%= replaceEscapeChar(dto.getPicture()) %>"></a></td>
			<% }else{ %>
			<td><a href="Detail?id=<%= dto.getId() %>"><img
					style="width: 100%" class="img-wrap" src="view/img/noimage.png"></a></td>
			<%} %>
			<td><p style="width: 100%; text-align: center"><%= replaceEscapeChar(dto.getName()) %></p></td>
			<td><p style="width: 100%; text-align: center"><%= dto.getPrice() %>円
				</p></td>
			<% if(dto.getSetumei() != null && dto.getSetumei().length() != 0) { %>
			<td><p style="width: 100%; text-align: center"><%= replaceEscapeChar(dto.getSetumei()) %></p></td>
			<% }else{ %>
			<td></td>
			<%} %>
			<td><p style="width: 100%; text-align: center"><%= dto.getStock() %>個
				</p></td>
		</tr>
		<%
}
%>
	</table>
	<footer>
	<%@ include file="footer.jsp" %>
	</footer>
</body>
</html>

