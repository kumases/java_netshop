<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
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
HashMap<String, String> hashmap = null;
hashmap = (HashMap<String, String>) request.getAttribute("USERS_LIST");
int user_id = 0;
if (userInfoOnSession != null) {
	user_id = userInfoOnSession.getUserId();
}
%>

<html>
<head>
<title>新規登録</title>
<!-- Boot strap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="../style.css">
</head>
<body>
	<h2>新規登録</h2>

	<form action="AddUser" method="post" enctype='multipart/form-data'
		style="text-align: center">
		<p>
			名前：
			<%
		if (hashmap != null && hashmap.get("name") == "") {
		%>
			<span class="text-danger">入力してください</span>
			<%
			}
			%>
			<span class="badge bg-danger">必須</span>
			<%
			if (hashmap != null) {
			%>
			<br> <input type="text" name="name"
				value="<%=hashmap.get("name")%>">
			<%
			} else {
			%>
			<br> <input type="text" name="name">
			<%
			}
			%>

		</p>
		<p>
			カナ：

			<%
		if (hashmap != null && hashmap.get("name_kana") == "") {
		%>
			<span class="text-danger">入力してください</span>
			<%
			}
			%>
			<%
			if (hashmap != null && hashmap.get("name_kana") == "kana") {
			%>
			<span class="text-danger">カタカナで入力してください</span>
			<%
			}
			%>
			<span class="badge bg-danger">必須</span>
			<%
			if (hashmap != null) {
			%>
			<br> <input type="text" name="name_kana"
				value="<%=hashmap.get("name_kana")%>">
			<%
			} else {
			%>
			<br> <input type="text" name="name_kana">
			<%
			}
			%>

		</p>
		<p>
			表示名：

			<%
			if (hashmap != null && hashmap.get("nickname") == "") {
			%>
			<span class="text-danger">入力してください</span>
			<%
			}
			%>
			<span class="badge bg-danger">必須</span>
			<%
			if (hashmap != null) {
			%>
			<br> <input type="text" name="nickname"
				value="<%=hashmap.get("nickname")%>">
			<%
			} else {
			%>
			<br> <input type="text" name="nickname">
			<%
			}
			%>

		</p>
		<p>
			性別：<br> <input type="radio" name="sex" value="1" checked>男
			<input type="radio" name="sex" value="2">女 <input
				type="radio" name="sex" value="3">その他
		</p>
		<p>
			誕生日： <br>
			<%
			if (hashmap != null) {
			%>
			<input type="date" name="birthday"
				value="<%=hashmap.get("birthday")%>">
			<%
			} else {
			%>
			<input type="date" name="birthday">
			<%
			}
			%>
		</p>
		<p>
			郵便番号：
			<%
			if (hashmap != null && hashmap.get("zipcpde") != "") {
			%>
			<br>
			<input type="text" name="zipcode"
				value="<%=hashmap.get("zipcode")%>">
			<%
			} else {
			%>
			<%
			if (hashmap != null && hashmap.get("zipcpde") == "") {
			%>
			<span class="text-danger">半角数字で入力してください</span>
			<%
			}
			%>
			<br>
			<input type="text" name="zipcode">
			<%
			}
			%>
		</p>
		<p>
			住所：<br>
			<%
			if (hashmap != null) {
			%>
			<input type="text" name="address"
				value="<%=hashmap.get("address")%>">
			<%
			} else {
			%>
			<input type="text" name="address">
			<%
			}
			%>
		</p>
		<p>
			電話番号：
			<%
			if (hashmap != null && hashmap.get("tell") != "") {
			%>
			<br>
			<input type="tel" name="tell" value="<%=hashmap.get("tell")%>">
			<%
			} else {
			%>
			<%
			if (hashmap != null && hashmap.get("tell") == "") {
			%>
			
			<span class="text-danger">半角数字で入力してください</span>
			<%
			}
			%>
			<br>
			<input type="tel" name="tell">
			<%
			}
			%>
		</p>
		<p>
			メールアドレス： <br>
			<%
			if (hashmap != null) {
			%>
			<input type="email" name="email" value="<%=hashmap.get("email")%>">
			<%
			} else {
			%>
			<input type="email" name="email">
			<%
			}
			%>
		</p>
		<p>
			パスワード：
			<%
		if (hashmap != null && hashmap.get("pass") == "") {
		%>
			<span class="text-danger">入力してください</span>
			<%
			}
			%>
			<span class="badge bg-danger">必須</span> <br> <input
				type="password" name="pass" maxlength="20" id="ID_PASSWORD">
		</p>
		<p>
			パスワード再入力：
			<%
		if (hashmap != null && hashmap.get("pass2") == "") {
		%>
			<span class="text-danger">パスワードが一致しません</span>
			<%
			}
			%>
			<span class="badge bg-danger">必須</span> <br> <input
				type="password" name="pass2" maxlength="20">
		</p>
		<input type="submit" value="追加する" id="ID_SUBMIT">
	</form>
	<br>
	<%
	if (user_id == 1) {
	%>
	<a href="Admin">管理者トップへ</a>
	<br>
	<%
	}
	%>
	<%
	if (user_id == 0) {
	%>
	<a href="Login" class="btn">ログイン画面へ</a>
	<%
	}else{
	%>
	<a href="ExecuteLogout">ログアウトする</a>
	<%
	}
	%>
</body>
</html>
