<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 String msg = (String) request.getAttribute("msg");
 if(msg != null){
 	if("1".equals(msg)) {
	     out.println("<script>alert('이미 존재하는 아이디입니다.');window.history.go(-1);</script>");
	 } else {
 	    out.println("<script>alert('회원가입 실패');window.history.go(-1);</script>");
 	}
 }
%>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>EZPC - 회원가입</title>
</head>
<body>
<%@ include file="include/header.jsp" %>

<main class="container" style="max-width: 500px; margin: 0 auto;">
  <h2>📝 회원가입</h2>

  <form action="signupOk.do" method="POST" style="display: flex; flex-direction: column; gap: 15px;">
    <label for="name">이름</label>
    <input type="text" id="name" name="member_name" required>

    <label for="userid">아이디</label>
    <input type="text" id="userid" name="member_id" required>

    <label for="password">비밀번호</label>
    <input type="password" id="password" name="member_pw" required>

    <label for="email">이메일</label>
    <input type="email" id="email" name="member_email" required>

    <button type="submit" class="cta-button">회원가입</button>
    <p style="text-align: center; margin-top: 10px;">
      이미 계정이 있으신가요? <a href="login.jsp">로그인</a>
    </p>
  </form>
</main>

<%@ include file="include/footer.jsp" %>
</body>
</html>
