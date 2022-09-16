<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.ReviewsSelectDto"%>
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
String param = request.getParameter("id");
int id = Integer.parseInt(param);

List<ReviewsSelectDto> list = (List<ReviewsSelectDto>) request.getAttribute("ALL_REVIEWS_LIST");
%>

<html>
<head>
<title>レビュー</title>
</head>
<body>
	<h2>レビュー</h2>

	<%
	if (list.size() != 0) {
	%>

	<a href="Admin">管理画面</a>

	<table style="width: 100%">
		<tr bgcolor="#c0c0c0"
			style="postion: -webkit-sticky; position: sticky; top: 0;">
			<th style="width: 18%">商品名</th>
			<th style="width: 18%">投稿者</th>
			<th style="width: 18%">評価</th>
			<th style="width: 18%">コメント</th>
			<th style="width: 18%">登録日</th>
			<th style="width: 10%">編集</th>

		</tr>
		<%
		int n =id;
		for (int i = 0; i < list.size(); i++) {
			if(n+((n-1)*10)-1 <= i  && i<= 10*n+n) {
			ReviewsSelectDto dto = list.get(i);
		%>

		<tr>
			<td><p style="width: 100%; text-align: center"><a href="Detail?id=<%= dto.getReviews_item_id() %>"><%=replaceEscapeChar(dto.getItems_name())%></a></p></td>
			<td><p style="width: 100%; text-align: center"><%=replaceEscapeChar(dto.getUsers_nickname())%></p></td>
			<td><p style="width: 100%; text-align: center"><%=dto.getReviews_star() %></p></td>
			<td><p style="width: 100%; text-align: center"><%=replaceEscapeChar(dto.getReviews_comment())%></p></td>
			<td><p style="width: 100%; text-align: center"><%=dto.getCreatedtime() %></p></td>
			<%
			if(dto.getDeletedtime() == null) {
			%>
			<td><p style="width: 100%; text-align: center"><a href="DeleteReview?id=<%=dto.getReviews_item_id()%>&uid=<%=dto.getReviews_user_id()%>"  onclick="return confirm('削除しますか?')">削除</a></p></td>
			<%
			}else{
			%>
			<td><p style="width: 100%; text-align: center">削除済み</p></td>
			<%
			}
			%>
		</tr>
		<%
			}
		}
		%>
	</table>

	<%
	} else {
	%>
	<p>レビューはありません</p>
	<%
	}
	%>
	<%
	int a = 0;
	while ( a < list.size()) {
		a++;
	}
	%>
	<br>
	<div style="text-align:center">
	<%
	int x = a/10+1;
	for(int y=1;x>y;y++){
		%>
		<a href="ShowAllReviews?id=<%=y %>"><%=y %></a>
	<%
	}
	%>
	</div>
	<br><br>
	<a href="ExecuteLogout">ログアウトする</a>
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
