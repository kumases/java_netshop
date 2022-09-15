<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.ItemsDto"%>
<%@ page import="model.UsersDto"%>
<%--
-------------------------------------------------------------------------------------------------
■■■ファイル名：input_survey.jsp■■■
概要：JSP
詳細：HTML文書（回答入力画面）を出力する。
-------------------------------------------------------------------------------------------------
--%>
<%
UsersDto userInfoOnSession = (UsersDto) session.getAttribute("LOGIN_INFO");
String userName ="ゲスト";
int user_id =0;
if(userInfoOnSession != null) {
userName = userInfoOnSession.getNickname();
user_id = userInfoOnSession.getUserId();
}
String serch = null;
serch = request.getParameter("search");
%>

<html>
<head>
  <link rel="stylesheet" type="text/css" href="./css/style.css">
  <link rel="stylesheet" type="text/css" href="./css/styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<div class="title_header">
    <h1 class="title"><a href="ShowAllItems">HOGEHOGE SHOP</a></h1>
</div>
<div class="header_list">

    <div class="serch">
        <div class="header-message">
                <p><span><%= userName %></span>&nbsp;さん、おかえりなさい</p>
        	

            <div class="header-message-right">
                <form action="ShowAllItems" method="get">
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

    	<% 
        if(user_id == 1) {
        %>
			<p><a href="Admin" style="color: white;">管理画面へ</a></p>
		<%
        }
        %>
        <div class="header-link">
			<p><a href="ShowHistory" style="color: white">購入履歴</a></p>
			<p><a href="CartItemShow"  style="color: white;">カート</a></p>
			<p><a href="ShowFavorite"  style="color: white;">お気に入り</a></p>
			<p><a href="Mypage" style="color: white;">マイページ</a></p>
			<%
			if(userInfoOnSession != null) {
			%>
			<a href="ExecuteLogout" style="color: white;">ログアウト</a>
			<%
			}
			%>
        </div>
    </div>


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