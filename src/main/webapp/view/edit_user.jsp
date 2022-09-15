<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="java.util.List"%>
<%--
-------------------------------------------------------------------------------------------------
■■■ファイル名：input_survey.jsp■■■
概要：JSP
詳細：HTML文書（回答入力画面）を出力する。
-------------------------------------------------------------------------------------------------
--%>

<%
//「users」テーブルからデータを抽出
List<UsersDto> list = (List<UsersDto>) request.getAttribute("USER_LIST");
%>

<html>
<head>
<title>回答入力</title>
</head>
<body   class="wrapper">
<%@ include file="header.jsp" %>
	<h2>登録情報変更</h2>
<div  style="width: 100%; text-align: center;">
	<%
	if (list.size() != 0) {

		for (int i = 0; i < list.size(); i++) {
			UsersDto dto = list.get(i);
			int id = dto.getUserId();
			String name = dto.getUserName();
			String kana = dto.getName_kana();
			String nickname = dto.getNickname();
			int se = dto.getSex();
			String bi = dto.getBirthday();
			String zi = dto.getZipcode();
			String ad = dto.getAddress();
			String tl = dto.getTell();
			String mail = dto.getEmail();
			String pass = dto.getPassWord();
	%>
	<form action="UpdateUserInfo" method="post"
		enctype='multipart/form-data' id="edit_user">
		<input type="hidden" name="id" value="<%=id%>">
		<p>
			名前：<br> <input type="text" name="name" required data-error_placement="#nameerror" value="<%=replaceEscapeChar(name)%>">
			<br><span id="nameerror" ></span>
		</p>
		<p>
			かな：<br> <input name='name_kana' id="kana" type="text"  required data-error_placement="#kanaerror" value="<%=replaceEscapeChar(kana)%>">
			<br><span id="kanaerror" ></span>
		</p>
		<p>
			nickname： <br> <input type="text" name="nickname"
				value="<%=replaceEscapeChar(nickname)%>">
		</p>
		<p>
			性別：<br> <label><input type="radio" name="sex" value="1"
				<%if (se == 1) {%> checked <%}%>>男</label> <label><input
				type="radio" name="sex" value="2" <%if (se == 2) {%> checked <%}%>>女</label>
			<label><input type="radio" name="sex" value="3"
				<%if (se == 3) {%> checked <%}%>>その他</label>
		</p>
		<p>
			誕生日：<br> <input type="date" name="birthday" <%if(bi !=null){ %>value="<%=bi%>" <%} %>>
		</p>
		<p>
			<label for="zipcode">郵便番号：</label>
			<br>
			<input type="text" name="zipcode" id="zipcode" required data-error_placement="#ziperror"<%if(zi !=null){ %>value="<%=replaceEscapeChar(zi)%>"<%} %>>
			<br><span id="ziperror" ></span>
		</p>
		<p>
			住所：<br> <input type="text" name="address" <%if(ad !=null){ %>value="<%=replaceEscapeChar(ad)%>"<%} %>>
		</p>
		<p>
			電話番号：<br> <input type="tel" name="tell" <%if(tl !=null){ %>value="<%=replaceEscapeChar(tl)%>"<%} %>>
		</p>
		<p>
			メールアドレス： <br> 
			<input type="email" name="email" <%if(mail !=null){ %>value="<%=replaceEscapeChar(mail)%>"<%} %>>
		</p>
		<p>
			パスワード：
			<%
		if (userInfoOnSession.getUserId() == id) {
		%>
			<a href="EditPass">変更</a>
			<%
			}
			%>
			<br> <input type="password" name="pass" maxlength="20"
				id="ID_PASSWORD" value="<%=pass%>" readonly>
		</p>
		<input type="submit" value="変更する">
	</form>
	<%
	}
	%>
	</div>
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
	<a href="AllUsersInfo">ユーザー一覧へ</a>
	<br>
	<%
	} else {
	%>
	<a href="UserInfo">登録情報画面</a>
	<br>
	<%
	}
	%>

	<footer>
	<%@ include file="footer.jsp" %>
	</footer>
<script src="node_modules/jquery/dist/jquery.min.js"></script>
<script src="node_modules/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="js/validate.js"></script>
</body>
</html>
