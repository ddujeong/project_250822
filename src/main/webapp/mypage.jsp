<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
    
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
          <th></th>
          <th>예약번호</th>
          <th>날짜</th>
          <th>시간</th>
          <th>좌석</th>
          <th>예약시간</th>
        </tr>
      </thead>
      <tbody>
      <c:if test="${not empty rDtos}">
      <c:forEach var="rDto" items="${rDtos }">
        <tr>
          <td>
 		 <label class="pretty-radio">
   			 <input type="radio" name="reservationSelect"  value="${rDto.rnum}" />
   		 	<span class="radio-circle"></span>
 		 </label>
		  </td>
          <td>${rDto.rnum }</td>
          <td>${rDto.rdate }</td>
          <td>${rDto.rtime }</td>
          <td>${rDto.seat }</td>
          <td>${rDto.createtime }</td>
        </tr>
       </c:forEach>
       </c:if>
       <c:if test="${empty rDtos}">
  <tr><td colspan="5">예약 내역이 없습니다.</td></tr>
</c:if>
      </tbody>
    </table>
    <div style="text-align: right; margin-top: 20px;">
  <button onclick="cancelReservation()" class="cta-button" style="background-color: #e74c3c;">
    예약 취소
  </button>
</div>
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
  function cancelReservation() {
 	 const selected = document.querySelector('input[name="reservationSelect"]:checked');
	  if (!selected) {
	    alert("취소할 예약을 선택해주세요.");
	    return;
	  }

	  const rnum = selected.value;
	  // 쿼리스트링으로 이동
	  window.location.href = "deleteReservation.do?rnum=" + encodeURIComponent(rnum);
		}
</script>



  <%@ include file="include/footer.jsp" %>
</body>
</html>
