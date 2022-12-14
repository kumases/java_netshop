<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="model.InqueriesAndAnswerDto"%>

<%--
-------------------------------------------------------------------------------------------------
■■■ファイル名：input_survey.jsp■■■
概要：JSP
詳細：HTML文書（回答入力画面）を出力する。
-------------------------------------------------------------------------------------------------
--%>
<%
//「inqueries」テーブルからデータを抽出
List<InqueriesAndAnswerDto> list = (List<InqueriesAndAnswerDto>) request.getAttribute("INQUERIES_LIST");
String param = request.getParameter("id");
int id = Integer.parseInt(param);
%>

<html>
<head>
<title>お問い合わせ回答</title>
</head>
<body   class="wrapper" style="text-align:center">
<%@ include file="header.jsp" %>
	<h2>お問い合わせ回答</h2>
	
	<%
	    String answer = null;
		for (int i = 0; i < list.size(); i++) {
			InqueriesAndAnswerDto dto = list.get(i);
		%>
		<p>
			名前：<%= replaceEscapeChar(dto.getName()) %>
		</p>
		<p>
			メールアドレス：<%if(dto.getEmail() !=null && dto.getEmail().length() != 0){ %><%= replaceEscapeChar(dto.getEmail()) %><%} %>
		</p>
		<p>
			問い合わせ内容：<br>
			<span style="overflow-wrap:break-word;inline-size: 500px;">
			<%if(dto.getInquery_post() !=null && dto.getInquery_post().length() != 0){ %><%= replaceEscapeChar(dto.getInquery_post()) %><%} %>
			</span>
		</p>
		<%if(dto.getMessage() != null) { answer = dto.getMessage(); } %>
		
		<%
		}
		
		%>
		 <%if(answer != null) { %>
		<form action="UpdateAnswer?id=<%= id %>" method="post">
		<p>回答：
			<br> <textarea name="message" style="width:500px;height:200px" onkeyup="ShowLength(value);"><%=answer%></textarea>
		</p>
		<p id="inputlength"><%=answer.length()%>文字</p>
		<input type="submit" value="変更" id="ID_SUBMIT">
	</form>
	<%
	} else {
	%>
	<form action="AddAnswer?id=<%= id %>" method="post">
		<p>回答：
			<br> <textarea name="message" style="width:500px;height:200px" onkeyup="ShowLength(value);"></textarea>
		</p>
		<p id="inputlength">0文字</p>
		<input type="submit" value="決定" id="ID_SUBMIT">
	</form>
	<%}%>
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
