<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <link rel="stylesheet" href="css/style.css">
<footer>
  <div class="footer-container">
    <div class="footer-about">
      <h3>🎮 EZPC</h3>
      <p>EZPC는 전국 어디서든 PC방 좌석을<br>쉽고 빠르게 예약할 수 있는 서비스입니다.</p>
    </div>

    <div class="footer-links">
      <h4>바로가기</h4>
      <ul>
        <li><a href="index.do">홈</a></li>
        <li><a href="reservation.do">좌석 예약</a></li>
        <li><a href="boardlist.do">게시판</a></li>
        <c:choose>
    	<c:when test="${not empty sessionScope.user_id }">
    		<li><a href="mypage.do">마이페이지</a></li>
    		<li><a href="logout.do">로그아웃</a></li>
    	</c:when>
    	<c:otherwise>
    	    <li><a href="login.do">로그인</a></li>
    	   	<li><a href="signup.do">회원가입</a></li>
    	</c:otherwise>
    </c:choose>
      </ul>
    </div>

    <div class="footer-contact">
      <h4>고객센터</h4>
      <p>📞 1588-1234<br>✉️ help@ezpc.com</p>
    </div>
  </div>

  <div class="footer-bottom">
    <p>&copy; 2025 EZPC. All rights reserved.</p>
  </div>
</footer>
