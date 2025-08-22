<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="include/header.jsp" %>
	<main class="container">
  <h2>2025년 여름 프로모션 안내</h2>
  <div class="notice-info">
    <p><strong>작성자:</strong> 관리자</p>
    <p><strong>작성일:</strong> 2025-08-20</p>
  </div>
  
  <div class="notice-content">
    <p>안녕하세요, 고객님들! 2025년 여름 프로모션이 시작됩니다. 이번 프로모션을 통해 다양한 혜택을 제공하니 많은 참여 부탁드립니다.</p>
    <p>• PC방 2시간 무료 이용권 제공  
    • 첫 방문 고객에게 음료 1잔 무료 제공  
    • 주말 할인 이벤트 등 다양한 혜택을 준비하였습니다.</p>
  </div>
  
  <button class="cta-button" onclick="goBack()">목록으로 돌아가기</button>
</main>

<script>
  function goBack() {
    window.history.back();
  }
</script>
	<%@ include file="include/footer.jsp" %>
</body>
</html>