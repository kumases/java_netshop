<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List"      %>
<%@ page import="model.CartSelectDto"      %>
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
String param = request.getParameter("id");
int id = Integer.parseInt(param);
%>

<html>
<head>
  <meta charset="UTF-8">
  <title>完了</title>
</head>
<body>
  <p>カートに追加しました。</p>
  <br>
  <a href="Detail?id=<%= id %>">OK</a>
  <br>
   <a href="CartItemShow">カートへ</a>
   <a href="ShowAllItems">TOPに戻る</a>
</body>
</html>

