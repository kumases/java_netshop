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
List<InqueriesDto> list = (List<InqueriesDto>) request.getAttribute("INQUERIES");
%>

<html>
<head>
<title>お問い合わせ履歴</title>
</head>
<body   class="wrapper">
<%@ include file="header.jsp" %>
	<h2>お問い合わせ履歴</h2>

	<%
	if (list.size() != 0) {
	%>

		<%
		for (int i = 0; i < list.size(); i++) {

			InqueriesDto dto = list.get(i);
		%>
		<hr>
		<p>お問い合わせ内容<br>
		<%= replaceEscapeChar(dto.getInquery_post()) %>
		</p>
		<p>お問い合わせ日時<br>
		<%= dto.getTime() %>
		</p>
		<%
		}
		%>
	<%
	} else {
	%>
	<p>お問い合わせはありません</p>
	<%
	}
	%>
	<footer>
	<%@ include file="footer.jsp" %>
	</footer>
</body>
</html>

