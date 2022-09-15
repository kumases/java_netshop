<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%--
-------------------------------------------------------------------------------------------------
■■■ファイル名：login.jsp■■■
概要：JSP
詳細：HTML文書（ログイン画面）を出力する。
-------------------------------------------------------------------------------------------------
--%>

<html>
<head>
  <title>ログイン画面</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
  <link rel="stylesheet" type="text/css" href="./css/styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div  class="lgbody">
  <h1>ログイン</h1>
  <div class="lgform">
  <form action="ExecuteLogin" method="post">
    <p style="font-size:1.1em">名前：<br>
      <input type="text" name="USER_NAME" maxlength="20" id="ID_USER_NAME">
    </p>
    <p style="font-size:1.1em">パスワード：<br>
      <input type="password" name="PASSWORD" maxlength="20" id="ID_PASSWORD"> 
    </p>
    <input type="submit" value="ログイン" id="ID_SUBMIT">
  </form>
  </div>
  <br><br>
  <p><a href='InputUser' class="btn" style="background-color:black;color:white">新規登録</a></p>
  <br>
  <p><a href='ShowAllItems' class="btn" style="background-color:black;color:white">商品一覧</a><p>
</div>
  <script type="text/javascript" src="js/login.js"></script>
</body>
</html>
