<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
      <link rel="stylesheet" href="css/style.css">
<header>
  <div class="logo">🎮 EZPC</div>
  <nav>
    <a href="index.do">홈</a>
    <a href="reservation.do">좌석 예약</a>
    <a href="notice.do?category=notice">공지사항</a>
    <a href="boardlist.do?category=general">게시판</a>
    <c:choose>
    	<c:when test="${not empty sessionScope.user_id }">
    		<a href="mypage.do">👤마이페이지</a>
    		<a href="logout.do">로그아웃</a>
    	</c:when>
    	<c:otherwise>
    	   	<a href="login.do">로그인</a>
    	   	<a href="signup.do">회원가입</a>
    	</c:otherwise>
    </c:choose>
  </nav>
</header>
