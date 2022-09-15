<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.UsersDto"%>
<%@ page import="model.ReviewsDto"%>

<%--
-------------------------------------------------------------------------------------------------
■■■ファイル名：input_review.jsp■■■
概要：JSP
詳細：HTML文書（回答入力画面）を出力する。
-------------------------------------------------------------------------------------------------
--%>

<%
String param = request.getParameter("id");
int id = Integer.parseInt(param);
%>

<html>
<head>
<title>レビュー投稿</title>
</head>
<body   class="wrapper">
<%@ include file="header.jsp" %>
	<h2>レビュー投稿</h2>
	<a href="Detail?id=<%= id %>">戻る</a>
              <form action="AddReview?id=<%= id %>" method="post" id="review_form">
                  <dl>
                      <dt><%= replaceEscapeChar(userInfoOnSession.getUserName())%>さん、メッセージをどうぞ</dt>
                      <dd>
                      <p>255文字まで入力できます。</p>
                          <textarea name="comment" cols="50" rows="5" onkeyup="ShowLength(value);"></textarea>
                         <p id="inputlength">0文字</p>
                      </dd>
                  </dl>
                  <div class="kutikomi_butotn">
                  <p>評価</p>
                      1<input type="range" name="star" min="1" max="100" value="100" id="range"> 100
                      <br>
                      <span id="value">100</span>
                  <div>
                  <br>
                          <button type="submit"class="btn btn-success">投稿する</button>

                  </div>
                    </div>
                </form>
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

var elem = document.getElementById('range');
var target = document.getElementById('value');
var rangeValue = function (elem, target) {
  return function(evt){
    target.innerHTML = elem.value;
  }
}
elem.addEventListener('input', rangeValue(elem, target));
	</script>
  
</body>
</html>
