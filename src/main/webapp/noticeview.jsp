<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<%@ include file="include/header.jsp" %>
	<main class="container">
  <h2>${bDto.btitle }</h2>
  <div class="notice-info">
    <p><strong>작성자:</strong> ${bDto.memberDto.member_name }</p>
    <p><strong>작성일:</strong> ${bDto.bdate }</p>
  </div>
  
  <div class="notice-content">
    <p> ${bDto.bcontent } </p>
  </div>
  
  <button class="cta-button" onclick="goBack()">목록으로 돌아가기</button>
  <c:if test="${sessionScope.user_id == 'admin'}">
       <a href="contentmodify.do?bnum=${bDto.bnum }">
        <button class="cta-button edit-button">수정</button></a>
       <a href="delete.do?bnum=${bDto.bnum }">
        <button class="cta-button delete-button" onclick="alert('삭제하시겠습니까?')" >삭제</button></a>
        </c:if>
</main>

<script>
  function goBack() {
    window.history.back();
  }
</script>
	<%@ include file="include/footer.jsp" %>
</body>
</html>