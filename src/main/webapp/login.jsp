<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>EZPC - 로그인</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<%@ include file="include/header.jsp" %>

<main class="container" style="max-width: 400px; margin: 0 auto;">
  <h2>🔐 로그인</h2>

  <form action="loginOk.jsp" method="POST" style="display: flex; flex-direction: column; gap: 15px;">
    <label for="userid">아이디</label>
    <input type="text" id="userid" name="userid" required>

    <label for="password">비밀번호</label>
    <input type="password" id="password" name="password" required>

    <button type="submit" class="cta-button">로그인</button>
    <p style="text-align: center; margin-top: 10px;">
      계정이 없으신가요? <a href="signup.jsp">회원가입</a>
    </p>
  </form>
</main>

<%@ include file="include/footer.jsp" %>
</body>
</html>
