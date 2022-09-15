<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.ItemsDto"%>
<%@ page import="model.ReviewsSelectDto"%>
<%@ page import="java.util.Optional"%>
<%@ page import="model.ItemsDto"%>
<%--
-------------------------------------------------------------------------------------------------
■■■ファイル名：input_survey.jsp■■■
概要：JSP
詳細：HTML文書（回答入力画面）を出力する。
-------------------------------------------------------------------------------------------------
--%>


<%
//「items」テーブルからデータを全件抽出
List<ItemsDto> list = (List<ItemsDto>)request.getAttribute("ITEMS_LIST");
List<ReviewsSelectDto> list2 = (List<ReviewsSelectDto>) request.getAttribute("REVIEWS_LIST");
String param = request.getParameter("id");
int id = Integer.parseInt(param);
String message =null;
message = request.getParameter("message");
%>

<html>
<head>
<title>回答入力</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body class="wrapper detail-body">
	<%@ include file="header.jsp"%>
	<h2>詳細画面です</h2>

	<%
	if(list.size() > 0) {
%>

	<a href="CartItemShow">カートへ</a>
		<p>
			<a href="ShowAllItems">一覧画面へ</a>
		</p>
	<%
for (int i = 0; i < list.size(); i++) {
	ItemsDto dto = list.get(i);
%>
<div class="s_main">
		<div class="shouhin_img">
			<% if(dto.getPicture() != null && dto.getPicture().length() != 0) { %>
			<a href="Detail?id=<%= dto.getId() %>"><img style="width: 100%"
				src="view/img/<%= replaceEscapeChar(dto.getPicture()) %>"></a>
			<% }else{ %>
			<a href="Detail?id=<%= dto.getId() %>"><img style="width: 100%"
				class="img-wrap" src="view/img/noimage.png"></a>
			<%} %>
		</div>
		
		<span class="shousai_name">
			<p class="s-name">
				商品名：<%= replaceEscapeChar(dto.getName()) %></p>
			<table>
				<tr>
					<td>価格：</td>
					<td class="price"><%= dto.getPrice() %>円</td>
				</tr>
			</table>
				<%
				if(list.size() > 0) {
					%>
				
					<%
				for (int j = 0; j < list.size(); j++) {
				ItemsDto dto1 = list.get(j);
				if(dto1.getStock()>0) {
				%>
				在庫：
					<%=dto.getStock()%>個
				<br>個数
				<form action="Cartin?id=<%= id %>" method="post">
				<select name="number">
				<%
				for(int k = 1; k<=dto1.getStock();k++) {
				%>
				<option value="<%= k  %>"><%= k  %></option>
				<%
				}
				%>
				</select>
				<br>
				<input type="submit" value="カートに入れる" id="ID_SUBMIT"
					class="btn btn-success">
				</form>
				
				<%
				if(message != null) {
				if(message.equals( "saccess")) {
				%>
				
						追加しました
				<%
					}
				if(message.equals("already")) {
				%>
						追加済
				<%
					}		
				}
				%>
				<%
					}else{
				%>
					<p style="color: red">在庫がありません</p>
				<%
					}
				}
				%>
				

			<br>
			<form action="AddFavorite?id=<%= id %>" method="POST">
				<button type="submit" name="favorite_button" class="btn btn-warning">お気に入りに追加</button>
			</form>


			<hr>
			<h5>商品説明</h5>
			<%
			if (dto.getSetumei() != null && dto.getSetumei().length() != 0) {
			%>
					<p><%=replaceEscapeChar(dto.getSetumei())%></p>
					<%
			} else {
			%>
					<p>商品説明はありません</p>
					<%
			}
			%>
					<hr>
					<h5 style="margin-top: 20px">商品詳細</h5>
					<%
			if (dto.getSyousai() != null && dto.getSyousai().length() != 0) {
			%>
					<p style="width: 100%;"><%=replaceEscapeChar(dto.getSyousai())%></p>
					<%
			} else {
			%>
					<p>商品詳細はありません</p>
					<%
			}
			}
			}
				%>
		</div>
	</span>
	
	<div style="dispray: block">
	<div>

		<!-- 商品レビューを表示 -->
		<br> <p>レビュー</p><a type="button"
			href="ShowReviews?id=<%= id %>" class="btn btn-success">一覧</a>

		<%
	if (list2.size() != 0) {
		double average = 0;
		int n = 0;
		for ( int a = 0; a < list2.size(); a++) {
			ReviewsSelectDto dto2 = list2.get(a);
			average += dto2.getReviews_star();
			n++;
		}
		average = average/n;
	
	%>
		評価平均
		<%= average %>
		<br>
		<br> <a href="InputReview?id=<%= id %>">レビューを書く</a> <br>
		<br>
		<%
		int num = 0;
		if (list2.size() <= 3) {
			num = 3;
		} else {
			num = list2.size();
		}
		for (int i = 0; i < list2.size(); i++) {
			ReviewsSelectDto dto = list2.get(i);
		%>
		<div class="msg" style="width: 100%; word-wrap: break-word;">
			<p style="border-top: solid 2px lightgray;">
				ユーザー名：<%=replaceEscapeChar(dto.getUsers_nickname())%></p>
			<p>
				コメント<br>
			</p>
			<% 
            if(dto.getReviews_comment() == null) { 
            %>
			<p>なし</p>
			<% 
              }else { 
              %>
			<p>
				<%=replaceEscapeChar(dto.getReviews_comment())%>
			</p>
			<%
               }
               %>
			<p>
				評価<%=dto.getReviews_star()%>&nbsp&nbsp&nbsp<%=dto.getCreatedtime()%></p>

			<%
			if (dto.getReviews_user_id() == userInfoOnSession.getUserId() || userInfoOnSession.getUserId() == 1) {
			%>
			<p>
				<a href="DeleteReview?id=<%=dto.getReviews_item_id()%>"
					class="btn btn-danger" onclick="return confirm('削除しますか?')">削除</a>
			</p>
			<%
			}
		}
			%>

			<br>
		</div>
	</div>
	<%
	} else {
	%>
	<p>レビューはありません</p>
	<a href="InputReview?id=<%=id%>">レビューを書く</a>
	<br>
	<%
	
	}
}else{
	%>
	商品は削除されたかURLが間違っています。
	<p>
		<a href="ShowAllItems">一覧画面へ</a>
	</p>
	<%
}
	
%>
	</div>


	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>

