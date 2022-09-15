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
String param = request.getParameter("id");
int id = Integer.parseInt(param);
%>
<%
List<ReviewsSelectDto> list = (List<ReviewsSelectDto>) request.getAttribute("REVIEWS_LIST");
%>

<html>
<head>
<title>レビュー</title>
</head>
<body   class="wrapper">
<%@ include file="header.jsp" %>
	<h2>レビュー</h2>

	<%
	if (list.size() != 0) {
	%>

	<a href="ShowAllItems">一覧画面へ</a>
	<a href="Detail?id=<%= id %>">詳細画面へ</a>
	<a href="InputReview?id=<%= id %>">レビューを書く</a>
	
評価 (平均
		<%
		double average = 0;
		int n = 0;
		for ( int i = 0; i < list.size(); i++) {
			ReviewsSelectDto dto = list.get(i);
			average += dto.getReviews_star();
			n++;
		}
		average = average/n;
		%>
		<%= average %>
		)
		

		<%
		for (int j = 0; j < list.size(); j++) {
			ReviewsSelectDto dto = list.get(j);
		%>
<div class="msg" style="width:100%; word-wrap: break-word;">
            <p style="border-top:solid 2px lightgray;">ユーザー名：<%=replaceEscapeChar(dto.getUsers_nickname())%><br></p>
            <p>コメント<br><%=replaceEscapeChar(dto.getReviews_comment())%></p>
            <p>評価<%=dto.getReviews_star() %></p>
            <p class="day"><%=dto.getCreatedtime() %></p>

            <%
			if(dto.getReviews_user_id() == userInfoOnSession.getUserId() || userInfoOnSession.getUserId() == 1) {
			%>
			<P>
			<a href="DeleteReview?id=<%=dto.getReviews_item_id()%>" class="btn btn-danger"  onclick="return confirm('削除しますか?')">削除</a>
			</p>
			<%
			}
			%>
</div>

    		<%
		}
		%>
	<%
	} else {
	%>
	<p>レビューはありません</p>
	<a href="InputReview?id=<%= id %>">レビューを書く</a>
	<br>
	<a href="Detail?id=<%= id %>">詳細画面へ</a>
	<br>
	<%
	}
	%>
	<footer>
	<%@ include file="footer.jsp" %>
	</footer>
</body>
</html>

