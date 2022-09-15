<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.InqueriesDto"%>
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
%>
<%
//「inqueries」テーブルからデータを抽出
List<InqueriesDto> list = (List<InqueriesDto>) request.getAttribute("ALL_INQUERIES_LIST");
%>

<html>
<head>
<title>お問い合わせ一覧</title>
</head>
<body>
	<h2>お問い合わせ一覧</h2>
	<a href="ShowAllItems" style="color: blue">商品一覧</a>
	<%
	if (list.size() != 0) {
	%>
	<br>
	<a href="Admin">お問い合わせ一覧</a>
	<table style="width: 100%;">
		<tr bgcolor="#c0c0c0"
			style="postion: -webkit-sticky; position: sticky; top: 0;">
			<%
			if (userInfoOnSession.getUserId() == 1) {
			%>
			<th>ID</th>
			<%
			}
			%>
			<th>名前</th>
			<th>メールアドレス</th>
			<th>お問い合わせ内容</th>

			<%
			if (userInfoOnSession.getUserId() == 1) {
			%>
			<th>問い合わせ日</th>
			<th>操作</th>
			<%
			}
			%>

		</tr>
		<%
		for (int i = 0; i < list.size(); i++) {
			InqueriesDto dto = list.get(i);
		%>

		<tr>
			<%
			if (userInfoOnSession.getUserId() == 1) {
			%>
			<td>
				<p style="width: 100%; text-align: center"><%=dto.getId()%></p>
			</td>
			<%
			}
			%>
			<td>
				<p style="width: 100%; text-align: center">
					<a href="UserInfo?id=<%=dto.getId()%>"> <%=replaceEscapeChar(dto.getName())%>
					</a>
				</p>
			</td>
			<%
			if (dto.getEmail() != null && dto.getEmail().length() != 0) {
			%>
			<td>
				<p style="width: 100%; text-align: center"><%=replaceEscapeChar(dto.getEmail())%></p>
			</td>
			<%
			} else {
			%>
			<td></td>
			<%
			}
			%>
			<td>
				<p style="width: 100%; text-align: center"><%=replaceEscapeChar(dto.getInquery_post())%></p>
			</td>
			<%
			if (userInfoOnSession.getUserId() == 1) {
			%>
			<td>
				<p style="width: 100%; text-align: center"><%=dto.getTime()%></p>
			</td>
			<td>
				<p style="text-align: center">
					<a href="InputAnswer?id=<%=dto.getId()%>">回答</a>&nbsp; 
					<a href="DeleteInquery?id=<%=dto.getId()%>"  onclick="return confirm('削除しますか?')">削除</a>
				</p>
			</td>
			<%
			}
			%>

			<%
			}
			%>
		</tr>
	</table>
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
</body>
</html>

<%!/**----------------------------------------------------------------------*
						 *■■■replaceEscapeCharクラス■■■
						 *概要：文字列データのエスケープを行う
						 *----------------------------------------------------------------------**/
	String replaceEscapeChar(String inputText) {

		String charAfterEscape = inputText; //エスケープ後の文字列データ

		// 「&」を変換
		charAfterEscape = charAfterEscape.replace("&", "&amp;");
		// 「<」を変換
		charAfterEscape = charAfterEscape.replace("<", "&lt;");
		// 「>」を変換
		charAfterEscape = charAfterEscape.replace(">", "&gt;");
		// 「"」を変換
		charAfterEscape = charAfterEscape.replace("\"", "&quot;");
		// 「'」を変換
		charAfterEscape = charAfterEscape.replace("'", "&#039;");

		return charAfterEscape;
	}%>
