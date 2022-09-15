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
		<div style="top-body">

		<%
for (int i = 0; i < list.size(); i++) {
	ItemsDto dto = list.get(i);
%>
<div class="top-content">
			<% if(dto.getPicture() != null && dto.getPicture().length() != 0) { %>
			<a href="Detail?id=<%= dto.getId() %>"><img
					style="width: 100%"
					src="view/img/<%= replaceEscapeChar(dto.getPicture()) %>"></a>
			<% }else{ %>
			<div><a href="Detail?id=<%= dto.getId() %>"><img
					style="width: 100%" class="img-wrap" src="view/img/noimage.png"></a></div>
			<%} %>
			<div><p class="content-name"><a href="Detail?id=<%= dto.getId() %>"><%= replaceEscapeChar(dto.getName()) %></a></p></div>
			<div><p><%= dto.getPrice() %>円</p></div>
			<%
			if(dto.getStock() == 0) {
			%>
			<p><span style="background-color:red;color:white">在庫なし</span></p>
			<%
			}else {
			%>
			<p><span style="background-color:green;color:white">在庫あり</span></p>
			<%
			}
			%>
			<% if(dto.getSetumei() != null && dto.getSetumei().length() != 0) { %>
			<div><p><%= replaceEscapeChar(dto.getSetumei()) %></p></div>
			<% }else{ %>
			<div></div>
			<%} %>
</div>
		<%
}
%>
</div>
	<footer>
	<%@ include file="footer.jsp" %>
	</footer>
</body>
</html>

