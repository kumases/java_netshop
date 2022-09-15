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


<html>
<head>
  <meta charset="UTF-8">
<title>マイページ</title>
</head>
<body   class="wrapper">
<%@ include file="header.jsp" %>
	<h2>マイページ</h2>
	<ul>
	<%
	if(user_id == 1) {
	%>
	<li><a href="UserInfo?id=<%= user_id %>">登録情報	</a></li>
	<%
	}else{
	%>
	<li><a href="UserInfo">登録情報</a></li>
	<%
	}
	%>
	<li><a href="ShowHistory">購入履歴</a></li>
	<li><a href="CartItemShow">カート</a></li>
	<li>	<a href="InputInquery">お問い合わせ</a></li>
	<li>	<a href="ShowInqueryMine">お問い合わせ履歴</a></li>
 	<li><a href="ShowAllItems">商品一覧</a></li>
	<li><a href="ExecuteLogout">ログアウト</a></li>
	</ul>
		<footer>
	<%@ include file="footer.jsp" %>
	</footer>
</body>
</html>

