<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.FavoriteSelectDto"%>
<%--
-------------------------------------------------------------------------------------------------
■■■ファイル名：input_survey.jsp■■■
概要：JSP
詳細：HTML文書（回答入力画面）を出力する。
-------------------------------------------------------------------------------------------------
--%>

<%
List<FavoriteSelectDto> list = (List<FavoriteSelectDto>) request.getAttribute("ALL_FAVORITE_LIST");
%>

<html>
<head>
<title>お気に入り</title>
</head>
<body   class="wrapper">
<%@ include file="header.jsp" %>
	<h2>お気に入り</h2>

	<%
	if (list.size() != 0) {
	%>
	
	<a href="ShowAllItems">一覧画面へ</a>
	<table style="width: 100%">
		<tr bgcolor="#c0c0c0"
			style="postion: -webkit-sticky; position: sticky; top: 0;">
			<th style="width: 18%">商品画像</th>
			<th style="width: 18%">名前</th>
			<th style="width: 18%">価格</th>
			<th style="width: 18%">登録日</th>
			<th style="width: 10%">編集</th>

		</tr>
		<%
		int total = 0;
		for (int i = 0; i < list.size(); i++) {

			FavoriteSelectDto dto = list.get(i);
		%>

		<tr>
			<%
			if (dto.getItems_picture() != null && dto.getItems_picture().length() != 0) {
			%>
			<td><a href="Detail?id=<%=dto.getFavorite_item_id()%>"><img
					style="width: 100%"
					src="view/img/<%=replaceEscapeChar(dto.getItems_picture())%>"></a></td>
			<%
			} else {
			%>
			<td><a href="Detail?id=<%=dto.getFavorite_item_id()%>"><img
					style="width: 100%" class="img-wrap" src="view/img/noimage.png"></a></td>
			<%
			}
			%>
			<td><p style="width: 100%; text-align: center"><%=replaceEscapeChar(dto.getItems_name())%></p></td>
			<td><p style="width: 100%; text-align: center"><%=dto.getItems_price()%>円</p></td>
			<td><p style="width: 100%; text-align: center"><%=dto.getTime() %></p></td>
			<td><p style="width: 100%; text-align: center"><a href="DeleteFavorite?id=<%=dto.getFavorite_item_id()%>"  onclick="return confirm('削除しますか?')">削除</a></p></td>
		</tr>
		<%
		}
		%>
	</table>

	<%
	} else {
	%>
	<p>お気に入りに商品がありません</p>
	<a href="ShowAllItems">一覧画面へ</a>
	<br>
	<%
	}
	%>
	<footer>
	<%@ include file="footer.jsp" %>
	</footer>
</body>
</html>

