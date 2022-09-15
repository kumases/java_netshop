<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="java.util.ArrayList"%>
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
<title>ユーザー情報</title>
</head>
<body   class="wrapper">
<%@ include file="header.jsp" %>
	<h2>登録情報</h2>
	<a href="Mypage" style="color: blue;">マイページ</a>
	<%
	if (list.size() != 0) {
		if (user_id == 1) {
	%>
	<br>
	<a href="AllUsersInfo">ユーザー一覧</a>
	<%
	}else{
	%>
	<%
	}
	%>
			<%
		for (int i = 0; i < list.size(); i++) {
			UsersDto dto = list.get(i);
		%>
	<div  style="width: 100%; text-align: center;">
			<%
			if (userInfoOnSession.getUserId() == 1) {
			%>
			<p class="ti">ID</p>
			<p><%=dto.getUserId()%></p>
			<%
			}
			%>
			<p class="ti">名前</p>
			<p><%=replaceEscapeChar(dto.getUserName())%></p>
			<p class="ti">ふりがな</p>
			<p><%=replaceEscapeChar(dto.getName_kana())%></p>
			<p class="ti">表示名</p>
			<p><%=replaceEscapeChar(dto.getNickname())%></p>
			<p class="ti">性別</p>
			<p>
			<%
			if(dto.getSex() ==1) {
			%>
			男
			<%
			}else if(dto.getSex() ==2) {
			%>
			女
			<%
			}else if(dto.getSex() ==3) {
			%>
			その他
			<%
			}
			%>
			</p>
			<p class="ti">誕生日</p>
			<%
			if (dto.getBirthday() != null && dto.getBirthday().length() != 0) {
			%>
			<p><%=dto.getBirthday()%></p>
			<%
			} else {
			%>
			<p>未登録</p>
			<%
			}
			%>
			<p class="ti">郵便番号</p>
			<%
			if (dto.getZipcode() != null && dto.getZipcode().length() != 0) {
			%>
				<p><%=replaceEscapeChar(dto.getZipcode())%></p>
			<%
			} else {
			%>
			<p>未登録</p>
			<%
			}
			%>
			<p class="ti">住所</p>
			<%
			if (dto.getAddress() != null && dto.getAddress().length() != 0) {
			%>
				<p><%=replaceEscapeChar(dto.getAddress())%></p>
			<%
			} else {
			%>
			<p>未登録</p>
			<%
			}
			%>
			<p class="ti">電話番号</p>
			<%
			if (dto.getTell() != null && dto.getTell().length() != 0) {
			%>
				<p><%=replaceEscapeChar(dto.getTell())%></p>
			<%
			} else {
			%>
			<p>未登録</p>
			<%
			}
			%>
			<p class="ti">メールアドレス</p>
			<%
			if (dto.getEmail() != null && dto.getEmail().length() != 0) {
			%>
				<p><%=replaceEscapeChar(dto.getEmail())%></p>
			<%
			} else {
			%>
			<p>未登録</p>
			<%
			}
			%>
			<%
			if (userInfoOnSession.getUserId() == 1) {
			%>
			<p class="ti">作成日</p>
			<p><%=dto.getTime()%></p>
			<%
			}
			%>
			<p class="ti">操作</p>
			<%
			if (userInfoOnSession.getUserId() == 1) {
			%>
				<p>
				<a href="Reviews?id=<%=dto.getUserId()%>">レビュー</a>&nbsp;
					<a href="EditUser?id=<%=dto.getUserId()%>">変更</a>&nbsp;
					<a href="DeleteUser?id=<%=dto.getUserId()%>">削除</a>
				</p>
			<%
			}else{
			%>
				<p>
					<a href="EditUser"> 変更 </a>
				</p>
			<%
			}
			}
			%>
</div>
	<%
	} else {
	%>
	<p>存在しません</p>
	<a href="ShowAllItems">一覧画面へ</a>
	<br>
	<%
	}
	%>
	<a href="ExecuteLogout">ログアウトする</a>
	<br>
	<br>
		<footer>
	<%@ include file="footer.jsp" %>
	</footer>
</body>
</html>

