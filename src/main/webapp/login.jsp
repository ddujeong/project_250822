<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
 <%
 String msg = (String) request.getAttribute("msg");
 String error = request.getParameter("msg");
 if(msg != null){
	 if("2".equals(msg)){
 		out.println("<script>alert('회원가입 성공! 로그인 해주세요')</script>");
	 }
 }if("4".equals(error)){
		 out.println("<script>alert('로그인 후 이용 가능합니다')</script>");
	 }
	 
%>    
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

  <form action="loginOk.do" method="POST" style="display: flex; flex-direction: column; gap: 15px;">
    <label for="userid">아이디</label>
    <input type="text" id="userid" name="user_id" required>

    <label for="password">비밀번호</label>
    <input type="password" id="password" name="user_pw" required>

    <button type="submit" class="cta-button">로그인</button>
    <c:if test="${param.msg == 1 }">
	    <p style="text-align: center; margin-top: 10px;">
	     아이디 또는 비밀번호가 잘못 입력 되었습니다.
	    </p>
    </c:if>
    <p style="text-align: center; margin-top: 10px;">
      계정이 없으신가요? <a href="signup.do">회원가입</a>
    </p>
  </form>
</main>

<%@ include file="include/footer.jsp" %>
</body>
</html>
