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
<title>注文確定</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
 <link rel="stylesheet" type="text/css" href="./css/styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="skaku txt_w">
	<h2>確定画面です</h2>
	<%
	UsersDto userInfoOnSession = (UsersDto) session.getAttribute("LOGIN_INFO");
		int total = 0;
		for (int i = 0; i < list.size(); i++) {
			CartSelectDto dto = list.get(i);
			total += dto.getItems_price() * dto.getCart_number();
		}
		%>
  <div>
    <div class="kakutei_title">
      <h1 style="margin-top:20px"><span>ご購入ありがとう</span><span>ございました</span></h1>
    </div>
    <div class="kingaku">
      <p>お支払合計金額は</p>
      <p><span class="money"><%=total%></span>円です</p>
    </div>
  <div class="jouhou">

    <p>お客様登録情報</p>

      <p>名前<br>
      <%= userInfoOnSession.getUserName() %>さん
      </p>
      <p>住所<br>
      <%= userInfoOnSession.getAddress() %>
      </p>
      <p>電話番号<br>
      <%= userInfoOnSession.getTell() %>
      </p>
      <p>メールアドレス<br>
      <%= userInfoOnSession.getEmail() %>
      </p>
    </div>

    <div class="tyukoku" style="color:red">
      <p>3日以内に支払いをお願いします</p>
      <p>お問い合わせはサポートダイヤルへ(XXX-XXXX-XXXX）</p>
    </div>

    <div  class="top_button" >
      <a href="ShowAllItems" class="modoru">トップに戻る</a>
    </div>
  </div>





</body>
</html>

