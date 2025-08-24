<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
session = request.getSession();
String user_id = null;
if (session == null ) {
	response.sendRedirect("login.jsp?msg=4");
	return;
}
user_id = (String) session.getAttribute("user_id");
if (user_id == null) {
	//request.setAttribute("msg", "4");
	response.sendRedirect("login.jsp?msg=4");
	return;
}
 %>
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
 	<button onclick="showSection('reservation')">예약 내역 확인</button>
    <button onclick="showSection('profile')">회원정보 수정</button>
    <button onclick="logout()">로그아웃</button>
    <button onclick="showSection('withdraw')">회원 탈퇴</button>
   
  </nav>

  <section id="reservation" class="mypage-section" style="display:none;">
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
    <form action="modifymember.do" method="post">
      <label for="user_id">아이디</label>
      <input type="text" id="user_id" name="user_id" value="${mDto.member_id}" required readonly="readonly">
      
      <label for="user_pw">비밀번호</label>
      <input type="password" id="user_pw" name="user_pw" value="${mDto.member_pw }">
      
      <label for="user_name">이름</label>
      <input type="text" id="user_name" name="user_name" value="${mDto.member_name }" required>

      <label for="user_email">이메일</label>
      <input type="email" id="user_email" name="user_email" value="${mDto.member_email }" required>

      <button type="submit" class="cta-button">수정하기</button>
    </form>
  </section>

  <section id="withdraw" class="mypage-section" style="display:none;">
    <h3>회원 탈퇴</h3>
    <p>정말로 회원 탈퇴를 진행하시겠습니까? 이 작업은 되돌릴 수 없습니다.</p>
    <form action="deletemember.do" method="post" onsubmit="return confirm('정말로 탈퇴하시겠습니까?');">
    <button type="submit" class="cta-button" style="background-color:#dc3545;">
      회원 탈퇴하기
    </button>
  </form>
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
    window.location.href = 'logout.do';
  }

  function confirmWithdrawal() {
    if (confirm('정말로 탈퇴하시겠습니까?')) {
      alert('회원 탈퇴가 완료되었습니다.');
      }
  }
  window.onload = () => {
	    showSection('reservation');
	  };
</script>



  <%@ include file="include/footer.jsp" %>
</body>
</html>
