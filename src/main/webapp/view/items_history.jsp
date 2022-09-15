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

%>

<%
UsersDto userInfoOnSession = (UsersDto) session.getAttribute("LOGIN_INFO");
String userName = userInfoOnSession.getNickname();
int user_id = userInfoOnSession.getUserId();
//「items」テーブルからデータを全件抽出
List<ItemsDto> list = (List<ItemsDto>)request.getAttribute("ALL_ITEMS_LIST");
String param = request.getParameter("search");
String serch = null;
serch = request.getParameter("search");
%>

<html>
<head>
<title>TOP</title>
  <link rel="stylesheet" type="text/css" href="./css/style.css">
  <link rel="stylesheet" type="text/css" href="./css/styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="wrapper">

	<div class="title_header">
    <h1 class="title"><a href="ShowAllItems">HOGEHOGE SHOP</a></h1>
</div>
<div class="header_list">




    <div class="serch">
        <div class="header-message">
            <div class="header-message-left">
                <p><span><%= userName %></span>&nbsp;さん、おかえりなさい</p>

        <br>
        	<a href="ExecuteLogout" style="color: white;">ログアウトする</a>
            </div>
            <div class="header-message-right">
                <form action="ItemsHistory" method="get">
                    <% if (serch != null) { %>
                        <input type="text" class="text_box" name="search" maxlength="100" value="<%= replaceEscapeChar(serch) %>">
                    <%}else{ %>
                        <input type="text" class="text_box" name="search" maxlength="100" placeholder="商品名を入力してください">
                    <% } %>
                        <button type="submit" class="btn btn-warning" id="serch_button">検索🔍</button>
                </form>
                    </div>
            </div>
        </div>

        <div class="header-link mr-10">
    	<% 
        if(user_id == 1) {
        %>
			<br>
			<p><a href="Admin" style="color: white;">管理画面へ</a></p>
		<%
        }
        %>
			<br>
			<p><a href="ShowHistory" style="color: white">購入履歴</a></p>
			<p><a href="CartItemShow"  style="color: white;">カート</a></p>
			<p><a href="ShowFavorite"  style="color: white;">お気に入り</a></p>
			<p><a href="Mypage" style="color: white;">マイページ</a></p>
        </div>
    </div>

	<h2>商品情報</h2>
	<div style="display:flex">
	<form action="ItemsHistory<%if(param !=null && param.length() !=0) { %>?search=<%= param %> <%} %>" method="post">
	<select name="order">
		<option value="asc">値段が低い順</option>
		<option value="desc">値段が高い順</option>
	</select>
	<input type="submit" value="適用">
	</form>
	<p class="btn btn-secondary" style="margin-left:auto;text-align:right"><a href="InputItem" style=" color:white">商品追加</a></p>
	</div>
	<table style="width: 100%;">
		<tr bgcolor="#c0c0c0"
			style="postion: -webkit-sticky; position: sticky; top: 0;">
			<th style="width: 10%">登録日</th>
			<th style="width: 10%">商品画像</th>
			<th style="width: 15%">名前</th>
			<th style="width: 15%">価格</th>
			<th style="width: 15%">在庫</th>
			<% 
        if(user_id == 1) {
        %>
			<th style="width: 10%">編集</th>
			<%
        }
        %>

		</tr>
		<%
for (int i = 0; i < list.size(); i++) {
	ItemsDto dto = list.get(i);
%>

		<tr>
			<td><p style="width: 100%; text-align: center"><%= dto.getTime() %>
				</p></td>
			<% if(dto.getPicture() != null && dto.getPicture().length() != 0) { %>
			<td><a href="Detail?id=<%= dto.getId() %>"><img
					style="width: 40%"
					src="view/img/<%= replaceEscapeChar(dto.getPicture()) %>"></a></td>
			<% }else{ %>
			<td><a href="Detail?id=<%= dto.getId() %>"><img
					style="width: 40%" class="img-wrap" src="view/img/noimage.png"></a></td>
			<%} %>
			<td><p style="width: 100%; text-align: center"><%= replaceEscapeChar(dto.getName()) %></p></td>
			<td><p style="width: 100%; text-align: center"><%= dto.getPrice() %>円
				</p></td>
			<td><p style="width: 100%; text-align: center"><%= dto.getStock() %>個
				</p></td>
			<% 
        if(user_id == 1) {
        %>
			<td><p style="width: 100%; text-align: center">
					<a href="EditItem?id=<%=dto.getId()%>">編集</a>
					<a href="DeleteItem?id=<%=dto.getId()%>" onclick="return confirm('削除しますか?')">削除</a>
				</p></td>
			<%
        }
        %>
		</tr>
		<%
}
%>
	</table>
	<footer>
	<%@ include file="footer.jsp" %>
	</footer>
</body>
</html>
<%!
/**----------------------------------------------------------------------*
 *■■■replaceEscapeCharクラス■■■
 *概要：文字列データのエスケープを行う
 *----------------------------------------------------------------------**/
String replaceEscapeChar(String inputText) {

	String charAfterEscape = inputText ; //エスケープ後の文字列データ

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
}
%>
