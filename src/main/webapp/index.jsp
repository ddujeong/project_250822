<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>EZPC - PC방 좌석 예약</title>
</head>
<body>
 <%@ include file="include/header.jsp" %>

   <section class="hero">
    <div class="hero-content">
      <h1>🎮 EZPC - 전국 PC방 좌석 예약 서비스</h1>
      <p>복잡한 현장 대기 없이 원하는 시간, 원하는 좌석 예약 완료!</p>
      <a href="reservation.do"><button class="cta-button">지금 좌석 예약하기</button></a>
    </div>
  </section>

  <!-- ✅ 서비스 소개 -->
  <section class="info-section">
    <h2>EZPC는 어떤 서비스인가요?</h2>
    <p>
      EZPC는 전국의 제휴된 PC방에서 실시간 좌석 예약이 가능한 온라인 플랫폼입니다.<br>
      모바일, 태블릿, 데스크탑 어디서든 편리하게 좌석을 예약하세요.
    </p>
  </section>

  <!-- ✅ 기능 미리보기 -->
  <section class="features">
    <div class="feature-box">
      <h3>💺 좌석 예약</h3>
      <p>사용자 친화적인 좌석 배치도에서 원하는 좌석을 선택하고 예약하세요.</p>
    </div>
    <div class="feature-box">
      <h3>📝 자유 게시판</h3>
      <p>유저들과 게임 정보, 추천 PC방, 후기 등을 자유롭게 공유해보세요.</p>
    </div>
    <div class="feature-box">
      <h3>🔐 회원 시스템</h3>
      <p>로그인하고 내 예약 내역을 확인하거나, 선호 좌석을 설정해보세요.</p>
    </div>
  </section>


<%@ include file="include/footer.jsp" %>
</body>
</html>
