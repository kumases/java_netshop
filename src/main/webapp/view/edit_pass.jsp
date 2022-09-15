<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="java.util.List"%>
<%--
-------------------------------------------------------------------------------------------------
■■■ファイル名：input_survey.jsp■■■
概要：JSP
詳細：HTML文書（回答入力画面）を出力する。
-------------------------------------------------------------------------------------------------
--%>

<%
//「users」テーブルからデータを抽出
List<UsersDto> list = (List<UsersDto>) request.getAttribute("USER_LIST");

%>

<html>
<head>
<title>パスワード変更</title>
</head>
<body   class="wrapper">
<%@ include file="header.jsp" %>
	<h2>登録情報変更</h2>

	<form action="UpdatePass" method="post"
		enctype='multipart/form-data'>
		<input type="hidden" name="id" value="<%=  userInfoOnSession.getUserId() %>">
		<p>
			現在のパスワード： 
			<br> 
			<input type="password" name="pass" maxlength="20">
		</p>
		<p>
			新しい： 
			<br> 
			<input type="password" name="new_pass" maxlength="20">
		</p>
		<p>
			確認用： 
			<br> 
			<input type="password" name="new_pass2" maxlength="20">
		</p>
		<input type="submit" value="変更する" id="ID_SUBMIT">
	</form>

	<br>
	<% 
	if(userInfoOnSession.getUserId() == 1) {
		%>
	<a href="AllUsersInfo">ユーザー一覧へ</a>
	<br>
	<%
	}else {
	%>
	<a href="UserInfo">登録情報画面</a>
	<br>
	<%
	}
	%>
	<footer>
	<%@ include file="footer.jsp" %>
	</footer>
</body>
</html>
