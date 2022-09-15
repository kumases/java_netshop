<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="model.ItemsDto"%>
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
String userName = userInfoOnSession.getNickname();
int user_id = userInfoOnSession.getUserId();
List<ItemsDto> list = (List<ItemsDto>) request.getAttribute("ITEM_LIST");
String param = request.getParameter("search");
String serch = null;
serch = request.getParameter("search");
String param2 = request.getParameter("id");
int id = Integer.parseInt(param2);
%>
<%
	if (list.size() != 0) {
		for (int i = 0; i < list.size(); i++) {
			ItemsDto dto = list.get(i);
			String name = dto.getName();
			int price = dto.getPrice();
			int stock = dto.getStock();
			String se = dto.getSetumei();
			String syo = dto.getSyousai();
			String pi = dto.getPicture();
	%>
<html>
<head>
<title>回答入力</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
  <link rel="stylesheet" type="text/css" href="./css/styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body   class="wrapper">
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
                <form action="UpdateItem" method="POST">
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
	<h2>商品追加</h2>
	<form action="UpdateItem" method="post" enctype='multipart/form-data' id="item_form">
	<input type="hidden" name="id" value="<%=id%>">
		<p>
			名前： <input type="text" name="name" value="<%=replaceEscapeChar(name)%>">
		</p>
		<p>
			値段： <input type="number" name="price" maxlength="5" value="<%=price %>">
		</p>
		<p>
			在庫数： <input type="number" name="stock" maxlength="5" value="<%=stock %>">
		</p>
		<p>
			商品説明：<br>
			<textarea name="setumei" rows="4" cols="50" maxlength="250"><% if(se != null) { %><%=replaceEscapeChar(se)%><%} %></textarea>
		</p>
		<p>
			商品詳細：<br>
			<textarea name="syousai" rows="4" cols="50" maxlength="250"><% if(syo != null) { %><%=replaceEscapeChar(syo)%><%} %></textarea>
		</p>
		<p>
			商品画像： <input type="file" name="picture" >
		</p>
		<input type="submit" value="変更する">
	</form>
	<br>
	<a href="Admin">管理者トップへ</a>
	<br>
	<a href="ExecuteLogout">ログアウトする</a>
	<%
	}
	%>
	<%
	} else {
	%>
	<p>存在しません</p>
	<a href="ShowAllItems">一覧画面へ</a>
	<br>
	<%
	}
	%>
	<br>
	<%
	if (userInfoOnSession.getUserId() == 1) {
	%>
	<a href="ItemsHistory">商品一覧へ</a>
	<br>
	<%
	} else {
	%>
	<a href="UserInfo">登録情報画面</a>
	<br>
	<%
	}
	%>
<script src="node_modules/jquery/dist/jquery.min.js"></script>
<script src="node_modules/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="js/validate.js"></script>
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