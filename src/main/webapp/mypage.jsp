<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>EZPC - 마이페이지</title>
</head>
<body>
<%@ include file="include/header.jsp" %>
 <main class="container mypage">
  <h2>마이페이지</h2>

  <nav class="mypage-nav">
    <button onclick="showSection('profile')">회원정보 수정</button>
    <button onclick="showSection('withdraw')">회원 탈퇴</button>
    <button onclick="logout()">로그아웃</button>
  </nav>

  <section id="reservation" class="mypage-section">
    <h3>예약 내역 확인</h3>
    <table class="reservation-table">
      <thead>
        <tr>
          <th>예약번호</th>
          <th>날짜</th>
          <th>시간</th>
          <th>좌석</th>
          <th>상태</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>20250822001</td>
          <td>2025-08-22</td>
          <td>14:00</td>
          <td>A1</td>
          <td>확정</td>
        </tr>
        <tr>
          <td>20250822002</td>
          <td>2025-08-23</td>
          <td>18:00</td>
          <td>B2</td>
          <td>취소</td>
        </tr>
      </tbody>
    </table>
  </section>

  <section id="profile" class="mypage-section" style="display:none;">
    <h3>회원정보 수정</h3>
    <form>
      <label for="username">이름</label>
      <input type="text" id="username" name="username" value="홍길동" required>

      <label for="email">이메일</label>
      <input type="email" id="email" name="email" value="hong@example.com" required>

      <label for="phone">전화번호</label>
      <input type="tel" id="phone" name="phone" value="010-1234-5678">

      <button type="submit" class="cta-button">수정하기</button>
    </form>
  </section>

  <section id="withdraw" class="mypage-section" style="display:none;">
    <h3>회원 탈퇴</h3>
    <p>정말로 회원 탈퇴를 진행하시겠습니까? 이 작업은 되돌릴 수 없습니다.</p>
    <button class="cta-button" style="background-color:#dc3545;" onclick="confirmWithdrawal()">회원 탈퇴하기</button>
  </section>
</main>

<script>
  function showSection(id) {
    document.querySelectorAll('.mypage-section').forEach(section => {
      section.style.display = section.id === id ? 'block' : 'none';
    });
  }

  function logout() {
    alert('로그아웃 되었습니다.');
    // 실제 로그아웃 처리 로직 추가
  }

  function confirmWithdrawal() {
    if (confirm('정말로 탈퇴하시겠습니까?')) {
      alert('회원 탈퇴가 완료되었습니다.');
      // 실제 탈퇴 처리 로직 추가
    }
  }
</script>



  <%@ include file="include/footer.jsp" %>
</body>
</html>
