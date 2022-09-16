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
//セッションからユーザーデータを取得
UsersDto userInfoOnSession = (UsersDto) session.getAttribute("LOGIN_INFO");
%>
<%
//「users」テーブルからデータを抽出
List<UsersDto> list = (List<UsersDto>) request.getAttribute("ALL_USERS_LIST");
%>

<html>
<head>
<title>ユーザー一覧</title>
<style type="text/css">
 td, th {
    border-bottom: 1px solid black;
}
</style>
</head>
<body>
	<h2>一覧</h2>
	<a href="ShowAllItems" style="color: blue">商品一覧</a>
	<%
	if (list.size() != 0) {
	%>
	<br>
	<a href="Admin">管理者トップ</a>
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
			<th>ふりがな</th>
			<th>表示名</th>
			<th>性別</th>
			<th>誕生日</th>
			<th>郵便番号</th>
			<th>住所</th>
			<th>電話番号</th>
			<th>メールアドレス</th>
			<%
			if (userInfoOnSession.getUserId() == 1) {
			%>
			<th>登録日</th>
			<th>操作</th>
			<%
			}
			%>

		</tr>
		<%
		for (int i = 0; i < list.size(); i++) {
			UsersDto dto = list.get(i);
		%>
		<tr>
			<%
			if (userInfoOnSession.getUserId() == 1) {
			%>
			<td>
				<p style="width: 100%; text-align: center"><%=dto.getUserId()%></p>
			</td>
			<%
			}
			%>
			<td>
				<p style="width: 100%; text-align: center">
					<a href="UserInfo?id=<%=dto.getUserId()%>"> <%=replaceEscapeChar(dto.getUserName())%>
					</a>
				</p>
			</td>
			<td>
				<p style="width: 100%; text-align: center"><%=replaceEscapeChar(dto.getName_kana())%></p>
			</td>
			<td>
				<p style="width: 100%; text-align: center"><%=replaceEscapeChar(dto.getNickname())%></p>
			</td>
			<td>
				<p style="width: 100%; text-align: center">
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
			</td>
			<%
			if (dto.getBirthday() != null && dto.getBirthday().length() != 0) {
			%>
			<td>
				<p style="width: 100%; text-align: center"><%=dto.getBirthday()%></p>
			</td>
			<%
			} else {
			%>
			<td></td>
			<%
			}
			%>
			<%
			if (dto.getZipcode() != null && dto.getZipcode().length() != 0) {
			%>
			<td>
				<p style="width: 100%; text-align: center"><%=replaceEscapeChar(dto.getZipcode())%></p>
			</td>
			<%
			} else {
			%>
			<td></td>
			<%
			}
			%>
			<%
			if (dto.getAddress() != null && dto.getAddress().length() != 0) {
			%>
			<td>
				<p style="text-align: center ;width: 300px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"><%=replaceEscapeChar(dto.getAddress())%></p>
			</td>
			<%
			} else {
			%>
			<td></td>
			<%
			}
			%>
			<%
			if (dto.getTell() != null && dto.getTell().length() != 0) {
			%>
			<td>
				<p style="width: 100%; text-align: center"><%=replaceEscapeChar(dto.getTell())%></p>
			</td>
			<%
			} else {
			%>
			<td></td>
			<%
			}
			%>
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
			<%
			if (userInfoOnSession.getUserId() == 1) {
			%>
			<td>
				<p style="width: 100%; text-align: center"><%=dto.getTime()%></p>
			</td>
			<td>
				<p style="text-align: center">
					<a href="Reviews?id=<%=dto.getUserId()%>">レビュー</a>
					<a href="EditUser?id=<%=dto.getUserId()%>">変更</a>&nbsp; 
					<a href="DeleteUser?id=<%=dto.getUserId()%>"  onclick="return confirm('削除しますか?')">削除</a>
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
