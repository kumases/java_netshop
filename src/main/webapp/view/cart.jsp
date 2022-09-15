<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.CartSelectDto"%>
<%--
-------------------------------------------------------------------------------------------------
■■■ファイル名：input_survey.jsp■■■
概要：JSP
詳細：HTML文書（回答入力画面）を出力する。
-------------------------------------------------------------------------------------------------
--%>

<%
List<CartSelectDto> list = (List<CartSelectDto>) request.getAttribute("ALL_ITEMS_LIST");
%>

<html>
<head>
<title>カート</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body  class="wrapper">
<%@ include file="header.jsp" %>
	<h2>カート画面です</h2>

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
			<th style="width: 18%">数量</th>
			<th style="width: 18%">合計金額</th>
			<th style="width: 10%">編集</th>

		</tr>
		<%
		int total = 0;
		for (int i = 0; i < list.size(); i++) {

			CartSelectDto dto = list.get(i);
		%>

		<tr>
			<%
			if (dto.getItems_picture() != null && dto.getItems_picture().length() != 0) {
			%>
			<td><a href="Detail?id=<%=dto.getCart_item_id()%>"><img
					style="width: 100%"
					src="view/img/<%=replaceEscapeChar(dto.getItems_picture())%>"></a></td>
			<%
			} else {
			%>
			<td>
			<a href="Detail?id=<%=dto.getCart_item_id()%>"><img style="width: 100%" class="img-wrap" src="view/img/noimage.png"></a></td>
			<%
			}
			%>
			<td><p style="width: 100%; text-align: center"><%=replaceEscapeChar(dto.getItems_name())%></p></td>
			<td><p style="width: 100%; text-align: center"><%=dto.getItems_price()%>円
				</p>
				</td>
			<td>
			<div style="display:flex; text-align: center">
				<p style="text-align:center;width: 50%"><%=dto.getCart_number()%>個
				</p>
				<form action="UpdateStock?id=<%= dto.getCart_item_id() %>" method="post">
				<div>
				</div>
					<select name="number">
					<%for (int j = 1; j <= dto.getItems_stock(); j++) { 
					if(dto.getCart_number() == j) {
					%>
					<option value="<%= j %>" selected><%= j %></option>
					<%
					}else{
					 %>
					 <option value="<%= j %>"><%= j %></option>
					<%
					}
					}
					%>
					</select>
					<br>
					<input type="submit" value="変更" style="text-align:left">
					</form>
				</div>
			</td>
			<td><p style="width: 100%; text-align: center"><%=dto.getItems_price() * dto.getCart_number()%>円
				</p></td>
			<td>
			
			<p style="width: 100%; text-align: center"><a href="DeleteCart?id=<%=dto.getCart_item_id()%>"  onclick="return confirm('削除しますか?')">削除</a></p>
			</td>
		</tr>
		<%
		total += dto.getItems_price() * dto.getCart_number();
		}
		%>
	</table>
	<div style="display:flex; max-width:100%;">
	<div style="width:80%;">
	<form action="BuyCheck" method="post" style="display: flex">
		<input type="submit" value="購入内容確認" class="btn btn-success" style="width:100%">
	</form>
	</div>
	<div style="width:20%;vertical-align:top;text-align: center">
	<b>
		計<%=total%>円
	</b>
	</div>
	</div>
	<%
	} else {
	%>
	<p>カートに商品がありません</p>
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

