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
UsersDto userInfoOnSession = (UsersDto) session.getAttribute("LOGIN_INFO");
String userName = userInfoOnSession.getUserName();
int userId = userInfoOnSession.getUserId();
%>


<html>
<head>
<title>管理者トップ</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
 <link rel="stylesheet" type="text/css" href="./css/styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="adbody">
	<h2>管理者画面です</h2>
	<ul>
 	<li><a href="ItemsHistory">商品情報</a></li>
	<li><a href="InputUser">新規登録</a></li>
	<li><a href="InputItem">商品追加</a></li>
	<li><a href="AllUsersInfo">ユーザー一覧	</a></li>
	<li><a href="AllInqueries">お問い合わせ一覧	</a></li>
 	<li><a href="ShowAllReviews?id=1">レビュー一覧</a></li>
 	<li><a href="ShowAllItems">トップ画面</a></li>
	<li><a href="ExecuteLogout">ログアウト</a></li>
	</ul>
<script src="node_modules/jquery/dist/jquery.min.js"></script>
<script src="node_modules/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="js/validate.js"></script>
</body>
</html>

