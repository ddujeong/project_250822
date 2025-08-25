<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>EZPC - 예약 완료</title>
</head>
<body>
  <%@ include file="include/header.jsp" %>
 
  <main class="container" style="text-align: center;">
    <h2>✅ 예약이 완료되었습니다!</h2>
    <h3>✅ ${rDto.member_id }님 예약목록</h3>
    <div style="margin-top: 30px; font-size: 1.1em;">
      <p><strong>예약 날짜:</strong> ${rDto.rdate }</p>
      <p><strong>예약 시간:</strong> ${rDto.rtime }</p>
      <p><strong>선택한 좌석:</strong> ${rDto.seat }</p>
    </div>

    <div style="margin-top: 40px;">
      <a href="index.do" class="cta-button">홈으로</a>
      <a href="reservation.do" class="cta-button" style="margin-left: 10px;">다시 예약하기</a>
      <a href="mypage.do" class="cta-button" style="margin-left: 10px; font-size: 1em;">예약 확인하기</a>
    </div>
  </main>

  <%@ include file="include/footer.jsp" %>
</body>
</html>
