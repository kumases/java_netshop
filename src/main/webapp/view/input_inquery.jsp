<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="model.InqueriesDto"%>

<%--
-------------------------------------------------------------------------------------------------
■■■ファイル名：input_survey.jsp■■■
概要：JSP
詳細：HTML文書（回答入力画面）を出力する。
-------------------------------------------------------------------------------------------------
--%>


<html>
<head>
<title>お問い合わせ</title>
</head>
<body   class="wrapper" style="text-align:center">
<%@ include file="header.jsp" %>
	<h2>お問い合わせ画面</h2>
	<form action="AddInquery" method="post" enctype='multipart/form-data' id="inquery_form">
		<p>
			名前：<br> <input type="text" name="name"value="<%= replaceEscapeChar(userInfoOnSession.getUserName()) %>" readonly>
		</p>
		<p>
			メールアドレス： <br> <input type="email" name="email" <%if(userInfoOnSession.getEmail() !=null){ %>value="<%= replaceEscapeChar(userInfoOnSession.getEmail()) %>" readonly<%} %>>
		</p>
		<p>
			お問い合わせ内容(255文字まで)：
			<br> <textarea name="inquery" style="width:500px;height:200px" onkeyup="ShowLength(value);"></textarea>
		</p>
		<p id="inputlength">0文字</p>
		<input type="submit" value="決定" id="ID_SUBMIT">
	</form>
	<br>
	<footer>
	<%@ include file="footer.jsp" %>
	</footer>
	<script src="node_modules/jquery/dist/jquery.min.js"></script>
<script src="node_modules/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="js/validate.js"></script>
<script type="text/javascript">
function ShowLength( str ) {
	if(str.length < 256) {
	   document.getElementById("inputlength").innerHTML = str.length + "文字";
		}else{
			document.getElementById("inputlength").innerHTML = "<p style='color:red'>" + str.length + "文字"  +"</p>";
			}
	}
	</script>
</body>
</html>
