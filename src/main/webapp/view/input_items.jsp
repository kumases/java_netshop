<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>

<%--
-------------------------------------------------------------------------------------------------
■■■ファイル名：input_survey.jsp■■■
概要：JSP
詳細：HTML文書（回答入力画面）を出力する。
-------------------------------------------------------------------------------------------------
--%>

<%
//セッションからユーザーデータを取得
UsersDto userInfoOnSession = (UsersDto)session.getAttribute("LOGIN_INFO");

%>

<html>
<head>
<title>回答入力</title>
</head>
<body>
	<h2>商品追加</h2>
	<form action="AddItem" method="post" enctype='multipart/form-data' id="item_form">
		<p>
			名前： <input type="text" name="name">
		</p>
		<p>
			値段： <input type="number" name="price" min="0" maxlength="5">
		</p>
		<p>
			在庫数： <input type="number" name="stock"  min="0" maxlength="5" >
		</p>
		<p>
			商品説明：<br>
			<textarea name="setumei" rows="4" cols="50" maxlength="250"></textarea>
		</p>
		<p>
			商品詳細：<br>
			<textarea name="syousai" rows="4" cols="50" maxlength="250"></textarea>
		</p>
		<p>
			商品画像： <input type="file" name="picture" >
		</p>
		<input type="submit" value="追加する">
	</form>
	<br>
	<a href="Admin">管理者トップへ</a>
	<br>
	<a href="ExecuteLogout">ログアウトする</a>
<script src="node_modules/jquery/dist/jquery.min.js"></script>
<script src="node_modules/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="js/validate.js"></script>
</body>
</html>
